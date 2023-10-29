/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/*if (keyboard_check_pressed(ord("V"))) {
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 0, 3, 6, 0, 6);
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 6, 3, 11, 0, 12);
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 12, 3, 17, 0, 0);
	ds_grid_copy(gridItems, gridItems2);
}

if (keyboard_check_pressed(ord("N"))) {
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 0, 3, 6, 0, 12);
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 6, 3, 11, 0, 0);
	ds_grid_set_grid_region(gridItems2, gridItems, 0, 12, 3, 17, 0, 6);
	ds_grid_copy(gridItems, gridItems2);
}*/

if (keyboard_check_pressed(ord("S"))) {
	
	var _saveData = array_create(0);
	
	with (objSaveMe) {
		var _saveEntitys = {
			obj : object_get_name(object_index),
			y : y,
			x : x,
		}
		array_push(_saveData, _saveEntitys)
	}
	
	//Salvando dentro do Json
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savegame.save");
}

if (keyboard_check_pressed(ord("L"))) {
	
}




