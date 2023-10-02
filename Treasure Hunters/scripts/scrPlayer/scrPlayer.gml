// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

// Função para verificar se a animação chegou ao fim
function endAnimation() {
    return (image_index >= image_number - 1);
}


function scrPlayer() {
	scrDirec();
	//Colisao X
	if place_meeting(x + velocidadeH, y, objColisParede) {
	while !place_meeting(x + sign(velocidadeH), y, objColisParede) {
		x += sign(velocidadeH);
	}
		velocidadeH = 0;
	}
	x += velocidadeH;

//Colisao Y
	if place_meeting(x, y + velocidadeV, objColisParede) {
		while !place_meeting(x, y + sign(velocidadeV), objColisParede) {
			y += sign(velocidadeV); 
	}
		velocidadeV = 0;
		isJumping = false;
		isFall = false;
		if place_meeting(x, y + 1, objColisParede) {
			doubleJump = 0;
		}
	}
	y += velocidadeV;
	
	// Movimentação
	if moveOn && !isDead {
		direita = keyboard_check(ord("D"));
		esquerda = keyboard_check(ord("A"));
		cima = keyboard_check_pressed(ord("W"));
	}
	velocidadeH = (direita - esquerda) * velocidade;

	//Gravidade
	if !place_meeting(x, y + 1, objColisParede) {
		velocidadeV += gravidade;
	}
	
	//Empurra durante um determinado tempo
	if alarm[1] > 0 {
		velocidadeH = lengthdir_x(3, empurrarDir);
	}
	
	//Jump, Double Jump, Pulo, Pulo Duplo
	if !isAttacking || !isDead {	
		if cima && doubleJump < 2 {
			var _effect = instance_create_layer(x, y - 8, layer, objEffects)
				_effect.direc = 0;
			doubleJump += 1;
			velocidadeV = alturaPulo;
			isJumping = true;
	}
	
		//Define as sprites de acordo com o direc
	
		//Define a Sprite Parado
		if velocidadeH = 0 && !toThrow {
			if direc = 2 || direc = 4 || direc = 8 || direc = 18 {
				direc = 0; //<-- Idle Direita
			}
		
			if direc = 3 || direc = 5 || direc = 9 || direc = 19 {
				direc = 1; //<-- Idle Esquerda
			}
		}
		
		//Define a sprite de lançando a espada
		if toThrow {
			velocidadeH = 0;
			if direc = 0 || direc = 2 {
				direc = 26;
			}
			
			if direc = 1 || direc = 3 {
				direc = 27
			}
		}
	
		//Define sprite de andando
		if velocidadeH != 0 && !isJumping {
			if direita {
				direc = 2; //<-- Run Direita
			}

			if esquerda {
				direc = 3; //<-- Run Esquerda
			}
		}
	
		//Define se esta caindo ou não
		if velocidadeV >= 0.03 {
			isFall = true;
			isEffect = true;
		} else if velocidadeV <= .03 {
			isFall = false;
		}
	
		//Define a sprite do FALL, caindo
		if isFall {
			if direita || direc = 0 || direc = 2 || direc = 6 {
				direc = 8; //<-- Fall Direita
			}
		
			if esquerda || direc = 1 || direc = 3 || direc = 7 {
				direc = 9; //<-- Fall Esquerda
			}
		}
		
		//Define a sprite do pulo e verifica o fall
		if isJumping && !isFall {
			if direita || direc = 0 || direc = 2 {
				direc = 6;
			}
		
			if esquerda || direc = 1 || direc = 3 {
				direc = 7;
			}
		}
	}
	
	if(isAirAttacking && !isDead) {
		if direita || direc = 6 || direc = 8 {
			if (attackCombo = 0) {
				direc = 22; //<<-- Ataque1 Direita
			} else if (attackCombo = 1) {
				direc = 24; //<<-- Ataque2 Direita
			}
		}
		
		if esquerda || direc = 7 || direc = 9 {
			if (attackCombo = 0) {
				direc = 23;	//<<-- Ataque1 Esquerda
			} else if (attackCombo = 1) {
				direc = 25; //<<-- Ataque2 Esquerda
			}
		}
		estado = scrAtacandoAr;
	}
	
	//Define sprite de atacando e altera o script/estado
	if isAttacking && !isJumping && !isFall && !isDead {
			
		if direita || direc = 0 || direc = 2 {
			if (attackCombo = 0) {
				direc = 4; //<<-- Ataque1 Direita
			} else if (attackCombo = 1) {
				direc = 18; //<<-- Ataque2 Direita
			} else if (attackCombo = 2) {
				direc = 20; //<<-- Ataque3 Direita
			}
		}
		
		if esquerda || direc = 1 || direc = 3 {
			if (attackCombo = 0) {
				direc = 5;	//<<-- Ataque1 Esquerda
			} else if (attackCombo = 1) {
				direc = 19; //<<-- Ataque2 Esquerda
			} else if (attackCombo = 2) {
				direc = 21; //<<-- Ataque3 Esquerda
			}
		}
		estado = scrAtacando;
	}
	
	//Define as sprites de morto
	if isDead {
		if direc = 0 || direc = 2 || direc = 4 || direc = 6 || direc = 8 {
			direc = 14; //<-- Dead Direita
		}
		
		if direc = 1 || direc = 3 || direc = 5 || direc = 7 || direc = 9 {
			direc = 15; //<-- Dead Esquerda
		}
	}
}

// Define o estado como atacando
function scrAtacando() {
	velocidadeH = 0;

	//Criando uma lista para checar os inimigos atingidos em cada frame
	var inimigosHB = ds_list_create();
	
	//Colocar a ID dos inimigos atingindos dentro da lista
	var inimigos = instance_place_list(x, y, objEntidade, inimigosHB, false);
	
	//Se tiver algum inimigo atingido
	if (inimigos) > 0{
		
		//Usar o loop para checar a ID de cada inimigo atingido
		for (var i = 0; i < inimigos; i++){
			var inimigosID = inimigosHB[| i];
			//Comparar a ID do inimigo na lisca local com a lista de inimigos atingidos
			
			if (ds_list_find_index(inimigos_atingidos, inimigosID)) == -1{
				ds_list_add(inimigos_atingidos, inimigosID);
				with(inimigosID){
				lifes -= objPlayer.dano;
				alarm[1] = 15;
				hit = true;
				if lifes > 0 {
					hitSound = true;
					}
				}
			}
		}
	}
	
	ds_list_destroy(inimigosHB);
	
// Define oque sera feito ao fim da animação
	if scrFimAnimacao() && isAttacking {
		estado = scrPlayer;
	}
}

function scrAtacandoAr() {
	velocidadeV = 0;
	velocidadeH = 0;
	scrDirec();
	scrAtacando();
	
	if endAnimation() {
		estado = scrPlayer;
	}
}