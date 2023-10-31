/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrEffects();

if (!global.gamepause) {
	image_speed = imageSpeed;
} else {
	image_speed = 0;
}

//Controla os efeitos do Dialogo
if (direc == 6 || direc == 7 || direc == 8) {
	x = objPlayer.x + 15;
	y = objPlayer.y - 20;

	if (image_index == 2) {
		image_speed = 0;
	}

	if (wait("DialogPause", .6)) {
		image_speed = imageSpeed;
	}
}