/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _pause = global.gamepause;

if (_pause) {
	alarm[1] = noone; // <-- Evita de a espada ser destruida caso esteje pausado !
}

if (!_pause) {
	scrSword();
	if !float && !toThrow {
		scrCollision();
	}

	if (!place_meeting(x, y, objColisParede)) && !toThrow && float {
		scrFloat();
	}

	if (place_meeting(x, y, objColisParede) || place_meeting(x, y, objPalmFrontWood)) && !camDef2 {
		global.cameraActive = false;
		alarm[0] = 10;
		camDef2 = true;
	}

	if alarm[0] > 0 {
		scrMoveCamera(1, 1);
	}


	if place_meeting(x, y, objColisParede) && !efeito {
		// Cria o efeito de fumaça na parede
		var _effect = instance_create_layer(x + (3 * image_xscale), y - 5, layer, objEffects);
			_effect.direc = 2;
			_effect.image_angle = 90 * image_xscale;
			
		// Cria o dialogo de interrogação
		var _effect2 = instance_create_layer(x, y, layer, objEffects);
			_effect2.direc = 6;
			_effect2.player = true;
		// Desativa os efeitos após aplicar
		efeito = true;
	}

	// Destroi a espada após 5 segundos caso a variavel seja true
	if autoDestroy {
		alarm[1] = game_get_speed(gamespeed_fps) * 60;
		autoDestroy = false;
	}


	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 7); //<-- Limita o campo de visao até 100px
	var _lineWall = collision_line(x, y - 10, x, y + vision, objColisParede, false, true)
	if (_lineWall) {
		vision--;
		float = true;
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	var _lineWall2 = !collision_line(x, y - 10, x, y + vision, objColisParede, false, true)
	if (_lineWall2) {
		vision++;
	}
	
	if (ricochete && !place_meeting(x, y, objColisParede)) {
		if (alarm[2] > 0) {
			y -= 2;
			x -= (-.1 * image_xscale);
			speed = (-1 * image_xscale);
		}
		
		if alarm[2] <= 0 {
			y += 2;
			speed = (-.8 * image_xscale);
		} 
	}

	/*
	var camera_left = camera_get_view_x(view_camera[0]); // Coordenada X esquerda da câmera
	var camera_right = camera_left + camera_get_view_width(view_camera[0]); // Coordenada X direita da câmera
	var camera_top = camera_get_view_y(view_camera[0]); // Coordenada Y superior da câmera
	var camera_bottom = camera_top + camera_get_view_height(view_camera[0]); // Coordenada Y inferior da câmera

	if (x < camera_left || x > camera_right || y < camera_top || y > camera_bottom) {
	
	}*/
}

if (place_meeting(x + (1 * image_xscale), y, objColisParede) || place_meeting(x + (1 * image_xscale), y, objPalmFrontWood)) {
	damage = false;
	if (objPlayer.isDead && speed == 0 && (direc != 4 && direc != 5)) {
		   x+= -15 * image_xscale;
	} else {
		objPlayer.noTake = true;
		speed = 0;
		direc = (image_xscale == 1) ? 4 : 5;
	}
	
	if (ricochete) {
		image_angle = (-60 * image_xscale)
		ricochete = false;
	}
}