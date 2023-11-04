/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//scrPrint(lifes)
script_execute(estado);
lifes = clamp(lifes, 0, maxLifes);
if (global.gamepause) {
	velocidadeH = 0;
}
scrPrint(lifes);
if (!global.gamepause) {
	//scrIAEnemys("fierceTooth");
}












