// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrPinkStar() {
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
		isFall = true;
		if direc == 0 || direc == 2 || direc == 6 {
			direc = 4;
		}
		
		if direc == 1 || direc == 3 || direc == 7 {
			direc = 5;
		}
	}
	
	if velocidadeV > 0 {
		isFall = false;
		isEffect2 = true;
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
		var _effect = instance_create_layer(x, y + 2.5, layer, objEffects)
			_effect.direc = 0;
		cima = 0;
	}
	
	//Define as sprites de morto ou hit
	if isDead || hit {
		if direc = 0 || direc = 2 || direc = 4 || direc = 6 || direc = 10 || direc == 12 {
			direc = 14; //<-- Hit Direita
			estado = scrPinkStarHit;
		}
		
		if direc = 1 || direc = 3 || direc = 5 || direc = 7 || direc = 11 || direc == 13 {
			direc = 15; //<-- Hit Esquerda
			estado = scrPinkStarHit;
		}
	}
}

function scrPinkStarAtack() {
	scrEnemysDirec();
	scrCollision();
	
	//Define as sprites de morto ou hit
	if isDead || hit {
		if direc = 0 || direc = 2 || direc = 4 || direc = 6 || direc = 10 || direc == 12 {
			direc = 14; //<-- Hit Direita
			estado = scrPinkStarHit;
		}
		
		if direc = 1 || direc = 3 || direc = 5 || direc = 7 || direc = 11 || direc == 13 {
			direc = 15; //<-- Hit Esquerda
			estado = scrPinkStarHit;
		}
	}
	
	if (velocidadeV == 0 && !hit && !isDead) {
		velocidadeH = 0;
		velocidadeV = 0;
	
		if direc == 0 || direc == 2 || direc == 4 {
			direc = 12;
		}
	
		if direc == 1 || direc == 3 || direc == 5 {
			direc = 13;
		}
	
		if endAnimation() && (sprite_index == sprPinkStarAntecipation) {
			mask_index = sprPinkStarAttackHB;
			if direc == 12 direc = 10;
			else if direc == 13 direc = 11;
		}
	
		if endAnimation() && (sprite_index == sprPinkStarAttack) {
			if direc == 10 direc = 0;
			else if direc == 11 direc = 1;
			mask_index = sprPinkStarIdle;
			estado = scrCrabby;
		}
	}
}

function scrPinkStarHit() {
	scrEnemysDirec();
	scrCollision();
	
	if velocidadeV < 0 {
		velocidadeV = 5;
	}
	
	var _velocidadeV = 0;
	var _gravidade = .2;
	
	if (instance_place(x, y - 1, objColisParede)) {
		_velocidadeV = -.5;
	} else {
		_velocidadeV = -2.5;
	}
	
	if direita || esquerda || cima {
		direita = noone;
		esquerda = noone;
		cima = noone;
	}

	
	if hit {
		velocidadeH = random(1.5) * image_xscale;
		if place_meeting(x, y + _velocidadeV, objColisParede) {
		while !place_meeting(x, y + sign(_velocidadeV), objColisParede) {
			y += sign(_velocidadeV); 
		}
			_velocidadeV = 0;
		}
		y += _velocidadeV;
		
		if !place_meeting(x, y + 1, objColisParede) {
			_velocidadeV += _gravidade;
		}
		//hit = false;
	} else if !hit {
		velocidadeH = 0;
		_velocidadeV += _gravidade;
	}

	if place_meeting(x, y + 1, objColisParede) && !isDead {
		var _effect = instance_create_layer(x, y + 2.5, layer, objEffects);
			_effect.direc = 2
		estado = scrPinkStar;
	}

	if isDead {	
			mask_index = sprPinkStarDeadGround;
			direc = (image_xscale == -1) ? 16 : 17;
		if endAnimation() {
			estado = scrPinkStar;
		}
	}
}