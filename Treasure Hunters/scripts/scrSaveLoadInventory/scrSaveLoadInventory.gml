// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrSaveInventory(){
	var gridWidth = ds_grid_width(objGui.gridItems); // Largura da ds_grid
	var gridHeight = ds_grid_height(objGui.gridItems); // Altura da ds_grid

	var mapData = ds_map_create();
    
	// Converter a ds_grid em um ds_map
	for (var xx = 0; xx < gridWidth; xx++) {
	    for (var yy = 0; yy < gridHeight; yy++) {
	        var key = string(xx) + "_" + string(yy); // Chave única para cada célula da ds_grid
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
	var filename = "savegame.save";
	buffer_save(_buffer, filename);
	buffer_delete(_buffer);

	// Lembre-se de destruir o ds_map após a conversão e a gravação
	ds_map_destroy(mapData);

}

function scrLoadInventory(){
    var filename = "inventoryData.json";
    
    if (file_exists(filename)) {
        // Ler o JSON do arquivo
        var file = file_text_open_read(filename);
        var mapDataJSON = file_text_read_string(file);
        file_text_close(file);
        
        // Converter o JSON de volta para um ds_map
        var mapData = json_decode(mapDataJSON);

        // Recuperar os dados do ds_map e atualiza a ds_grid
        for (var xx = 0; xx < ds_grid_width(objGui.gridItems); xx++) {
            for (var yy = 0; yy < ds_grid_height(objGui.gridItems); yy++) {
                var key = string(xx) + "_" + string(yy);
                if (ds_map_exists(mapData, key)) {
                    ds_grid_set(objGui.gridItems, xx, yy, ds_map_find_value(mapData, key));
                }
            }
        }
        
        // Destrói o ds_map após usar
        ds_map_destroy(mapData);
    }
}