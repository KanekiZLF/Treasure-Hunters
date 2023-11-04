// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrFierceTooth() {
	scrCollision();
	scrEnemysDirec();
	velocidadeH = (direita - esquerda) * velocidade;
	
	if velocidadeH != 0 && velocidadeV == 0 {
		if direita {
			direc = 2;
		}
		
		if esquerda {
			direc = 3;
		}
	} else if velocidadeH == 0 && velocidadeV == 0 {
		if direc == 2 || direc == 4 || direc == 6 {
			direc = 0;
		}
		
		if direc == 3 || direc == 5 || direc == 7 {
			direc = 1;
		}
	}
	
	if velocidadeV < 0 {
		if direc == 0 || direc == 2 || direc == 6 {
			direc = 4;
		}
		
		if direc == 1 || direc == 3 || direc == 7 {
			direc = 5;
		}
	}
	
	if velocidadeV > 0 {
		if direc == 2 || direc == 4 {
			direc = 6;
		}
		
		if direc == 3 || direc == 5 {
			direc = 7;
		}
	}
	
	if cima {
		isJumping = true;
		velocidadeV = -4;
		cima = 0;
	}
}

function scrFierceToothAtack() {
	scrEnemysDirec();
	scrCollision();
	if (velocidadeV == 0) {
		velocidadeH = 0;
		velocidadeV = 0;
	
		if direc == 0 || direc == 2 || direc == 4 {
			direc = 12;
		}
	
		if direc == 1 || direc == 3 || direc == 5 {
			direc = 13;
		}
	
		if endAnimation() && (sprite_index == sprFierceToothAntecipation) {
			if wait("fierceAtack", .25) {
				mask_index = sprFierceToothAttack;
				if direc == 12 direc = 10;
				else if direc == 13 direc = 11;
			}
		}
	
		if endAnimation() && (sprite_index == sprFierceToothAttack) {
			if direc == 10 direc = 0;
			else if direc == 11 direc = 1;
			mask_index = sprFierceToothIdle;
			estado = scrFierceTooth;
		}
	}
}