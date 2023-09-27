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
	global.screenShakeIntensity = 5; // Ajuste o valor conforme necessário
	show_debug_message(global.screenShakeIntensity)
}

if mouse_check_button_pressed(mb_left) && attack && arraySprite == 1 {
	ds_list_clear(inimigos_atingidos);
	if velocidadeV <= 0.3 {
		isAttacking = true;
	}
	
	if isJumping || isFall { 
		isAirAttacking = true; 
	}
	
	attackCombo += 1;
	alarm[2] = 20; //<-- Intervalo entre ataques 
	alarm[3] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para resetar os combos
	
	//Reseta os combos caso chegue no limite
	if (attackCombo == 3) {
		attackCombo = 0;
	}
	
	if (isAirAttacking && attackCombo == 2) {
		attackCombo = 0;
	}
	attack = false;
}

if mouse_check_button_pressed(mb_right) && arraySprite == 1 && velocidadeV = 0 && !isJumping {
	toThrow = true;
	alarm[4] = 10; //<-- Lança a espada
}
