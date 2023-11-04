/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//scrPrint(lifes)
script_execute(estado);
lifes = clamp(lifes, 0, maxLifes);
if (global.gamepause) {
	velocidadeH = 0;
}
#region isDead
if lifes <= 0 {
	isDead = true;
	perseg = false;
}
#endregion
if (!global.gamepause && !isDead) {
	scrIAEnemys("fierceTooth");
}












