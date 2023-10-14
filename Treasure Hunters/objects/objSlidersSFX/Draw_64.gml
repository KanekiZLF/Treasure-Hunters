/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (global.option == 3) {
	image_xscale = scale;
	image_yscale = scale;
	var _textX = _guiLarg/2 + 118;
	var _textY = _guiAlt/2 + 160;
	draw_self();
	draw_sprite_part_ext(sprSliderColor, 0, 0, 0, sprite_width * value, sprite_height, x + 12, (y + 8) - sprite_get_yoffset(sprite_index), 1, 1, c_white, 1);
	draw_sprite_ext(sprSliderTop1, 0, x + (sprite_width * value), y, scale, scale, 0, c_white, 1);
	draw_text_transformed(_textX, _textY, floor(value * 100), .7, .7, 0)
}






