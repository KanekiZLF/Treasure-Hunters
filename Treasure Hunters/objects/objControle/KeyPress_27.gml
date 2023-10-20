/// @description Pause/Resume o Jogo
// Você pode escrever seu código neste editor
if (room != rmInit) {
	if (!global.inventory) {
		global.gamepause = global.gamepause ? false : true;
		if (global.gamepause) {
			global.option = 0;
			scrPause();
		} else if (!global.gamepause) {
			global.option = noone;
			scrResume();
		}
	} else if (global.inventory) {
		global.gamepause = false;
		global.inventory = false;
		global.option = noone;
		scrResume();
	}
}





