/// @description Controla o inventario
// Você pode escrever seu código neste editor
if (room != rmInit) {
	if (instance_exists(objPlayer) && !global.gamepause) {
		global.inventory = true;
		global.gamepause = true;
		global.option = 11;
		scrPause();
		} else if (instance_exists(objPlayer) && global.inventory && global.gamepause) {
		global.inventory = false;
		global.gamepause = false;
		global.option = noone;
		scrResume();
	}
}






