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
use crate::state::{GLOBAL_IPS, VEC_DATA, DOWNLOADED_DATA, GLOBAL_ARRAY,GLOBAL_HTTP};



use crate::torrent::peer;
//use torrent::peer;

#[derive(GodotClass)]
#[class(base=Node)]
pub struct Peerinf{
    base: Base<Node>,
}

#[godot_api]
impl INode for Peerinf {
    fn init(base: Base<Node>) -> Self {
         godot_print!("Archivo leídos peer imnfo ");
        Self { base }
    }
}

#[godot_api]
impl Peerinf {

//probando las malditas señales
 #[godot_api(signals)]
    #[signal]
    fn speed_increased();
    #[signal]
    fn ips_actualizadas(data: GString);
    #[signal]
    fn http_actualizado(data: GString);

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
pub fn filetraker(&mut self, _bytes: PackedByteArray) -> bool {
    let ruta = r"C:\Users\Emabe\Downloads\sample.torrent";
    match std::fs::read(ruta) {
        Ok(data) => {
            godot_print!("Archivo leído: {} bytes", data.len());
           peer::print_peers(&ruta, _bytes.as_slice());


            true
        }
        Err(e) => {
            godot_error!("Error al leer archivo: {:?}", e);
           peer::print_peers(&ruta, _bytes.as_slice());
            false
        }
    }
}


  /*   #[func]
    pub fn teststring(&self, bytes: PackedByteArray) -> GString {
        // Corregimos la conversión a GString

            GString::from("[BYTES INVALIDOS]")
        
    }


*/

#[func]
fn get_ips(&mut self) -> GString {
    let ips = match GLOBAL_IPS.lock() {
        Ok(i) => i,
        Err(_) => return GString::from("[ERROR DE MUTEX IPs]"),
    };

    let http = match GLOBAL_HTTP.lock() {
        Ok(h) => h,
        Err(_) => return GString::from("[ERROR DE MUTEX HTTP]"),
    };

    let ip_str = if ips.is_empty() {
        "[SIN IPs]".to_string()
    } else {
        format!("IPs actuales: {}", ips.join(", "))
    };

    let http_str = if http.is_empty() {
        "[SIN HTTP]".to_string()
    } else {
        format!("HTTP parseado: {}", http.join(", "))
    };

    let resultado = GString::from(format!("{}\n{}", ip_str, http_str));


    self.base_mut().emit_signal("ips_actualizadas", &[GString::from(ip_str).to_variant()]);
    self.base_mut().emit_signal("http_actualizado", &[GString::from(http_str).to_variant()]);

    resultado
}




}