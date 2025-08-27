extends Node2D



func _ready() -> void:
	var peer = $Peerinfo
	peer.run_ipfs()
	peer.get_ipfs()
	prints("hola ipfs")
	return 
	prints("hola mundo")
	#var peer = $Peerinfo
	peer.filetraker(read_file_as_bytes("res://example/sample.torrent"))
	prints(peer.get_ips())



func read_file_as_bytes(path: String) -> PackedByteArray:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("No se pudo abrir el archivo: %s" % path)
		$Label3.text = "No se pudo abrir el archivo: %s" % path
		return PackedByteArray()
	
	var byte_data := file.get_buffer(file.get_length())
	file.close()
	prints(byte_data.size(), " tamalo leido ")
	#$Label.text = "tamaÑo de archivo leido " + str(byte_data.size())
	return byte_data


func _on_peerinfo_http_actualizado(data: String) -> void:
	prints(data)
	pass # Replace with function body.


func _on_peerinfo_ips_actualizadas(data: String) -> void:
	prints(data)
	pass # Replace with function body.


func _on_peerinfo_ips_ipfs(data: String) -> void:
	
	prints(data , " ips ipfs ")
	pass # Replace with function body.


func _on_peerinfo_i_ds_ipfs(data: String) -> void:
	prints(data , " ids de ipfs ")
	pass # Replace with function body.
