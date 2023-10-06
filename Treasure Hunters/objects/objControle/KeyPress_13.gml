/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
global.gamepause = global.gamepause ? false : true;
if (global.gamepause) {
	scrPause();
} else if (!global.gamepause) {
	scrResume();
}



