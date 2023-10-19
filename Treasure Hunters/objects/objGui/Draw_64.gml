/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region Bar Gui

var _pause = global.gamepause;
var _option = global.option;
var _escala = 4;
var _guiAlt = display_get_gui_height();
var _guiLarg = display_get_gui_width();
var _sprAlt = sprite_get_height(sprLifeBar) * _escala;
var _sprAlt2 = sprite_get_height(sprStaminaBar) * _escala + 8;
var _hudAlt = _guiAlt/15;

if (instance_exists(objPlayer)) {
	var _lifes = objPlayer.lifes2 // <-- Vida count
	var _stamina = objPlayer.stamina2;  // <-- Estamina count
	var _maxLifes = objPlayer.maxLifes2;  // <-- Max Vida count
	var _maxStamina = objPlayer.maxStamina2;  // <-- Max Estamina count
	var _poison = objPlayer.poison2;  // <-- Veneno count
	var _maxPoison2 = objPlayer.maxPoison2;  // <-- Veneno count
	var _maxPoison = objPlayer.maxPoison;

	//Hud
	draw_sprite_ext(sprLifeBar, 0, 15, _hudAlt, _escala, _escala, 0, c_white, 1);

	draw_sprite_ext(sprStaminaBar, 0, 35, _hudAlt + _sprAlt, _escala, _escala, 0, c_white, 1);

	if (_maxPoison > 0) {
		draw_sprite_ext(sprPoisonBar, 0, 35, _hudAlt + _sprAlt + _sprAlt2, _escala, _escala, 0, c_white, 1);
	}


	//Barra Cores
	draw_sprite_ext(sprLifeColor, 15, 21 * _escala, _hudAlt, (_lifes/_maxLifes) * _escala, _escala, 0, c_white, 1);
	scrPrint(_lifes)
	draw_sprite_ext(sprStaminaColor, 0, 23.5 * _escala, _hudAlt + _sprAlt, (_stamina/_maxStamina) * _escala, _escala, 0, c_white, 1);

	if (_maxPoison > 0) {
		draw_sprite_ext(sprPoisonColor, 0, 23.5 * _escala, _hudAlt + _sprAlt + _sprAlt2, (_poison/_maxPoison2) * _escala, _escala, 0, c_white, 1);
	}
}

#endregion

#region Pause Gui
// Neste treco entra o GUI da tela de pause e seus menus respectivos !!

