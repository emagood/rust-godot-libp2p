use godot::prelude::*;

struct RustExtension;

#[gdextension]
unsafe impl ExtensionLibrary for RustExtension {}

// quitar con confianza si compila

//mod fileseek;
mod player;
//mod filencoder;
//mod toolgd;
//mod peerseed;
mod peerinfo;


mod state;
mod torrent;
//mod utils;
