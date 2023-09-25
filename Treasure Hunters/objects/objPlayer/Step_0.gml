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
	isAttacking = true;
	attack = false;
	alarm[2] = 30;
	alarm[3] = game_get_speed(gamespeed_fps) * 1;
	attackCombo += 1;
	
	//Reseta os combos caso chegue no limite
	if (attackCombo == 3) {
		attackCombo = 0;
	}
}

if mouse_check_button_pressed(mb_right) && arraySprite == 1 {
	toThrow = true;
	alarm[4] = 10; //<-- Lança a espada
}
