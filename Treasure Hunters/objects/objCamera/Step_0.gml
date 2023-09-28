/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (instance_exists(objPlayer)) {
	alvo = objPlayer;
}

if cameraSeg {
	//Seguir o player

	x = lerp(x, alvo.x, 0.1);
	y = lerp(y, alvo.y, 0.1);

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

// Velocidade de movimento da câmera
var cameraSpeed = 2;

// Verifique se a tecla esquerda (<Left> Key) está sendo pressionada
if keyboard_check(vk_left) {
    // Mova a câmera para a esquerda
   scrMoveCameraX(10, 2);
}

if mouse_check_button_pressed(mb_left) {
	scrMoveCameraX(1, 1);
}

// Verifique se a tecla direita (<Right> Key) está sendo pressionada
if keyboard_check(vk_right) {
    // Mova a câmera para a direita
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + cameraSpeed, camera_get_view_y(view_camera[0]));
}


if keyboard_check(vk_up) {
    // Mova a câmera para a esquerda
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - cameraSpeed);
}

// Verifique se a tecla direita (<Right> Key) está sendo pressionada
if keyboard_check(vk_down) {
    // Mova a câmera para a direita
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+ cameraSpeed);
}




