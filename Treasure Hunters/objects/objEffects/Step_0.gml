/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrEffects();

//Controla os efeitos do Dialogo
if (direc == 6 || direc == 7 || direc == 8) {
	x = objPlayer.x + 15;
	y = objPlayer.y - 32;

	if (image_index == 2) {
		image_speed = 0;
	}

	if (wait("DialogPause", .6)) {
		image_speed = 1;
	}
}