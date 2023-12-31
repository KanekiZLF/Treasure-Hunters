/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
script_execute(estado);
randomize();
lifes = clamp(lifes, 0, maxLifes);
if (global.gamepause) {
	velocidadeH = 0;
}

#region isDead
if lifes <= 0 {
	isDead = true;
	perseg = false;
	
	// Cria o efeito de fumaça
	if sprite_index == sprFierceToothDeadGround && image_index == 1 && place_meeting(x, y + 1, objColisParede) {
		var _effect = instance_create_layer(x - 5, y + 2.5, layer, objEffects);
			_effect.direc = 2
	}
	
	// Da moedas ao player
	if (sprite_index == sprFierceToothDead && image_index == 0) {
		scrColected("silver", irandom(100))
	}
}
#endregion

if (!global.gamepause && !isDead) {
	
	if (scrCanFall()) {
		scrIAEnemys("fierceTooth");
	}

	
	if (!perseg && !scrCanFall() && !canFall && !isJumping && !isFall) {
		velocidade = 1;

		if direita = 0 { direita = 1; esquerda = 0}
		else if esquerda = 0 {direita = 0; esquerda = 1};
		
		canFall = true;
	}
	
	if wait("canFallAlrm", .2) {
		if (canFall) {
			canFall = false
		}
	}
		
	// Crie os efeitos de fumaça quando anda ou pula
	if (wait("runDust1", .2)) && direita && !isJumping && !isFall && !isDead && velocidade > 0 {
		var _effect = instance_create_layer(x - 10, y + 2.5, layer, objEffects);
			_effect.direc = 4
	}

	if (wait("runDust2", .2)) && esquerda && !isJumping && !isFall && !isDead && velocidade > 0 {
		var _effect = instance_create_layer(x + 10, y + 2.5, layer, objEffects);
			_effect.direc = 5
	}
	
	if (place_meeting(x, y + 1, objColisParede)) && isEffect2 {
		var _effect = instance_create_layer(x, y + 2.5, layer, objEffects);
			_effect.direc = 2
			isEffect2 = false;
	}
}

if (keyboard_check_pressed(ord("1"))) {
	if direita = 0 { direita = 1; esquerda = 0}
	else if esquerda = 0 {direita = 0; esquerda = 1};
}
