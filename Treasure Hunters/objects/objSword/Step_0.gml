/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrSword();
if (!place_meeting(x, y, objParede)) && !toThrow {
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