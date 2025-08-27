use godot::prelude::*;

struct RustExtension;

#[gdextension]
unsafe impl ExtensionLibrary for RustExtension {}

//TODO: quitar con confianza si compila


mod Peergodot;
mod player;
mod kadipfsgodot;
mod peerinfo;
mod state;
mod torrent;
mod kadipfs;
