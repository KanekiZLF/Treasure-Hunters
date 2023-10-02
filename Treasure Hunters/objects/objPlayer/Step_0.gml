/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado) //<-- Executa script
attackCombo = clamp(attackCombo, -1, 3);

if global.lifes <= 0 {
	isDead = true;
	velocidadeH = 0;
	alturaPulo = 0;
	global.gameover = true;
}

if keyboard_check_pressed(ord("G")) {
	arraySprite = 1;
	global.lifes -= 1;
	show_debug_message(global.lifes)
}



// Ataca e define a posição da camera entre outras coisas
if mouse_check_button_pressed(mb_left) && attack && arraySprite == 1 {
	ds_list_clear(inimigos_atingidos);
	global.cameraActive = false;
	posCamX = camera_get_view_x(view_camera[0]);
	posCamY = camera_get_view_y(view_camera[0]);
	
	if velocidadeV <= 0.3 {
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

// Tempo em que a camera treme
if alarm[5] > 0 {
	scrMoveCamera(.5, 3);
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
if mouse_check_button_pressed(mb_right) && arraySprite == 1 && velocidadeV = 0 && !isJumping {
	toThrow = true;
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