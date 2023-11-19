/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (isDead && instance_place(x, y + 1, objColisParede)) {
	image_alpha -= 0.01;
	if (image_alpha <= 0) {
		instance_destroy();
	}
}

