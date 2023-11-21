/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!global.gamepause) {
	
	var _linePalm = collision_line(x, y - 10, x, y + 10, objPalmFront, false, true);
	if (_linePalm) {
		objColisParede = objPalmFront;
	} else {
		objColisParede = layer_tilemap_get_id("Paredes");
	}
	
	if !float {
		scrCollision();
	}

	if (!place_meeting(x, y, objColisParede)) && float {
		scrFloat();
	}

	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 7); //<-- Limita o campo de visao até 100px
	var _lineWall = collision_line(x, y - 10, x, y + vision, objColisParede, false, true);
	if (_lineWall) {
		vision--;
		float = true;
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	if (!_lineWall) {
		vision++;
	}
	
	if (float && !inWall) {
		scrFloat();
	} else if (!inWall) {
		scrCollision();
	}
	
	if (place_meeting(x, y, objColisParede)) {
		if (instance_exists(objPlayer)) {
			inWall = true;
			var interpFactor = 0.08; // Ajuste conforme necessário para controlar a velocidade
			// Obtenha as coordenadas do objPlayer
			var targetX = objPlayer.x;
			var targetY = objPlayer.y;

			// Interpolação linear para suavizar o movimento em direção ao jogador
			x = lerp(x, targetX, interpFactor);
			y = lerp(y, targetY, interpFactor);
		}
	}
}





