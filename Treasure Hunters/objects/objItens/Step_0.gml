/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrItens();

if (!global.gamepause) {

	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 13); //<-- Limita o campo de visao até 100px
	
	var _lineWall = collision_line(x, y, x, y + vision, objColisParede, false, true)
	if (_lineWall) {
		vision--;
		float = true;
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	var _lineWall2 = !collision_line(x, y, x, y + vision, objColisParede, false, true)
	if (_lineWall2) {
		vision++;
	}
	
	if (float) {
		scrFloat();
	} else {
		scrCollision();
	}
}

