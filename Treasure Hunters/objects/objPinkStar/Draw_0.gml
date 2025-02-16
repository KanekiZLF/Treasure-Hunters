/// @description Desenha Life Bar
// Você pode escrever seu código neste editor
draw_self();
//draw_line(x + (vision * image_xscale), y - sprite_get_height(sprite_index)/2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)/2);
//draw_line(x, y - sprite_get_height(sprite_index)*2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)*2);

if (!isDead) {
	var _spriteCenter = sprite_get_height(sprFierceToothIdle);
	var _centerBar = sprite_get_height(sprEnemyBar);
	var _alpha = 1;

	if (barLife) {
		_alpha = 1;
	} else if (!barLife){
		_alpha--;
		_alpha = clamp(_alpha, 0, 1);
	}

	draw_sprite_ext(sprEnemyBar, 0, x - _spriteCenter/2, y - 30, 1, 1, 0, c_white, _alpha);

	//Barra Cores
	draw_sprite_ext(sprEnemyColor, 1, x - 8.5, y - 30, (lifes/maxLifes) * 1, 1, 0, c_white, _alpha);
}

var _centerSpriteY = sprite_get_height(sprite_index)/2;

draw_line(x + (vision * image_xscale), y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY)