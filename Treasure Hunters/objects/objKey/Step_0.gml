/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!global.gamepause) {
	if !float {
		scrCollision();
	}

	if (!place_meeting(x, y, objParede)) && float {
		scrFloat();
	}

	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 7); //<-- Limita o campo de visao até 100px
	var _lineWall = collision_line(x, y - 10, x, y + vision, objColisParede, false, true)
	if (_lineWall) {
		vision--;
		float = true;
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	if (!_lineWall) {
		vision++;
	}
}





