/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _pause = global.gamepause;
var _gameOver = global.gameover;

if (!_pause) {
	script_execute(estado) //<-- Executa script
}

 

attackCombo = clamp(attackCombo, -1, 3);
lifes2 = clamp(lifes2, 0, maxLifes2);
stamina2 = clamp(stamina2, 0, maxStamina2);
poison2 = clamp(poison2, 0, maxPoison2);


if global.lifes <= 0 {
	isDead = true;
	_gameOver = true;

	
	// Cria o efeito de fumaça
	if sprite_index == sprPlayerDeadGround && image_index == 1 && place_meeting(x, y + 1, objParede) {
		var _effect = instance_create_layer(x - 3, y - 7, layer, objEffects);
			_effect.direc = 2
		var _effect2 = instance_create_layer(x, y, layer, objEffects)
			_effect2.direc = 8;
	}
	
	// Cria a espada quando morre
	if dropSword && arraySprite == 1 {
		var _newSword  = instance_create_layer(x + (25 * image_xscale), y - 12, layer, objSword);
			_newSword.direc = (image_xscale == 1) ? 0 : 1;
			_newSword.float = false;
			arraySprite = 0;
			dropSword = false;	
	}
}

#region Barras HUD
// <-- Faz animação da barras diminuindo
if (stamCost > 0) {
	stamina2 -= 0.1;
	stamCost -= 0.1;
}else if (stamCost < 0) {
	stamina2 += 0.1
	stamCost += 0.1;
}

if (poisonCost > 0) {
	poison2 -= 0.1;
	poisonCost -= 0.1;
} else if (poisonCost < 0) {
	poison2 += 0.1
	poisonCost += 0.1;
}
	
if (lifeCost > 0) {
	lifes2 -= 0.1;
	lifeCost -= 0.1;
} else if (lifeCost < 0) {
	lifes2 += 0.1
	lifeCost += 0.1;
} else if (isDead && lifes2 > 0) {
	lifes2 -= 0.1;
}

#endregion

if tomarDano && !isDead && (!_pause) {
	global.cameraActive = false;
	camDirec = (image_xscale == 1) ? 0 : 1;
	alarm[5] = 10;
	lifeCost = 2;
	global.lifes -= lifeCost;
	hit = true;
	dropSword = true;
	tomarDano = false;
}


if keyboard_check_pressed(ord("G")) {
	tomarDano = true;
}

if keyboard_check_pressed(ord("L")) {
	global.gameover = false;
	scrRecharge(3, 3) //<-- Define a recarga para Lifes, Stamina e Poison
	isDead = false;
}

// Tempo em que a camera treme
if alarm[5] > 0 {
	if !hit {
		scrMoveCamera(.5, 3);
	} else if hit {
		scrMoveCamera(.5, 2);
	}
}

if !isDead && (!_pause) {
	// Ataca e define a posição da camera entre outras coisas
	if mouse_check_button_pressed(mb_left) && attack && arraySprite == 1 {
		ds_list_clear(inimigos_atingidos);
		global.cameraActive = false;
	
		if velocidadeV < 0.3 {
			isAttacking = true;
		}
	
		if (isJumping || isFall) && attackCombo <= 2 { 
			isAirAttacking = true; 
		}
	
		attackCombo += 1;
		alarm[2] = 20; //<-- Intervalo entre ataques 
		alarm[3] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para resetar os combos
		alarm[5] = 10 //Treme tela
	
		//Reseta os combos caso chegue no limite
		if (attackCombo == 3) {
			attackCombo = 0;
		}
	
		if (isAirAttacking && attackCombo == 2) {
			isAirAttacking = false;
		}
		attack = false;
	}

	// Define o lado que a camera ira tremer

	if isAttacking && mouse_check_button_pressed(mb_left) {
		if attackCombo == 0 {
			if (image_xscale == 1) {
				camDirec = 0;
			}
		
			if (image_xscale == -1) {
				camDirec = 1;
			}
		} else if attackCombo == 1 {
			camDirec = 2;
		} else if attackCombo == 2 {
			camDirec = 3;
		}
	
	} else if (isAirAttacking || isFall) && mouse_check_button_pressed(mb_left) {
		camDirec = 2;
	}

	// Joga a espada
	if mouse_check_button_pressed(mb_right) && arraySprite == 1 && velocidadeV = 0 && !isJumping && global.stamina >= 2 {
		toThrow = true;
		stamCost += 2;
		global.stamina -= 2;
		alarm[4] = 10; //<-- Lança a espada
	}


	// Crie os efeitos de fumaça quando anda, pula ou ataca no ar
	if (wait("runDust1", .2)) && direita && !isJumping && !isFall && !isDead {
	   var _effect = instance_create_layer(x - 3, y - 7, layer, objEffects);
			_effect.direc = 4
	}

	if (wait("runDust2", .2)) && esquerda && !isJumping && !isFall && !isDead {
	   var _effect = instance_create_layer(x - 3, y - 7, layer, objEffects);
			_effect.direc = 5
	}

	if (place_meeting(x, y + 1, objParede)) && isEffect {
		var _effect = instance_create_layer(x - 3, y - 7, layer, objEffects);
			_effect.direc = 2
			isEffect = false;
	}
}

//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
vision = clamp(vision, 0, 100); //<-- Limita o campo de visao até 100px
var _lineWall = collision_line(x, y - 20, x + (vision * image_xscale), y - 20, objColisParede, false, true)
if (_lineWall) {
	vision--;
}

//Se nao tiver nada colidindo, aumenta o campo de visao
var _lineWall2 = !collision_line(x, y - 20, x + (vision * image_xscale), y - 20, objColisParede, false, true)
if (_lineWall2) {
	vision++;
}