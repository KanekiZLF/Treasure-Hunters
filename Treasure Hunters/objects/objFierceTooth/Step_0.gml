/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//scrPrint(lifes)
randomise();
scrFierceTooth();
scrEnemysDirec();

if (global.gamepause) {
	velocidadeH = 0;
}

if (!global.gamepause) {
	if (!perseg) {
		if (place_meeting(x + 1, y, objParede) && image_xscale == -1) {
			// Colisão à direita
			direita = 0;
			esquerda = 1;
		}

		if (place_meeting(x - 1, y, objParede) && image_xscale == 1) {
			// Colisão à esquerda
			direita = 1;
			esquerda = 0;
		}

		if alarm[0] <= 0 {
			alarm[0] = irandom(tempoAndar);
		}
	}

	//Verifica se tem algo colidindo, na direita ou esquerda, se tiver, diminui o campo de visao, até sair da colisao
	vision = clamp(vision, 0, 50); //<-- Limita o campo de visao até 100px
	var _centerSpriteY = sprite_get_height(sprite_index)/2;
	var _lineWall = collision_line(x, y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY, objColisParede, false, true);
	if (_lineWall) {
		vision--;
	}

	//Se nao tiver nada colidindo, aumenta o campo de visao
	if (!_lineWall) {
		vision++;
	}

	var _linePlayer = collision_line(x, y - _centerSpriteY, x - (vision * image_xscale), y - _centerSpriteY, objPlayer, false, true);
	if (_linePlayer) {
		perseg = true;
	
		if (!isEffect) {
			var _instEffect = instance_create_layer(x, y, layer, objEffects);
			_instEffect.direc = 7;
			_instEffect.enemy = true;
			isEffect = true;
		}	
	} 
	else if (!_linePlayer) {
		perseg = false;
		isEffect = false;
	}
}









