/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _instSword = instance_place(x, y, objSword);
if !hit && _instSword.speed > 0 {
	lifes -= 3;
	alarm[1] = 15;
	hit = true;
}



