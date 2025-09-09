use godot::prelude::*;

struct RustExtension;

#[gdextension]
unsafe impl ExtensionLibrary for RustExtension {}

//TODO: quitar con confianza si compila


mod Peergodot;
mod player;
mod peerinfo;
mod state;
mod kadipfs;
