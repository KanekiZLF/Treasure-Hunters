// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

function scrMoveCameraX() {
	/// @param      {int|real}    velocidade
	/// @param      {int|real}    distancia
	var _velocidade = argument0;
	var _distancia = argument1;
	// Verifica se a câmera atingiu a posição final
	if (direcaoX == 1 && camera_get_view_x(view_camera[0]) >= posicaoInicialX + _distancia) {
	    direcaoX = -1; // Inverte a direção para a esquerda
	} else if (direcaoX == -1 && camera_get_view_x(view_camera[0]) <= posicaoInicialX - _distancia) {
	    direcaoX = 1; // Inverte a direção para a direita
	}

	// Move a câmera na direção especificada
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + _velocidade * direcaoX, camera_get_view_y(view_camera[0]));

	// Inicia o movimento da câmera se necessário (pode ser em um evento de tecla, por exemplo)
	if (!cameraMovingX) {
	    direcaoX = 1; // Comece indo para a direita
	    cameraMovingX = true;
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