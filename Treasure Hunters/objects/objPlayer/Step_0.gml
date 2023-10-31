/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _pause = global.gamepause;

if (!_pause) {
	script_execute(estado) //<-- Executa script
	image_speed = 1;
}

attackCombo = clamp(attackCombo, -1, 3);
lifes2 = clamp(lifes2, 0, maxLifes2);
stamina2 = clamp(stamina2, 0, maxStamina2);
poison2 = clamp(poison2, 0, maxPoison2);

if global.lifes <= 0 {
	isDead = true;
	
	if (!global.gameover) {
		global.option = 8;
	}
	
	global.gameover = true;
	// Cria o efeito de fumaça
	if sprite_index == sprPlayerDeadGround && image_index == 1 && place_meeting(x, y + 1, objParede) {
		var _effect = instance_create_layer(x, y + 2.5, layer, objEffects);
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
	stamina2 += 0.2;
	stamCost += 0.2;
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
	lifes2 += 0.2;
	lifeCost += 0.2;
} else if (isDead && lifes2 > 0) {
	lifes2 -= 0.2;
}

#endregion

if keyboard_check_pressed(ord("G")) {
	tomarDano = true;
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
	
	if piscando {
    // Aumentar o alpha
    image_alpha += taxaPiscar;

    // Verificar se ultrapassou o limite superior
    if image_alpha > alphaMax {
        image_alpha = alphaMax;
        taxaPiscar *= -1; // Inverter a direção da alteração
    }

    // Verificar se ultrapassou o limite inferior
    if image_alpha < alphaMin {
        image_alpha = alphaMin;
        taxaPiscar *= -1; // Inverter a direção da alteração
	    }
	}

	
	// Ataca e define a posição da camera entre outras coisas
	
	if mouse_check_button_pressed(mb_left) && attack && arraySprite == 1 {
		attackCombo++;
		ds_list_clear(inimigos_atingidos);
		global.cameraActive = false;
	
		if velocidadeV < 0.3 {
			isAttacking = true;
		}
	
		if (isJumping || isFall) && attackCombo <= 1 { 
			isAirAttacking = true; 
		}
	
		alarm[2] = 10; //<-- Intervalo entre ataques 
		alarm[3] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para resetar os combos
		
		if (isAttacking) {
			alarm[5] = 10 //Treme tela
		}
		
		if (isAirAttacking) {
			alarm[5] = 10 //Treme tela
		}
	
		//Reseta os combos caso chegue no limite
		if (attackCombo == 3) {
			attackCombo = 0;
		}
	
		if (isAirAttacking && attackCombo >= 2) {
			isAirAttacking = false;
		}
		
		attack = false;
	}

	// Define o lado que a camera ira tremer

	if isAttacking && mouse_check_button_pressed(mb_left) && attack && attackCombo > 0 {
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


	// Crie os efeitos de fumaça quando anda ou pula
	if (wait("runDust1", .2)) && direita && !isJumping && !isFall && !isDead {
	   var _effect = instance_create_layer(x - 10, y + 2.5, layer, objEffects);
			_effect.direc = 4
	}

	if (wait("runDust2", .2)) && esquerda && !isJumping && !isFall && !isDead {
	   var _effect = instance_create_layer(x + 10, y + 2.5, layer, objEffects);
			_effect.direc = 5
	}

	if (place_meeting(x, y + 1, objParede)) && isEffect {
		var _effect = instance_create_layer(x, y + 2.5, layer, objEffects);
			_effect.direc = 2
			isEffect = false;
	}
	
	if (instance_exists(objItens) && !global.inventory) {
    var _inst = instance_nearest(x, y, objItens);
    
    if (distance_to_point(_inst.x, _inst.y) <= 20) {
        if (place_meeting(x, y, _inst)) {
			scrDsGridProcess(_inst.sprite, _inst.quantidade);
			
			if (_inst.sprite == 0 || _inst.sprite == 1 || _inst.sprite == 2) {
				var _effect = instance_create_layer(_inst.x, _inst.y + 9, "Effects", objEffects);
				_effect.direc = 14;
			} 
			
			if (_inst.sprite == 3 || _inst.sprite == 4 || _inst.sprite == 5) {
				var _effect = instance_create_layer(_inst.x, _inst.y + 9, "Effects", objEffects);
				_effect.direc = 9;
			} 
            instance_destroy(_inst);
        }
    }
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