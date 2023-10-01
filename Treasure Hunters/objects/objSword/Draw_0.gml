/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();


if (place_meeting(x + (2 * image_xscale), y, objParede) && !efeito) {
	if (image_index >= sprite_get_number(sprFallDust) - 1) {
		efeito = true; // Desative o efeito
	}
    draw_sprite_ext(sprFallDust, floor(image_index), x + (3 * image_xscale), y - 5, 1, 1, 90 * image_xscale, c_white, 1);
}




