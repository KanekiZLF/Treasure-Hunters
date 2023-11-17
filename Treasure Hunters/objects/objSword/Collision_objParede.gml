/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
damage = false;
if (objPlayer.isDead && speed == 0 && (direc != 4 && direc != 5)) {
	   x+= -15 * image_xscale;
} else {
	objPlayer.noTake = true;
	speed = 0;
	direc = (image_xscale == 1) ? 4 : 5;
}