/// @description Fim da animação
if (sprite_index == sprPlayerJump) {
	image_index = sprite_get_number(sprPlayerJump) -1;
}

if isAttacking {
	//Retorna as Sprites de parado
	isAttacking = false;
	
	//Verifica qual lado esta atacando e qual combo é !
	if direita || direc = 4 || direc = 18 || direc = 20 {
		direc = 0; //<<-- Parado Direita
	}
	
	if esquerda || direc = 5 || direc = 19 || direc = 21 {
		direc = 1; //<<-- Parado Esquerda
	}
}

if toThrow {
	//Retorna as Sprites de parado
	toThrow = false; //<-- Reseta o lançar espada
	arraySprite = 0; //<-- Fica sem espada POOW !
	
	//Verifica qual lado esta atacando e qual combo é !
	if direita || direc = 4 || direc = 18 || direc = 20 || direc = 26 {
		direc = 0; //<<-- Parado Direita
	}
	
	if esquerda || direc = 5 || direc = 19 || direc = 21 || direc = 27 {
		direc = 1; //<<-- Parado Esquerda
	}
}