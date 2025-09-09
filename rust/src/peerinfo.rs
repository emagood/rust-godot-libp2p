use godot::prelude::*;
use godot::classes::{Node, RandomNumberGenerator, FileAccess};
use godot::classes::file_access::ModeFlags;
use godot::builtin::{PackedByteArray, StringName, GString};
use once_cell::sync::Lazy;

//use crate::torrent::peer;
//use crate::torrent::peer;
use std::fs;
use std::io::{self, Write};
use std::path::Path;
//use crate::state::globals::{GLOBAL_IPS, VEC_DATA, DOWNLOADED_DATA, GLOBAL_ARRAY};
use crate::state::{GLOBAL_IPS, VEC_DATA, DOWNLOADED_DATA, GLOBAL_ARRAY,GLOBAL_HTTP,IP_IPFS , ID_IPFS };




use crate::kadipfs::kad;
//use torrent::peer;

/*
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
use tracing_subscriber::EnvFilter;
*/



#[derive(GodotClass)]
#[class(base=Node)]
pub struct Peerinfo {
    base: Base<Node>,
}

#[godot_api]
impl INode for Peerinfo {
    fn init(base: Base<Node>) -> Self {
         godot_print!("Archivo leídos peer imnfo ");
        Self { base }
    }
}

#[godot_api]
impl Peerinfo {

//probando las malditas señales
 #[godot_api(signals)]
    #[signal]
    fn speed_increased();
    #[signal]
    fn ips_actualizadas(data: GString);
    #[signal]
    fn http_actualizado(data: GString);

    #[signal]
    fn ips_ipfs(data: GString);
    #[signal]
    fn IDs_ipfs(data: GString);


    #[func]
    pub fn generate_random_8byte_number(&self) -> PackedByteArray {
        let mut number = PackedByteArray::new();
        let mut rng = RandomNumberGenerator::new_gd();
        let my_seed = StringName::from("tsmdomtext").hash() as u64;
        rng.set_seed(my_seed);
        for _ in 0..8 {
            number.push(rng.randi_range(0, 255) as u8);
        }
        number
    }


    #[func]
    fn generate_numbers(&self, count: i64) -> PackedByteArray {
    let mut numbers = PackedByteArray::new();
    let mut rng = RandomNumberGenerator::new_gd();
    let my_seed = StringName::from("tsmdomtext").hash() as u64;
    rng.set_seed(my_seed);

    let count = count.clamp(1, 1024) as usize;  //1024 números

    for _ in 0..count {
        numbers.push(rng.randi_range(0, 255) as u8);
    }

    numbers
    }




    #[func]
    fn obtener_tamano_archivo(&self, path: GString) -> u64 {
        // Intenta abrir el archivo en modo lectura (nota el 'mut' aquí)
        let mut file = match FileAccess::open(&path, ModeFlags::READ) {
            Some(f) => f,
            None => {
                godot_error!("No se pudo abrir el archivo: {}", path);
                return 0;
            }
        };

        // Obtiene el tamaño del archivo
        let length = file.get_length();
        file.close();
        length
    }


   #[func]
    pub fn run_ipfs(&self) -> PackedByteArray {
        godot_print!("run ipfs se ejecuta ");
        kad::run_libp2p_kad_flow();

        let mut number = PackedByteArray::new();
        let mut rng = RandomNumberGenerator::new_gd();
        let my_seed = StringName::from("tsmdomtext").hash() as u64;
        rng.set_seed(my_seed);
        for _ in 0..8 {
            number.push(rng.randi_range(0, 255) as u8);
        }
        number
    }






  /*   #[func]
    pub fn teststring(&self, bytes: PackedByteArray) -> GString {
        // Corregimos la conversión a GString

            GString::from("[BYTES INVALIDOS]")
        
    }


*/



#[func]
fn get_ipfs(&mut self) -> GString {
    let ips = match IP_IPFS.lock() {
        Ok(i) => i,
        Err(_) => return GString::from("[ERROR DE MUTEX IPs]"),
    };

    let ids = match ID_IPFS.lock() {
        Ok(h) => h,
        Err(_) => return GString::from("[ERROR DE MUTEX IPFS]"),
    };

    let ip_str = if ips.is_empty() {
        "[SIN IPs]".to_string()
    } else {
        format!("IPs actuales: {}", ips.join(", "))
    };

    let idpf_str = if ids.is_empty() {
        "[SIN IDs]".to_string()
    } else {
        format!("IDs parseado: {}", ids.join(", "))
    };

    let resultado = GString::from(format!("{}\n{}", ip_str, idpf_str));


    self.base_mut().emit_signal("ips_ipfs", &[GString::from(ip_str).to_variant()]);
    self.base_mut().emit_signal("IDs_ipfs", &[GString::from(idpf_str).to_variant()]);

    resultado
}




}