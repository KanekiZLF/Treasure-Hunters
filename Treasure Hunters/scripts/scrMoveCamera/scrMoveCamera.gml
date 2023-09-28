// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

function scrMoveCameraX() {
	/// @param      {int|real}   distancia
	/// @param      {int|real}   direção

	var _distancia = argument0;
	var _direcao = argument1;
	
	switch(_direcao){
		case 0:
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - _distancia, camera_get_view_y(view_camera[0]));
		break;
		
		case 1:
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + _distancia, camera_get_view_y(view_camera[0]));
		break;
		
		case 2:
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - _distancia);
		break;
		
		case 3:
			camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + _distancia);
		break;
	}
}

function scrMoveCameraY() {
	/// @param      {int|real}    velocidade
	/// @param      {int|real}    distancia
	var _velocidade = argument0;
	var _distancia = argument1;
	// Verifica se a câmera atingiu a posição final
	if (direcaoY == 1 && camera_get_view_x(view_camera[0]) >= posicaoInicialY + _distancia) {
	    direcaoY = -1; // Inverte a direção para a esquerda
	} else if (direcaoY == -1 && camera_get_view_x(view_camera[0]) <= posicaoInicialY - _distancia) {
	    direcaoY = 1; // Inverte a direção para a direita
	}

	// Move a câmera na direção especificada
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + _velocidade * direcaoY );

	// Inicia o movimento da câmera se necessário (pode ser em um evento de tecla, por exemplo)
	if (!cameraMovingY) {
	    direcao = 1; // Comece indo para a direita
	    cameraMovingY = true;
	}
}