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

// Atualiza constantemente o valor dos upgrades

global.upgPrice0 = coinLabels2[0];
global.upgPrice1 = coinLabels2[1];
global.upgPrice2 = coinLabels2[2];
global.upgPrice3 = coinLabels2[3];

if (keyboard_check_pressed(ord("S"))) {
	scrSaveGame();
	scrSaveInventory();
}

if (keyboard_check_pressed(ord("L"))) {
	//var _load = instance_create_layer(0, 0, layer, objBackgroundLoad);
	scrLoadGame();
	scrLoadInventory();
	global.gameover = false;
	global.gamepause = false;
	
	if (objControle.alarm[0] <= 0) {
		objControle.alarm[0] = 1;
	}
}



