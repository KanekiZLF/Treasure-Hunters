/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//scrPrint(lifes)
randomise();
scrFierceTooth();
scrEnemysDirec();

if (global.gamepause) {
	velocidadeH = 0;
}

if (!global.gamepause) {
	if (!perseg) {
		if (place_meeting(x + 1, y, objParede) && image_xscale == -1) {
			// Colisão à direita
			direita = 0;
			esquerda = 1;
		}

		if (place_meeting(x - 1, y, objParede) && image_xscale == 1) {
			// Colisão à esquerda
			direita = 1;
			esquerda = 0;
		}

		if alarm[0] <= 0 {
			alarm[0] = irandom(tempoAndar);
		}
	}

	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 100); //<-- Limita o campo de visao até 100px
	var _centerSpriteY = sprite_get_height(sprite_index)/2;
	var _lineWall = collision_line(x, y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY, objColisParede, false, true);
	var _lineWall2 = collision_line(x, y - sprite_get_height(sprite_index)*2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)*2, objParede, false, true);
	if (_lineWall) {
		vision -= 5;
		if (vision  <= 30) {
			walk = false;
			
			if (!isJumping && !_lineWall2) {
				cima = 1;
				velocidade = 1;
			}
			
			if (!walk) {
				if (image_index == 1) {
					direita = 1;
					esquerda = 0;
				}
			
				if (image_index == -1) {
					direita = 0;
					esquerda = 1;
				}
			}
		}
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	if (!_lineWall) {
		vision++;
	}
	
#region Persegue o Player

	// Verifica se o player existe na room
	if (instance_exists(objPlayer)) {
	var _linePlayer = collision_line(x, y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY, objPlayer, false, true);
    var _distPlayer = point_distance(x, y, objPlayer.x, objPlayer.y);
    var _distX = objPlayer.x - x;
	
	// Usa linha para verificar se esta colidindo com player
    if (_linePlayer) {
        perseg = true;
    } 
	
	// Para de seguir o player se a distancia for maior que 100
	if (_distPlayer >= distLimit) {
        perseg = false;
        isEffect = false;
    }
    
    if (perseg) {
        velocidade = 1.5;

        // Cria o efeito dos pontos de exclamação !!
        if (!isEffect) {
            var _instEffect = instance_create_layer(x, y, layer, objEffects);
            _instEffect.direc = 7;
            _instEffect.enemy = true;
            _instEffect.imageSpeed = 2;
            isEffect = true;
        }
        
		if (_distPlayer >= 30) {
			// Verifica se o inimigo esta atras ou na frente do player
	        if (_distX > 0) {
	            // Inimigo está atrás do jogador, mova-o para a direita
	            direita = 1;
	            esquerda = 0;
	        } else if (_distX < 0) {
	            // Inimigo está na frente do jogador, mova-o para a esquerda
	            direita = 0;
	            esquerda = 1;
	        }
	    } else {
			velocidade = 0;
		}
	}
}

#endregion

	if instance_place(x, y + 1, objParede) {
		isJumping = false;
		walk = true;
	}
}












