/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrSword();
if (!place_meeting(x, y, objParede)) && !toThrow && float {
	scrFloat();
}

if (place_meeting(x, y, objParede)) && !camDef {
	posCamX = camera_get_view_x(view_camera[0]);
	posCamY = camera_get_view_y(view_camera[0]);
	global.cameraActive = false;
	alarm[0] = 10;
	camDef = true;
}

if alarm[0] > 0 {
	scrMoveCamera(1, 1);
}


if place_meeting(x, y, objParede) && !efeito {
	var _effect = instance_create_layer(x + (3 * image_xscale), y - 5, layer, objDusts);
		_effect.direc = 2;
		_effect.image_angle = 90 * image_xscale;
	efeito = true;
}

if autoDestroy {
	alarm[1] = game_get_speed(gamespeed_fps) * 5;
	autoDestroy = false;
}

/*
var camera_left = camera_get_view_x(view_camera[0]); // Coordenada X esquerda da câmera
var camera_right = camera_left + camera_get_view_width(view_camera[0]); // Coordenada X direita da câmera
var camera_top = camera_get_view_y(view_camera[0]); // Coordenada Y superior da câmera
var camera_bottom = camera_top + camera_get_view_height(view_camera[0]); // Coordenada Y inferior da câmera

if (x < camera_left || x > camera_right || y < camera_top || y > camera_bottom) {
	
}*/