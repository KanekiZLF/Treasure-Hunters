/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
imageSpeed = 0;
myTileMap = layer_tilemap_get_id("Paredes");
image_speed = 0.2;
listSpeed = ds_list_create();
isPaused = false;
itemExist = 0;
pointExist = false;
playSound = false;
volumeMusic = .1;

global.upgPrice0 = 0;
global.upgPrice1 = 0;
global.upgPrice2 = 0;
global.upgPrice3 = 0;
gridGeneral = ds_grid_create(2, 0);