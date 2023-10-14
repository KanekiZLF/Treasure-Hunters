/// @description Pause/Resume o Jogo
// Você pode escrever seu código neste editor
if (room != rmInit) {
	global.gamepause = global.gamepause ? false : true;
	if (global.gamepause) {
		global.option = 0;
		scrPause();
	} else if (!global.gamepause) {
		scrResume();
		global.option = noone;
	}
}



