/// @description Se colidir com a Espada
// Você pode escrever seu código neste editor
if (instance_exists(objSword)) {
	var _instSword = instance_place(x, y, objSword);
	if !toThrow && arraySprite != 1 && !isDead && !_instSword.ricochete {
		arraySprite = 1;
		instance_destroy(other);
	}
}
