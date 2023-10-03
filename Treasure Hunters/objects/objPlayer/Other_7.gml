/// @description Fim da animação

#region Deixa a sprite em seu ultimo frame

if (sprite_index == sprPlayerJump) {
	image_index = sprite_get_number(sprPlayerJump) -1;
}

if (sprite_index == sprPlayerDeadGround) {
	image_index = image_number -1;
}

if (direc == 14 || direc == 15) && !isDead {
	image_index = image_number -1;
	if (!direita || !esquerda) && place_meeting(x, y + 1, objParede) {
		direc = (image_xscale == 1) ? 0 : 1;
	}
	hit = false;
}
#endregion

#region Retorna as Sprites

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
	if direita || direc = 6 || direc = 22 || direc = 24 {
		direc = 8;
	}
	
	if esquerda || direc = 7 || direc = 23 || direc = 25 {
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

#endregion

#region Define as sprites de morte

if isDead {
	if (sprite_index == sprPlayerSwordHit) {
	    if (image_xscale == 1) {
	        direc = 12; //<-- Define sprite sprPlayerDead
	    }
	    else if (image_xscale == -1) {
	        direc = 13; //<-- Define sprite sprPlayerDead
	    }
	}
	
	if arraySprite == 0 {
		if (sprite_index == sprPlayerDead) {
		    if (image_xscale == 1) {
		        direc = 16; //<-- Define sprite sprPlayerDeadGround
		    }
		    else if (image_xscale == -1) {
		        direc = 17; //<-- Define sprite sprPlayerDeadGround
		    }
		}
	}
		
	if arraySprite == 1 {
		if (sprite_index == sprPlayerDead) {
		    if (image_xscale == 1) {
		        direc = 28; //<-- Define sprite sprPlayerDeadGround
		    }
		    else if (image_xscale == -1) {
		        direc = 29; //<-- Define sprite sprPlayerDeadGround
		    }
		}
	}
}

#endregion
