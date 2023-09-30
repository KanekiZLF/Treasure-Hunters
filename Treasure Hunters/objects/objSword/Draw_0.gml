/// @description Desenha os efeitos
// Você pode escrever seu código neste editor
draw_self();

if (place_meeting(x, y, objParede)) {
	draw_sprite_ext(sprFallDust, -1, x, y, 1, 1, 90 * image_xscale, c_white, 1);
}





