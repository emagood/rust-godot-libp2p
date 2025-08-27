
use crate::state::{VEC_DATA,IP_IPFS , ID_IPFS };
use std::{
    num::NonZeroUsize,
    ops::Add,
    time::{Duration, Instant},
};

use anyhow::{bail, Result};
use futures::StreamExt;
use libp2p::{
    bytes::BufMut,
    identity, kad, noise,
    swarm::{StreamProtocol, SwarmEvent},
    tcp, yamux, PeerId, Swarm,
};
use libp2p::Multiaddr;
use libp2p::identity::PublicKey;
use libp2p::kad::{RecordKey, QueryResult, Event, PeerRecord};
use tracing_subscriber::EnvFilter;

//use crate::state::{VEC_DATA, DOWNLOADED_DATA, GLOBAL_ARRAY, GLOBAL_IPS ,GLOBAL_HTTP };

/*
use libp2p::kad::{RecordKey, QueryResult, Event};
use libp2p::identity::PublicKey;
use libp2p::Swarm;
use anyhow::{bail, Result};
use futures::StreamExt;

*/
const BOOTNODES: [&str; 4] = [
    "QmNnooDu7bfjPFoTZYxMNLWUQJyrVwtbZg5gBMjTezGAJN",
    "QmQCU2EcMqAqQPR2i9bChDtGNJchTbq5TbXJJ16u19uLTa",
    "QmbLHAnMoJPWSCR5Zhtx6BHJX9KiKNN6tpvbUcqanj75Nb",
    "QmcZf59bWwK5XFi76CZX8cbJ4BhTzzA3gU1ZjYZcYW3dwt",
];

const IPFS_PROTO_NAME: StreamProtocol = StreamProtocol::new("/ipfs/kad/1.0.0");

#[tokio::main]
pub async fn run_libp2p_kad_flow() -> Result<()> {
   /*
    tracing_subscriber::fmt()
        .with_env_filter(EnvFilter::from_default_env())
        .try_init()
        .ok();
*/
    let local_key = identity::Keypair::generate_ed25519();
    let mut swarm = build_swarm(&local_key)?;

    let target_peer = PeerId::random();
    let peers = get_peer(&mut swarm, target_peer).await?;
    println!("Peers encontrados: {:?}", peers);
    for (peer_id, addrs) in peers {
        ID_IPFS.lock().unwrap().push(peer_id.to_string() + ":" );
        println!("Peer: {peer_id}");
        for addr in addrs {
            IP_IPFS.lock().unwrap().push(addr.to_string() + ":" );
            println!("  → {}", addr);
        }
    }

    put_pk_record(&mut swarm, &local_key).await?;
 // luego verifico esta vaina 
    verify_pk_record(&mut swarm, &local_key.public()).await?;


    Ok(())
}
 /// es como un tracker no toy seguro 
fn build_swarm(
    local_key: &identity::Keypair,
) -> Result<Swarm<kad::Behaviour<kad::store::MemoryStore>>> {
    let mut cfg = kad::Config::new(IPFS_PROTO_NAME);
    cfg.set_query_timeout(Duration::from_secs(5 * 60));
    let store = kad::store::MemoryStore::new(local_key.public().to_peer_id());

    let behaviour = kad::Behaviour::with_config(local_key.public().to_peer_id(), store, cfg);

    let mut swarm = libp2p::SwarmBuilder::with_existing_identity(local_key.clone())
        .with_tokio()
        .with_tcp(
            tcp::Config::default(),
            noise::Config::new,
            yamux::Config::default,
        )?
        .with_dns()?
        .with_behaviour(|_| behaviour)?
        .build();

    for peer in &BOOTNODES {
        swarm
            .behaviour_mut()
            .add_address(&peer.parse()?, "/dnsaddr/bootstrap.libp2p.io".parse()?);
    }

    Ok(swarm)
}


