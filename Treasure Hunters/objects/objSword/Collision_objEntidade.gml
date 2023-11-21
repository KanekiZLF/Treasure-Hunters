/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (instance_exists(objEntidade)) {
	var _instEnemy = instance_place(x, y, objEntidade);
	if (!ricochete && !_instEnemy.isDead && (sprite_index == sprSwordSpinig)) {
		alarm[2] = 10;
		ricochete = true;
	}
}










