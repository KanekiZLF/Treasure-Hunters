/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
draw_line(x, y - sprite_get_height(sprite_index)/2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)/2);
draw_line(x, y - sprite_get_height(sprite_index)*2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)*2);

var _spriteCenter = sprite_get_height(sprFierceToothIdle)
var _centerBar = sprite_get_height(sprEnemyBar);
draw_sprite_ext(sprEnemyBar, 0, x - _spriteCenter/2, y - 30, 1, 1, 0, c_white, 1);

//Barra Cores
draw_sprite_ext(sprEnemyBar, 1, x - _spriteCenter/2, y - 30, (lifes/maxLifes) * 1, 1, 0, c_white, 1);