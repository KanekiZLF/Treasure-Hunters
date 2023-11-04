// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scrIAEnemys(){
	///@param _enemyName*
	var _enemyName = argument0;
	randomise();
	if (!isDead) {
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
		vision = clamp(vision, 0, 81); //<-- Limita o campo de visao até limite em px
		var _centerSpriteY = sprite_get_height(sprite_index)/2;
		var _lineWall = collision_line(x, y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY, objColisParede, false, true);
		var _lineWall2 = collision_line(x, y - sprite_get_height(sprite_index)*2, x - (vision * image_xscale), y - sprite_get_height(sprite_index)*2, objParede, false, true);
		// Verifica se a linha colidiu com alguma parede
		if (_lineWall) {
			vision -= 5;
			if (vision  <= 30) {
				walk = false;
				// Verifica se não esta pulando e se a linha 2 não colidiu com uma parede, ai ele pode pular !
				if (!isJumping && !_lineWall2) {
					cima = 1;
					velocidade = 1;
				}
				// Verifica se pode ou não andar !
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
	    var _distX = objPlayer.x - x; // <-- Define se  player esta na frente ou atrás
	
		// Usa linha para verificar se esta colidindo com player
	    if (_linePlayer) {
	        perseg = true;
			barLife = true;
	    } 
	
		// Para de seguir o player se a distancia for maior que o limite definido
		if (_distPlayer >= distLimit) {
	        perseg = false;
	        isEffect = false;
			barLife = false;
	    }
	    // Aumenta a velocidade para perseguir o player
	    if (perseg && !global.gameover) {
	        velocidade = 1.5;

	        // Cria o efeito dos pontos de exclamação !!
	        if (!isEffect) {
	            var _instEffect = instance_create_layer(x, y, layer, objEffects);
	            _instEffect.direc = 7;
	            _instEffect.enemy = true;
	            _instEffect.imageSpeed = 2;
	            isEffect = true;
	        }
        
			// Se a distancia for superior ou igual a 30
			if (_distPlayer >= 40) {
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
			// Player ta na sua frente, ai entra no modo de ataque
		    } else if (velocidadeV == 0) {
				velocidade = 0;
				var _count;
				if (_enemyName == "fierceTooth") {
					if (alarm[1] <= 0) {
						estado = scrFierceToothAtack;
						alarm[1] = 1.3 * game_get_speed(gamespeed_fps);// <-- Intervalo entre ataques
					}
				}
			}
		} else if (global.gameover) {
			perseg = false;
	        isEffect = false;
			mask_index = sprFierceToothIdle;
			estado = scrFierceTooth;
		}
	}

	#endregion

		if instance_place(x, y + 1, objParede) {
			isJumping = false;
			walk = true;
		}
	}
}