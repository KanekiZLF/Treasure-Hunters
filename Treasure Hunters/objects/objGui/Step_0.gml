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
	scrSaveGame();
	scrSaveInventory();
}

if (keyboard_check_pressed(ord("L"))) {
	scrLoadGame();
	scrLoadInventory();
}




