/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//scrItens();

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
	
	if (float && !inWall) {
		scrFloat();
	} else if (!inWall) {
		scrCollision();
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

/*switch(sprite) {
	case 0:
		sprite_index = sprRedPotion;
	break;
	
	case 1: 
		sprite_index = sprBluePotion;
	 break;	
	 
	 case 2:
		sprite_index = sprGreenBottle;
	 break;	
	 
	 case 3: 
		sprite_index = sprDiamondCoin;
	 break;	
	 
	 case 4: 
		sprite_index = sprSaphireCoin;
	 break;	
	 
	 case 5: 
		sprite_index = sprRubyCoin;
	 break;	
	 
	 case 6: 
		sprite_index = sprGoldenSkull;
	 break;	
}*/



