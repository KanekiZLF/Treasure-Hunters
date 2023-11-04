/// @description Tomo dano
// You can write your code in this editor
var _pause = global.gamepause;
var totalEnemies = instance_number(objEntidade);

for (var i = 0; i < totalEnemies; i++) {
    var _enemy = instance_find(objEntidade, i);
	
	if tomarDano && !isDead && !_pause && (mask_index == sprPlayerIdle || mask_index == sprPlayerSwordIdle) && !_enemy.isDead {
		scrCollision();
		global.cameraActive = false;
		camDirec = (image_xscale == 1) ? 0 : 1;
		alarm[5] = 10; //Treme a tela
		alarm[0] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para tomar dano
		lifeCost += 2;
		global.lifes -= lifeCost;
		hit = true;
		dropSword = true;
		piscando = true;
	    image_alpha = alphaMin;
		tomarDano = false;
	}
}





