/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (instance_exists(objPlayer)) {
	alvo = objPlayer;
}

if global.cameraActive && instance_exists(objPlayer) {
	//Seguir o player
	//camera_destroy(view_camera[0]);
	//view_camera[0] = camera_create_view(0, 0, 320, 180, 0, noone, 5, 5, 32, 32);
	x = lerp(x, alvo.x, .2);
	y =  lerp(y, alvo.y, .2);

	//Pegando os valores da camera
	var largCamera = camera_get_view_width(view_camera[0])
	var altCamera = camera_get_view_height(view_camera[0])
	var camX = x - largCamera /2;
	var camY = y - altCamera /2;
	camX = clamp(camX, 0, room_width - largCamera)
	camY = clamp(camY, 0, room_height - altCamera)

	// Camera que segue
	camera_set_view_pos(view_camera[0], camX, camY);
}