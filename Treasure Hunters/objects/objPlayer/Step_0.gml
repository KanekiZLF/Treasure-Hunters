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

}

if mouse_check_button_pressed(mb_left) && attack && arraySprite == 1 {
	ds_list_clear(inimigos_atingidos);
	global.cameraActive = false;
	posCamX = camera_get_view_x(view_camera[0]);
	posCamY = camera_get_view_y(view_camera[0]);
	
	if velocidadeV <= 0.3 {
		isAttacking = true;
	}
	
	if isJumping || isFall { 
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
		attackCombo = 0;
	}
	attack = false;
}

if alarm[5] > 0 {
	scrMoveCamera(.5, 3);
}

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
	
}else if (isAirAttacking || isFall) && mouse_check_button_pressed(mb_left) {
	camDirec = 2;
}

if mouse_check_button_pressed(mb_right) && arraySprite == 1 && velocidadeV = 0 && !isJumping {
	toThrow = true;
	alarm[4] = 10; //<-- Lança a espada
}








