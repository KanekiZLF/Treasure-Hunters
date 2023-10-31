/// @description Tomo dano
// You can write your code in this editor
var _pause = global.gamepause;

if tomarDano && !isDead && !_pause && (mask_index == sprPlayerIdle || mask_index == sprPlayerSwordIdle) {
	scrCollision();
	global.cameraActive = false;
	camDirec = (image_xscale == 1) ? 0 : 1;
	alarm[5] = 10;
	alarm[0] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para resetar os combos
	lifeCost = 2;
	global.lifes -= lifeCost;
	hit = true;
	dropSword = true;
	tomarDano = false;
}