// peer
async fn get_peer(
    swarm: &mut Swarm<kad::Behaviour<kad::store::MemoryStore>>,
    target_peer_id: PeerId,
) -> Result<Vec<(PeerId, Vec<Multiaddr>)>> {
    println!("Buscando peers cercanos a: {target_peer_id}");
    swarm.behaviour_mut().get_closest_peers(target_peer_id);

    loop {
        match swarm.select_next_some().await {
            SwarmEvent::Behaviour(kad::Event::OutboundQueryProgressed {
                result: kad::QueryResult::GetClosestPeers(Ok(ok)),
                ..
            }) => {
                if ok.peers.is_empty() {
                    bail!("La consulta terminó sin peers cercanos.")
                }

                let peers: Vec<(PeerId, Vec<Multiaddr>)> = ok
                    .peers
                    .into_iter()
                    .map(|info| (info.peer_id, info.addrs))
                    .collect();

                return Ok(peers);
            }
            SwarmEvent::Behaviour(kad::Event::OutboundQueryProgressed {
                result: kad::QueryResult::GetClosestPeers(Err(_)),
                ..
            }) => bail!("La consulta de peers cercanos expiró."),
            _ => {}
        }
    }
}



//registro llave 
async fn put_pk_record(
    swarm: &mut Swarm<kad::Behaviour<kad::store::MemoryStore>>,
    local_key: &identity::Keypair,
) -> Result<()> {
    println!("Insertando PK record en el DHT");

    // Construir la clave del registro
    let mut pk_record_key = vec![];
    pk_record_key.put_slice("/pk/".as_bytes());
    pk_record_key.put_slice(swarm.local_peer_id().to_bytes().as_slice());

    // Serializar la clave pública
    let pk_bytes = local_key.public().encode_protobuf();

    // Decodificar para inspección
    let pk_decoded = PublicKey::try_decode_protobuf(&pk_bytes)?;

    // Mostrar información antes de insertar
    println!("🔐 Registro PK:");
    println!("  → PeerId: {}", swarm.local_peer_id());
    println!("  → Clave: /pk/{}", swarm.local_peer_id());
    println!("  → Tipo de clave: {:?}", pk_decoded.key_type());
    println!("  → Bytes serializados: {:?}", pk_bytes);
    println!("  → Expira en: 60 segundos");

    // Construir el registro
    let mut pk_record = kad::Record::new(pk_record_key, pk_bytes);
    pk_record.publisher = Some(*swarm.local_peer_id());
    pk_record.expires = Some(Instant::now().add(Duration::from_secs(60)));

    // Insertar en el DHT
    swarm
        .behaviour_mut()
        .put_record(pk_record, kad::Quorum::N(NonZeroUsize::new(3).unwrap()))?;

    // Esperar confirmación
    loop {
        match swarm.select_next_some().await {
            SwarmEvent::Behaviour(kad::Event::OutboundQueryProgressed {
                result: kad::QueryResult::PutRecord(Ok(_)),
                ..
            }) => {
                println!("✅ PK record insertado exitosamente");
                return Ok(());
            }
            SwarmEvent::Behaviour(kad::Event::OutboundQueryProgressed {
                result: kad::QueryResult::PutRecord(Err(err)),
                ..
            }) => bail!(anyhow::Error::new(err).context("❌ Error al insertar el PK record")),
            _ => {}
        }
    }
}


//verifico la llave



   async fn verify_pk_record(
    swarm: &mut Swarm<kad::Behaviour<kad::store::MemoryStore>>,
    expected_pk: &PublicKey,
) -> Result<()> {
    println!("🔍 Verificando PK record en el DHT");

    let mut pk_record_key = vec![];
    pk_record_key.put_slice(b"/pk/");
    pk_record_key.put_slice(swarm.local_peer_id().to_bytes().as_slice());

    swarm
        .behaviour_mut()
        .get_record(RecordKey::new(&pk_record_key));

    loop {
        match swarm.select_next_some().await {
            SwarmEvent::Behaviour(Event::OutboundQueryProgressed {
                result: QueryResult::GetRecord(Ok(ok)),
                ..
            }) => {
                if let kad::GetRecordOk::FoundRecord(peer_record) = ok {
                    let record = peer_record.record;

                    if record.key.to_vec() != pk_record_key {
                        bail!("❌ La clave del registro no coincide");
                    }

                    let decoded = PublicKey::try_decode_protobuf(&record.value)?;
                    if decoded == *expected_pk {
                        println!("✅ PK record verificado correctamente");
                        return Ok(());
                    } else {
                        bail!("❌ El PK record no coincide con la clave esperada");
                    }
                } else {
                    println!("ℹ️ Variante no reconocida en GetRecordOk: {:?}", ok);
                }
            }
            SwarmEvent::Behaviour(Event::OutboundQueryProgressed {
                result: QueryResult::GetRecord(Err(err)),
                ..
            }) => bail!(anyhow::Error::new(err).context("❌ Error al consultar el PK record")),
            _ => {}
        }
    }
}
