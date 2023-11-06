/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !objPlayer.isDead {
	objPlayer.noTake = true;
	speed = 0;
	direc = (image_xscale == 1) ? 4 : 5;
} else if (objPlayer.isDead) {
	   x+= -15 * image_xscale;
}