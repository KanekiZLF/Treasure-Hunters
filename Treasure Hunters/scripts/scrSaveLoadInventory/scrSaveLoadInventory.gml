// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrSaveInventory(){
	var gridWidth = ds_grid_width(objGui.gridItems); // Largura da ds_grid
	var gridHeight = ds_grid_height(objGui.gridItems); // Altura da ds_grid
	
	var mapData = ds_map_create();
	
	var _file = "";
	switch(global.save) {
		default:
			show_message("Erro ao definir save do inventario !");
		break
		
		case 1:
			_file = "saveInventory0.save";
		break;
		
		case 2:
			_file = "saveInventory1.save";
		break;
		
		case 3:
			_file = "saveInventory2.save";
		break;
	}
    
	// Converter a ds_grid em um ds_map
	for (var xx = 0; xx < gridWidth; xx++) {
	    for (var yy = 0; yy < gridHeight; yy++) {
	        var key = string(xx) + "K" + string(yy); // Chave única para cada célula da ds_grid
	        var value = ds_grid_get(objGui.gridItems, xx, yy);
	        ds_map_add(mapData, key, value);
	    }
	}
	
	
	
	// Converter o ds_map em JSON
	var mapDataJSON = json_encode(mapData);
	
	// Criar um buffer e salvar o JSON no buffer
	var _buffer = buffer_create(string_byte_length(mapDataJSON) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, mapDataJSON);

	// Salvar o buffer em um arquivo
	var filename = _file;
	buffer_save(_buffer, filename);
	buffer_delete(_buffer);

	// Lembre-se de destruir o ds_map após a conversão e a gravação
	ds_map_destroy(mapData);

}

function scrLoadInventory(){
	var _file = "";
	switch(global.save) {
		default:
			show_message("Erro ao definir save do inventario !");
		break
		
		case 1:
			_file = "saveInventory0.save";
		break;
		
		case 2:
			_file = "saveInventory1.save";
		break;
		
		case 3:
			_file = "saveInventory2.save";
		break;
	}
	
    if (file_exists(_file)) {
        // Carregar o arquivo como buffer
        var _buffer = buffer_load(_file);
        
        // Ler o JSON do buffer
        var mapDataJSON = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);
        
        // Converter o JSON de volta para um ds_map
        var mapData = json_decode(mapDataJSON);

        // Recuperar os dados do ds_map e atualiza a ds_grid
        for (var xx = 0; xx < ds_grid_width(objGui.gridItems); xx++) {
            for (var yy = 0; yy < ds_grid_height(objGui.gridItems); yy++) {
                var key = string(xx) + "K" + string(yy);
                if (ds_map_exists(mapData, key)) {
                    ds_grid_set(objGui.gridItems, xx, yy, ds_map_find_value(mapData, key));
                }
            }
        }
        
        // Destrói o ds_map após usar
        ds_map_destroy(mapData);
    }
}
