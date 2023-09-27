/// @description Fim da animação
if (sprite_index == sprPlayerJump) {
	image_index = sprite_get_number(sprPlayerJump) -1;
}
	//Retorna as Sprites
if isAttacking {
	//Verifica qual lado esta atacando e qual combo é !
	if direita || direc = 4 || direc = 18 || direc = 20 {
		direc = 0; //<<-- Parado Direita
	}
	
	if esquerda || direc = 5 || direc = 19 || direc = 21 {
		direc = 1; //<<-- Parado Esquerda
	}
	isAttacking = false;
}

if isAirAttacking && (sprite_index == sprPlayerSwordAirAtack1 || sprite_index == sprPlayerSwordAirAtack2) {
	if direc = 22 || direc = 24 {
		direc = 8;
	}
	
	if direc = 23 || direc = 25 {
		direc = 9;
	}
	isAirAttacking = false;
}

if toThrow {
	//Verifica qual lado esta atacando e qual combo é !
	if direita || direc = 4 || direc = 18 || direc = 20 || direc = 26 {
		direc = 0; //<<-- Parado Direita
	}
	
	if esquerda || direc = 5 || direc = 19 || direc = 21 || direc = 27 {
		direc = 1; //<<-- Parado Esquerda
	}
	toThrow = false; //<-- Reseta o lançar espada
	arraySprite = 0; //<-- Fica sem espada POOW !
	velocidade = 2; //<-- Devolve a velocidade
}