//Medidas da sprite de PAUSE !
var _sprDraw = 0;
switch(_option) {
	default:
		_sprDraw = sprPauseBoard; // Caso de erro, define esse como padrão
	break;
	
	case 0:
		_sprDraw = sprPauseBoard; // Pause padrão
	break;
	
	case 1:
		_sprDraw = sprSaveBoard; // Tela de save
	break;
	
	case 2:
		_sprDraw = sprPauseBoard; // Usa o layout do pause, porém é o de options
	break;
	
	case 3:
		_sprDraw = sprAudioBoard; // Audio
	break;
	
	case 4:
		_sprDraw = sprGuideBoard; // Guia
	break;
	
	case 5:
		_sprDraw = sprGuideBoard; // Controles
	break;
	
	case 6:
		_sprDraw = sprGuideBoard; // Creditos
	break;
	
	case 7:
		_sprDraw = sprMainMenuBoard; // Tela Inicial
	break;
	
	case 8:
		_sprDraw = sprGameOverBoard; // Tela Game Over
	break;
	
	case 9:
		_sprDraw = sprShopBoard;
	break;
	
	case 10:
		_sprDraw = sprInventoryBoard;
	break;
}
var _sprWidht = sprite_get_width(_sprDraw) * _escala;
var _sprHeight = sprite_get_height(_sprDraw) * _escala;
var _x = (_guiLarg - _sprWidht) / 2;
var _y = (_guiAlt - _sprHeight) / 2;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (_pause || global.gameover) {
	
	//Desenha a tela escura
	draw_set_alpha(0.5); // Defina a opacidade desejada (0 a 1, onde 0 é completamente transparente e 1 é completamente opaco)
	draw_set_color(c_black); // Defina a cor como preto
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Desenhe um retângulo preto que cobre a tela
	
	// Desenha as telas de opções
	if (_option != 7 && _option != 1) {
		draw_sprite_ext(_sprDraw, 0, _x, _y, _escala, _escala, 0, c_white, 1);
	} else if (_option == 1) {
		draw_sprite_ext(_sprDraw, 0, _x + 30, _y, _escala, _escala, 0, c_white, 1);
	} 
	else if (_option == 7) {
		draw_sprite_ext(_sprDraw, 0, _x - 1.8, _y, _escala, _escala, 0, c_white, 1);
	}
	else if (_option == 9) {
		draw_sprite_ext(_sprDraw, 0, _x, _y, _escala, _escala, 0, c_white, 1);
	}
	
	// Desenha as opções do AUDIO
	if (_option == 3) {
		var _recBX3 = _guiLarg/2 + 66;
		var _recBY3 = 236;
		var _recSpace3 = 15 * _escala;
		
		//Desenha o Retangulo Direito
		draw_sprite_ext(sprSmallIcons, iconMusic, _recBX3 + 12, _recBY3 + 12, _escala, _escala, 0, c_white, 1)
		draw_sprite_ext(sprSmallIcons, iconSfx, _recBX3 + 12, _recBY3 + (18 * _escala), _escala, _escala, 0, c_white, 1)
		
		
		//Desenha o hover do retangulo direito
		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3, _recBX3 + (14 * _escala), _recBY3 + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom, 0, _recBX3, _recBY3, _escala, _escala, 0, c_white, 1);
		}
		
		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3 + _recSpace3, _recBX3 + (14 * _escala), _recBY3 +_recSpace3 + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom, 0, _recBX3, _recBY3 + _recSpace3, _escala, _escala, 0, c_white, 1);
		}
	}

	// Desenha os textos
	var _textSpace = 17 * _escala;
	var _textX = _guiLarg/2 + (-3 * _escala);
	var _textY = _guiAlt/2 + (-27.5 * _escala);
	var _recSpace = 17 * _escala;
	var _recX = _guiLarg/2 + (-35.5 * _escala);
	var _recY = _guiAlt/2 + (-32 * _escala);
	draw_set_alpha(1);
	draw_set_color(#33323d);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnTextoBase30);
	
	if (_option == 3) {
		draw_text_ext_transformed(_textX - 30, _textY + 3, "Musica", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX - 30, _textY + (16 * _escala), "Efeitos", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX - (-3 * _escala), _textY + (36 * _escala), "Volume", 10, 300, .7, .7, 0);
	}
	
	// Tela Inicial
	if (_option == 7) {
			
		// Desenha os textos
		draw_text_ext_transformed(_textX + 13.8, _guiAlt/2 + 57.5, "Play", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + 149.8, _guiAlt/2 + 95, "Guia", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + 272.8, _guiAlt/2 + 115, "Sair", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + (3.5 * _escala), _guiAlt/2 + (-14 * _escala), "Treasure Hunters", 50, 300, 1, 1, 0);
		
		// Desenha o retangulo do HOVER
		var _recTX = _textX + 85.8;
		var _recTY = _guiAlt/2 + 80;
		var _recTX2 = _textX + 205.8;
		var _recTY2 = _guiAlt/2 + 100;
		var _recSpaceX = -50 * _escala
		var _recSpaceY = -1 * _escala
		// Guia
		if (point_in_rectangle(_mouseX, _mouseY, _recTX, _recTY, _recTX + (33 * _escala), _recTY + (12 * _escala))) {
			draw_sprite_ext(sprHoverMain1, 0, _recTX, _recTY, _escala, _escala, 0, c_white, 1);
		} 
		// Sair		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX2, _recTY2, _recTX2 + (33 * _escala), _recTY2 + (12 * _escala))) {
			draw_sprite_ext(sprHoverMain2, 0, _recTX2, _recTY2, _escala, _escala, 0, c_white, 1);
		}		
		// Config		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX + _recSpaceX, _recTY + _recSpaceY - (16 * _escala), _recTX + _recSpaceX + (14 * _escala), _recTY + _recSpaceY - (2 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recTX + _recSpaceX, _recTY + _recSpaceY - (16 * _escala), _escala, _escala, 0, c_white, 1);
		}
		// Inventario		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX + _recSpaceX, _recTY + _recSpaceY, _recTX +_recSpaceX + (14 * _escala), _recTY + _recSpaceY + (14 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recTX + _recSpaceX, _recTY + _recSpaceY, _escala, _escala, 0, c_white, 1);
		}
		// Conquistas		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX, _recTY + _recSpaceY - (16 * _escala), _recTX + (14 * _escala), _recTY + _recSpaceY - (2 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recTX, _recTY + _recSpaceY - (16 * _escala), _escala, _escala, 0, c_white, 1);
		}
		// Carrinho		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX + 156, _recTY + _recSpaceY - (33 * _escala), _recTX + 156 + (14 * _escala), _recTY + _recSpaceY - (19 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recTX + 156, _recTY + _recSpaceY - (33 * _escala), _escala, _escala, 0, c_white, 1);
		}
		// Play		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX - (32 * _escala), _recTY - (16 * _escala), _recTX - (32 * _escala) + (28 * _escala), _recTY - (16 * _escala) + (28 * _escala))) {
			draw_sprite_ext(sprHoverPlay, 0, _recTX - (32 * _escala), _recTY - (16 * _escala), _escala, _escala, 0, c_white, 1);
		}
		// Cifrao		
		else if (point_in_rectangle(_mouseX, _mouseY, _recTX + 156, _recTY + _recSpaceY - (52 * _escala), _recTX + 156 + (14 * _escala), _recTY + _recSpaceY - (38 * _escala))) {
			draw_sprite_ext(sprHoverCifrao, 0, _recTX + 156, _recTY + _recSpaceY - (52 * _escala), _escala, _escala, 0, c_white, 1);
		}
	}
	
	//Desenha o texto na tela de GAME OVER e as opções, retangulos e tudo mais !
	if (_option == 8) {
		var _textX2 = _guiLarg/2 + (-13 * _escala);
		var _textY2 = _guiAlt/2 + (-63 * _escala);
		var _recX2 = _guiLarg/2 + (-32 * _escala);
		var _recY2 = _guiAlt/2 + (24.5 * _escala);
		var _recSpace2 = 18 * _escala;
		draw_text_ext_transformed(_textX2, _textY2, "Game", 10, 300, .8, .8, 0);
		draw_text_ext_transformed(_textX2 + (28.8 * _escala), _textY2 + (-5 * _escala), "Over", 10, 300, .8, .8, 0);
		draw_text_ext_transformed(_textX2 + (48 * _escala), _recY2 + (4.5 * _escala), "Sair", 10, 300, .8, .8, 0);
		
		// Cifrao
		if (point_in_rectangle(_mouseX, _mouseY, _recX2, _recY2, _recX2 + (14 * _escala), _recY2 + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom, 0, _recX2, _recY2, _escala, _escala, 0, c_white, 1);
		}
		// Play
		else if (point_in_rectangle(_mouseX, _mouseY, _recX2 + _recSpace2, _recY2, _recX2 + _recSpace2 + (28 * _escala), _recY2 + (14 * _escala))) {
			draw_sprite_ext(sprHoverPlayOver, 0, _recX2 + _recSpace2, _recY2, _escala, _escala, 0, c_white, 1);
		}
		// Sair
		else if (point_in_rectangle(_mouseX, _mouseY, _recX2 + _recSpace2 + (33 * _escala), _recY2 + (1 * _escala), _recX2 + _recSpace2 + (33 * _escala) + (32 * _escala), _recY2 + (1 * _escala) + (13 * _escala))) {
			draw_sprite_ext(sprHoverExit, 0, _recX2 + _recSpace2 + (33 * _escala), _recY2 + (1 * _escala), _escala, _escala, 0, c_white, 1);
		}
	}
		
	// Desenha as opções do Shop/Mercado
	if (_option == 9) {
		var _coinX = _guiLarg/2 + (-50 * _escala);
		var _coinY = _guiAlt/2;
		var _coinScale = 2.2;
		var _coinSpaceX = 30 * _escala;
		var _coinSpaceY = 30 * _escala;
		var _coinTextSpace = 30 * _escala;
		var _recBackSpaceX = -19 * _escala;
		var _recBackSpaceY = -60.5 * _escala;
		var _numCoins = 4;
		draw_set_color(#33323D);

		// Hover da seta voltar
		if (point_in_rectangle(_mouseX, _mouseY, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY, _coinX + (14 * _escala + _recBackSpaceX), _coinY + (14 * _escala + _recBackSpaceY))) {
			draw_sprite_ext(sprHoverButtom, 0, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY, _escala, _escala, 0, c_white, 1);
		}
		
		
		for (var i = 0; i < _numCoins; i++) {
		    var _coinXX = _coinX + (i * _coinSpaceX);
			var _coinYY = _coinY + (50 * _escala)
			
			//Itens
			
		    // Array para os sprites e legendas fica no criar

		    // Desenhe a moeda
		    draw_sprite_ext(coinSprites[i], 0, _coinXX, _coinY, _coinScale, _coinScale, 0, c_white, 1);

		    // Desenhe a legenda
		    draw_text_ext_transformed(_coinX + (10 * _escala + _coinTextSpace * i), _coinY - 18.8, coinLabels[i], 10, 300, .6, .6, 0);
			
			//Upgrades
			
			// Desenhe a moeda
		    draw_sprite_ext(coinSprites2[i], 0, _coinXX, _coinYY, _coinScale, _coinScale, 0, c_white, 1);

		    // Desenhe a legenda
		    draw_text_ext_transformed(_coinX + (10 * _escala + _coinTextSpace * i), _coinYY - 18.8, coinLabels2[i], 10, 300, .6, .6, 0);
		}
		
		// Desenha o hover nos cards
		var _recSX = _guiLarg/2 + (-57 * _escala);
		var _recSY = _guiAlt/2 + (2.5 * _escala);
		var _recSSpace = 30 * _escala;
		var _recSSpace2 = -50 * _escala;
		var _numRetangulos = 4;
		for (var i = 0; i < _numRetangulos; i++) {
			if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala))) {
				draw_sprite_ext(sprHoverShop, 1, _recSX + (_recSSpace * i), _recSY, _escala, _escala, 0, c_white, 1);
			}
			else if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY + _recSSpace2, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala + _recSSpace2))) {
				draw_sprite_ext(sprHoverShop, 0, _recSX + (_recSSpace * i), _recSY + _recSSpace2, _escala, _escala, 0, c_white, 1);
			}
		}
		
		//Itens
		draw_sprite_ext(sprRedPotion, 0, _coinX + (6.2 * _escala), _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprBluePotion, 0, _coinX + (6.2 * _escala + _coinSpaceX), _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprGreenBottle, 0, _coinX + (6.2 * _escala + _coinSpaceX * 2), _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprCoinsSell, 0, _coinX + (7 * _escala + _coinSpaceX * 3), _coinY + (-17 * _escala), 3.8, 3.8, 0, c_white, 1);
		
		//Upgrades
		draw_sprite_ext(sprIconsShop, 3, _coinX + (6.8 * _escala), _coinY + (18.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprIconsShop, 2, _coinX + (6.8 * _escala + _coinSpaceX), _coinY + (18.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprIconsShop, 1, _coinX + (6.8 * _escala + (_coinSpaceX * 2)), _coinY + (18.5 * _escala), 4, 4, 0, c_white, 1);
		draw_sprite_ext(sprIconsShop, 0, _coinX + (6.8 * _escala + (_coinSpaceX * 3)), _coinY + (18.5 * _escala), 4, 4, 0, c_white, 1);
	}
	
	//Desenha o icone que ira dentro do retangulo
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
		
	if (_option == 0) {
		iconClose = 4;
	} else if (_option == 2) {
		iconClose = 0;
	}
	
	if (_option == 0 || _option == 2 || _option == 3 || _option == 4) {
		draw_sprite_ext(sprSmallIcons, iconClose, _recBX + 12, _recBY + 12, _escala, _escala, 0, c_white, 1);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _recBX, _recBY, _recBX + (14 * _escala), _recBY + (14 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recBX, _recBY, _escala, _escala, 0, c_white, 1);
		}
	}
		
	//Desenha sombra nas opções !
	//draw_rectangle(_recX, _recY, _recX + (72 * _escala), _recY + (14 * _escala), true);
		
	//Desenha texto do menu inicial
	var _menuText = ["Pause", "Saves", "Options", "Audio", "Guia", "Creditos", "Shop", "Inventario","ERRO"];
	var _textSelected = 0;
	switch (_option) {
	    default: // Define erro caso não exista a seleção
	        _textSelected = _menuText[7];
	     break;
		 
	    case 0:// Pause
	        _textSelected = _menuText[0];
	     break;
		
	    case 1: // Saves
	        _textSelected = _menuText[1];
	    break;
		
	    case 2: // Options
	        _textSelected = _menuText[2];
	    break;
		
	    case 3: // Audio
	        _textSelected = _menuText[3];
	    break;
		
		case 4: // Guia
	        _textSelected = _menuText[4];
	    break;
		
		case 5: // Controles
	        _textSelected = _menuText[4];
	    break;
		
		case 6: // Creditos
	        _textSelected = _menuText[4];
	    break;
		
		case 7: // Tela Inicial
	        _textSelected = noone;
	    break;
		
		case 8: // Tela Game Over
	       _textSelected = noone;
	    break;
		
		case 9: // Tela Shop/Mercado
	       _textSelected = _menuText[6];
	    break;
		
		case 10: // Tela Inventario
	       _textSelected = _menuText[7];
	    break;
	}
	
	// Desenha o texto selecionado
	if (_textSelected != noone) {
		if (_option != 9) {
			draw_text_ext_transformed(_textX + (3.5 * _escala), _textY - (38 * _escala), _textSelected, 10, 300, .8, .8, 0);
		} 
		else if (_option == 9) {
			draw_text_ext_transformed(_textX + (5.5 * _escala), _textY - (52.5 * _escala), _textSelected, 10, 300, .8, .8, 0);
		}
	}
	
	// Retangulos do menu principal e do options
	if (_option == 0 || _option == 2 || _option == 4) {
		var _sprW = sprite_get_width(sprOptionHover) - 5;
		var _sprH = sprite_get_height(sprOptionHover);
		var _numRetangulos = 4;
	
		for (var i = 0; i < _numRetangulos; i++) {
			var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
			var rectBottom = rectTop + (14 * _escala); // Coordenada Y do fundo do retângulo
    
			if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (72 * _escala), rectBottom) {
			    draw_sprite_ext(sprOptionHover, 0, _recX, _recY + (i * _recSpace), _escala, _escala, 0, c_white, 1);
			    break; // Encerre o loop após encontrar um retângulo
			}
		}
	}
		
	//Desenha o texto do cabeçalho dos menus
	var textArray = [];
	if (_option == 0) {
		textArray = ["Continuar", "Salvar", "Options", "Sair"];
	} else if (_option == 2 && room != rmInit) {
		textArray = ["Guia", "Controles", "Audio", "Creditos"];
	} else if (_option == 2 && room == rmInit) { 
		textArray = ["Carregar", "Controles", "Audio", "Creditos"];
	}
	
	var numTexts = array_length(textArray);
	var textSpace = _textSpace;

	for (var i = 0; i < numTexts; i++) {
		var text = textArray[i];
		var textX = _textX;
		var textY = _textY + (i * textSpace);
    
		draw_text_ext_transformed(textX - 5, textY, text, 10, 300, 0.8, 0.8, 0);
	}
	
	// Desenha texto dos saves
	if (_option == 1) {
		var _textArray = ["Save 1", "Save 2", "Save 3"]
		var _numTexts = array_length(_textArray);
		var _textSpace2 = 22 * _escala;
		var _textX2 = _guiLarg/2 + (-15.5 * _escala);
		var _textY2 = _guiAlt/2 + (-25 * _escala);
		draw_set_alpha(1);
		draw_set_color(#33323d);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnTextoBase30);
		
		//Desenha o retangulo
		var _recBX2 = _guiLarg/2 - 190;
		var _recBY2 = 176;
		var _recSX = _guiLarg/2 + 106;
		var _recSY = 232;
		draw_sprite_ext(sprSmallIcons, iconSave, _guiLarg/2 + 118, _recBY2 + 68, _escala, _escala, 0, c_white, 1);
		
		if (point_in_rectangle(_mouseX, _mouseY, _recBX2, _recBY2, _recBX2 + (14 * _escala), _recBY2 + (14 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recBX2, _recBY2, _escala, _escala, 0, c_white, 1);
		}
		
		if (point_in_rectangle(_mouseX, _mouseY,_recSX, _recSY, _recSX + (14 * _escala), _recSY + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom, 0, _recSX, _recSY, _escala, _escala, 0, c_white, 1);
		}
		
		for (var i = 0; i < _numTexts; i++) {
			var _text = _textArray[i];
			var textY = _textY2 + (i * _textSpace2)
			
			draw_text_ext_transformed(_textX2, textY, _text, 10, 300, .65, .65, 0);
		}
		
		//Desenha a tabela de pontos
		draw_set_color(#75ffff)
		draw_set_halign(fa_center)
		var _posPX = _guiLarg/2 + (20 * _escala);
		var _posPY = _guiAlt/2 - (12 * _escala);
		draw_sprite_ext(sprCoinsBoard, 0, _posPX, _posPY, 2.6, 2.6, 0, c_white, 1);
		

		var _textX3 = _guiLarg/2 + (40 * _escala);
		var _textY3 = _guiAlt/2 - (10.5 * _escala);
		var _textSpace3 = 37;
			
		//Desenha as moedas na posição
		draw_text_ext_transformed(_textX3, _textY3, string(global.coinsSilver), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + _textSpace3, string(global.coinsGold), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + (_textSpace3 * 2), string(global.coinsDiamond), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + (_textSpace3 * 3), string(global.coinsSaphire), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + (_textSpace3 * 4), string(global.coinsRuby), 10, 300, .6, .6, 0);

		
		// Dsenha o hover das opções de save
		var _recSpace2 = 22 * _escala;
		var _recX2 = _guiLarg/2 + (-31.5 * _escala);
		var _recY2 = _guiAlt/2 + (-31 * _escala);
		var _sprW = sprite_get_width(sprHoverSave) - 5;
		var _sprH = sprite_get_height(sprHoverSave);
		var _numRetangulos = 3;
	
		for (var i = 0; i < _numRetangulos; i++) {
		    var rectTop = _recY2 + (i * _recSpace2); // Coordenada Y do topo do retângulo
		    var rectBottom = rectTop + (18 * _escala); // Coordenada Y do fundo do retângulo
    
		    if point_in_rectangle(_mouseX, _mouseY, _recX2, rectTop, _recX2 + (32 * _escala), rectBottom) {
		        draw_sprite_ext(sprHoverSave, 0, _recX2, _recY2 + (i * _recSpace2), _escala, _escala, 0, c_white, 1);
		        break; // Encerre o loop após encontrar um retângulo
		    }
		}
	}
	
} else if (!_pause) {
	draw_set_alpha(1); // Restaura a opacidade padrão (opcional, dependendo do que você deseja fazer a seguir)
	draw_set_color(c_white); // Restaura a cor padrão
}

#endregion