# rust-godot-libp2p
lib p2p and tracker torrent for godot

# proyecto libp2p en rust 
https://github.com/libp2p/rust-libp2p.git

# proyecto torrent
https://github.com/Aayushman00/bittorrent-rust-client.git

# proyecto gdext godot rust 
https://github.com/godot-rust/gdext.git




libp2p godot is a plugin for Godot, it works on torrent v1 over http for now and uses libp2p, only supporting ipfs peers for now. The torrents have to be created by users since the idea is to use trackers as relays and find peers, preventing abuse and respecting the tracker's timings. This is not designed for cryptography or peer-to-peer protocols; that is taken care of by thot-p2p for Godot, where once the peers are known according to their own protocols of dissemination and interference.
