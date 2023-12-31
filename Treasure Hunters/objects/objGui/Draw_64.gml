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

if (objControle.alarm[1] <= 0 && instance_exists(objPlayer) && room != rmInit) {
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
		_sprDraw = sprShopSellBoard;
	break;
	
	case 11:
		_sprDraw = sprInventoryBoard;
	break;
	
	case 12:
		_sprDraw = sprConfirmationBoard;
	break;
	
	case 13:
		_sprDraw = sprElixirsGuideBoard;
	break;
	
	case 14:
		_sprDraw = sprGuideBoard;
	break;
	
	case 15:
		_sprDraw = sprConfirmationBoard;
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
	draw_set_font(fnTextoBase30);
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Desenhe um retângulo preto que cobre a tela
	
	switch (_option) {
		default:
		    if (_option != 1) {
		        draw_sprite_ext(_sprDraw, 0, _x, _y, _escala, _escala, 0, c_white, 1);
		    }
		break;
		
	    case 1:
	        draw_sprite_ext(_sprDraw, 0, _x + 30, _y, _escala, _escala, 0, c_white, 1);
	    break;
		
	    case 7:
	        draw_sprite_ext(_sprDraw, 0, _x - 1.8, _y, _escala, _escala, 0, c_white, 1);
		break;
		
		case 12:
	        draw_sprite_ext(_sprDraw, 0, _x + (.5 * _escala), _y, _escala, _escala, 0, c_white, 1);
	    break;
		
		case 15:
	        draw_sprite_ext(_sprDraw, 0, _x + (.5 * _escala), _y, _escala, _escala, 0, c_white, 1);
	    break;
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
		draw_text_ext_transformed(_textX - 18.2, _guiAlt/2 + 57.5, "Play", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + 117.8, _guiAlt/2 + 95, "Guia", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + 240.8, _guiAlt/2 + 115, "Sair", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + (-4.5 * _escala), _guiAlt/2 + (-14 * _escala), "Treasure Hunters", 50, 300, 1, 1, 0);
		
		// Desenha o retangulo do HOVER
		var _recTX = _textX + 53.8;
		var _recTY = _guiAlt/2 + 80;
		var _recTX2 = _textX + 173.8;
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
	if (_option == 9 || _option == 10) {
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
		if (_option == 9) {
			if (point_in_rectangle(_mouseX, _mouseY, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY, _coinX + (14 * _escala + _recBackSpaceX), _coinY + (14 * _escala + _recBackSpaceY))) {
				draw_sprite_ext(sprHoverButtom, 0, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY, _escala, _escala, 0, c_white, 1);
			}
			
			// Icone encima das moedas
			if (point_in_rectangle(_mouseX, _mouseY, _guiLarg/2 + (80 * _escala ), _coinY + (-45.5 * _escala), _guiLarg/2 + (94 * _escala ), _coinY + (-31.5 * _escala))) {
				draw_sprite_ext(sprHoverButtom, 0, _guiLarg/2 + (80 * _escala ), _coinY + (-45.5 * _escala), _escala, _escala, 0, c_white, 1);
			}
			
			if (room != rmInit) {
				draw_sprite_ext(sprSmallIcons, 7, _guiLarg/2 + (83 * _escala ), _coinY + (-42.5 * _escala), _escala, _escala, 0, c_white, 1);
			} else {
				draw_sprite_ext(sprSmallIcons, 14, _guiLarg/2 + (83 * _escala ), _coinY + (-42.5 * _escala), _escala, _escala, 0, c_white, 1);
			}
			
			//Desenha os icones das moedas e seus valores
			var _coinIX = _guiLarg/2 + (77 * _escala);
			var _coinIY = _guiAlt/2 + (-19 * _escala);
			var _coinSpace = 10 * _escala;
			var _coinsScale = 3;
			draw_sprite_ext(sprSilverCoin, 0, _coinIX, _coinIY, _coinsScale, _coinsScale, 0, c_white, 1);
			draw_sprite_ext(sprGoldCoin, 0, _coinIX, _coinIY + _coinSpace, _coinsScale, _coinsScale, 0, c_white, 1);
		
			//Desenha o texto do valor das moedas e do item selecionado
			draw_text_ext_transformed(_coinIX + (15 * _escala), _coinIY + (-6.5 * _escala), global.coinsSilver, 10, 300, .7, .7, 0);
			draw_text_ext_transformed(_coinIX + (15 * _escala), _coinIY + _coinSpace + (-6.5 * _escala), global.coinsGold, 10, 300, .7, .7, 0);
		} 
		
		else if (_option == 10) {
			if (point_in_rectangle(_mouseX, _mouseY, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY + 100, _coinX + (14 * _escala + _recBackSpaceX), _coinY + (14 * _escala + _recBackSpaceY + 100))) {
				draw_sprite_ext(sprHoverButtom, 0, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY + 100, _escala, _escala, 0, c_white, 1)
			}
			
			//Desenha os icones das moedas e seus valores
			var _coinIX = _guiLarg/2 + (77 * _escala);
			var _coinIY = _guiAlt/2;
			var _coinSpace = 10 * _escala;
			var _coinsScale = 3;
			draw_sprite_ext(sprSilverCoin, 0, _coinIX, _coinIY, _coinsScale, _coinsScale, 0, c_white, 1);
			draw_sprite_ext(sprGoldCoin, 0, _coinIX, _coinIY + _coinSpace, _coinsScale, _coinsScale, 0, c_white, 1);
		
			//Desenha o texto do valor das moedas e do item selecionado
			draw_text_ext_transformed(_coinIX + (15 * _escala), _coinIY + (-6.5 * _escala), global.coinsSilver, 10, 300, .7, .7, 0);
			draw_text_ext_transformed(_coinIX + (15 * _escala), _coinIY + _coinSpace + (-6.5 * _escala), global.coinsGold, 10, 300, .7, .7, 0);
		}
		
		for (var i = 0; i < _numCoins; i++) {
		    var _coinXX = _coinX + (i * _coinSpaceX);
			var _coinYY = _coinY + (50 * _escala)
			
			//Itens
			
		    // Array para os sprites e legendas fica no criar
			if (_option == 9) {
			    // Desenhe a moeda
					draw_sprite_ext(coinSprites[i], 0, _coinXX, _coinY, _coinScale, _coinScale, 0, c_white, 1);
			
			    // Desenhe a legenda
					draw_text_ext_transformed(_coinX + (10 * _escala + _coinTextSpace * i), _coinY - 18.8, coinLabels[i], 10, 300, .6, .6, 0);

				//Upgrades

				// Desenhe a moeda
					draw_sprite_ext(coinSprites2[i], 0, _coinXX, _coinYY, _coinScale, _coinScale, 0, c_white, 1);
			
			    // Desenhe a legenda
			    draw_text_ext_transformed(_coinX + (10 * _escala + _coinTextSpace * i), _coinYY - 18.8, coinLabels2[i], 10, 300, .6, .6, 0);
			} else if (_option == 10) {
				var _spaceY = 25 * _escala;
				var _spaceX = 10 * _escala;
				
				// Desenhe a moeda
					draw_sprite_ext(coinSprites3[i], 0, _coinXX, _coinY + _spaceY, _coinScale, _coinScale, 0, c_white, 1);
			
			    // Desenhe a legenda
					draw_text_ext_transformed(_coinX + (10 * _escala + _coinTextSpace * i), _spaceY + _coinY - 18.8, coinLabels3[i], 10, 300, .6, .6, 0);
			}
		} 
		
		// Desenha o hover nos cards
		var _recSX = _guiLarg/2 + (-57 * _escala);
		var _recSY = _guiAlt/2 + (2.5 * _escala);
		var _recSSpace = 30 * _escala;
		var _recSSpace2 = -50 * _escala;
		var _numRetangulos = 4;
		for (var i = 0; i < _numRetangulos; i++) {
			
			if (_option == 9) {
				if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala))) {
					draw_sprite_ext(sprHoverShop, 1, _recSX + (_recSSpace * i), _recSY, _escala, _escala, 0, c_white, 1);
				}
				else if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY + _recSSpace2, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala + _recSSpace2))) {
					draw_sprite_ext(sprHoverShop, 0, _recSX + (_recSSpace * i), _recSY + _recSSpace2, _escala, _escala, 0, c_white, 1);
				}
			} else if (_option == 10) {
				var _spaceX = 10 * _escala;
				var _spaceY = -25 * _escala;
				
				if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY + _spaceY, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + _spaceY + (39 * _escala))) {
					draw_sprite_ext(sprHoverShop, 0, _recSX + (_recSSpace * i), _recSY + _spaceY, _escala, _escala, 0, c_white, 1);
				}
			} 
		}
		
		if (_option == 9) {
			
			//Barrinha vermelha de upgrade
			var _xx = _guiLarg/2 + (-52 * _escala);
			var _yy = _guiAlt/2 + (30.5 * _escala);
			var _upgLife = global.upgradeLifes;
			var _upgStam = global.upgradeStam;
			var _upgDano = global.upgradeDano;
			var _upgRestVeneno = global.upgradeVeneno;
			
			// Desenhar upgrades de vida
			scrDrawUpgrades(_xx, _yy, _escala, _upgLife);

			// Desenhar upgrades de estamina
			scrDrawUpgrades(_xx + (30 * _escala), _yy, _escala, _upgStam);
			
			// Desenhar upgrades de resistencia a veneno
			scrDrawUpgrades(_xx + (60 * _escala), _yy, _escala, _upgRestVeneno);
			
			// Desenhar upgrades de dano
			scrDrawUpgrades(_xx + (90 * _escala), _yy, _escala, _upgDano);
			
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
		} else if (_option == 10) {
			var _spaceY = 24.5 * _escala;
			//Itens
			draw_sprite_ext(sprDiamondCoin, 0, _coinX + (7 * _escala), _coinY + _spaceY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
			draw_sprite_ext(sprSaphireCoin, 0, _coinX + (7 * _escala + _coinSpaceX), _spaceY + _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
			draw_sprite_ext(sprRubyCoin, 0, _coinX + (7 * _escala + _coinSpaceX * 2), _spaceY + _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
			draw_sprite_ext(sprSkullSell, 0, _coinX + (7 * _escala + (_coinSpaceX * 3)), _spaceY + _coinY + (-22.5 * _escala), 4, 4, 0, c_white, 1);
		}
	} else if (_option == 11) {
		var _textItem = "";
		var _recInvX = _guiLarg/2 + (-39 * _escala);
		var _recInvY = _guiAlt/2 + (-30.5 * _escala);
		var _spaceInvX = 23.2 * _escala;
		var _spaceInvY = 23.2 * _escala;
		var _slotsH = 3;
		var _slotsV = 2;
		var _totalSlots = _slotsH * _slotsV;
		var _slotSize = 20 * _escala; 
		var _iX = 0;
		var _iY = 0;
		var _recIX = _guiLarg/2;
		var _recIY = _guiAlt/2;
		var _mouseClick = device_mouse_check_button_pressed(0, mb_left);
		
		var _arrowAlphas = [.6, .6]; // Array para armazenar as opacidades das setas
		var _arrowPositions = [
		    [_recInvX + (-12 * _escala), _recInvY + (17.5 * _escala)],
		    [_recInvX + (74 * _escala), _recInvY + (17.5 * _escala)]
		];

		for (var i = 0; i < 2; i++) {
		    if (point_in_rectangle(_mouseX, _mouseY, _arrowPositions[i][0], _arrowPositions[i][1], _arrowPositions[i][0] + (8 * 3), _arrowPositions[i][1] + (12 * 3))) {
		        _arrowAlphas[i] = 1;
		    } else {
		        _arrowAlphas[i] = .6;
		    }
    
		    draw_sprite_ext(sprArrows, i, _arrowPositions[i][0], _arrowPositions[i][1], 3, 3, 0, c_white, _arrowAlphas[i]);
		}


		//Desenha os quadrados do inventario
		for (var i = 0; i < _totalSlots; i++) {
			var _slotsX = _recInvX + ((_slotsH + _spaceInvX) * _iX);
			var _slotsY = _recInvY + ((_slotsH + _spaceInvY) * _iY);
			
			if (point_in_rectangle(_mouseX, _mouseY, _slotsX, _slotsY, _slotsX + _slotSize, _slotsY + _slotSize)) {
				draw_sprite_ext(sprHoverInventory, 0, _slotsX, _slotsY, _escala, _escala, 0, c_white, 1);
				
				// Dropa item no chao
				if (keyboard_check_pressed(ord("G")) && gridItems[# Infos.Item, i] != -1) {
					var _cordX = objPlayer.x + (30 * objPlayer.image_xscale);
					var _cordY = objPlayer.y - 10;
				
					var _inst = instance_create_layer(_cordX, _cordY, "Itens", objItens);
						_inst.sprite = gridItems[# Infos.Item, i];
						_inst.quantidade = gridItems[# Infos.Quantidade, i];
					
					gridItems[# Infos.Item, i] = -1;
					gridItems[# Infos.Quantidade, i] = -1;
					gridItems[# Infos.Nome, i] = -1;
				}

				
				// Cria o nome do item embaixo
				if (gridItems[# Infos.Item, i] != -1) {
					_textItem = gridItems[# Infos.Nome, i]; // Define o nome dos items
					
					if (itemSelecionado2 == -1) {
						itemSelecionado2 = gridItems[# Infos.Item, i];
					} else if (itemSelecionado2 != gridItems[# Infos.Item, i]) {
						itemSelecionado2 = -1;
						doubleClick = 0;
					}
				}
				
				// Consome o item se clicar duas vezes nele
				if (_mouseClick) {
					if (itemSelecionado2 == gridItems[# Infos.Item, i]) {
						doubleClick++;
						doubleClick = clamp(doubleClick, 0, 2);
						
						if (doubleClick >= 2) {
							if (global.lifes < objPlayer.maxLifes && itemSelecionado2 == Items.Life) {
								gridItems[# Infos.Quantidade, i]--;
								scrRecharge(2);
							} else if (global.stamina < objPlayer.maxStamina && itemSelecionado2 == Items.Stamina) {
								gridItems[# Infos.Quantidade, i]--;
								scrRecharge(0,2);
							}
							doubleClick = 0;	
						}
					}
				}
				
				if (doubleClick > 0) {					
					alarm[0] = .2 * game_get_speed(gamespeed_fps);
				}
				
				//Move o item para slot ou staca
				if (device_mouse_check_button(0, mb_left) && itemSelecionado == -1) {
				mouseTimer++ // <-- Tempo para mover item
				//Se nenhum item estiver selecionado
				if (mouseTimer == 10) {
						itemSelecionado = gridItems[# Infos.Item, i];
						posSelecionado = i;
					}
				} 
				// Se ja tiver um item selecionado
				else if (device_mouse_check_button_released(0, mb_left) && itemSelecionado != -1) {
					// 1 - Item é igual ao do slot que iremos colocar
					if (itemSelecionado == gridItems[# Infos.Item, i] && posSelecionado != i && gridItems[# Infos.Item, i] == gridItems[# Infos.Item, posSelecionado]) {
						gridItems[# Infos.Quantidade, i] += gridItems[# Infos.Quantidade, posSelecionado];
							
						gridItems[# Infos.Item, posSelecionado] = -1;
						gridItems[# Infos.Quantidade, posSelecionado] = -1;
						gridItems[# Infos.Nome, posSelecionado] = -1;
							
						itemSelecionado = -1;
						posSelecionado = -1;
					}
					// 2 - Slot selecionado esta vazio
					else if (gridItems[# Infos.Item, i] == -1) {
						gridItems[# Infos.Item, i] = gridItems[# Infos.Item, posSelecionado];
						gridItems[# Infos.Quantidade, i] = gridItems[# Infos.Quantidade, posSelecionado];
						gridItems[# Infos.Nome, i] = gridItems[# Infos.Nome, posSelecionado];
							
						gridItems[# Infos.Item, posSelecionado] = -1;
						gridItems[# Infos.Quantidade, posSelecionado] = -1;
						gridItems[# Infos.Nome, posSelecionado] = -1;
							
						itemSelecionado = -1;
						posSelecionado = -1;
					}
					// 3 - Slot selecionado ja tem um item, troca de lugar
					else if (gridItems[# Infos.Item, posSelecionado] != gridItems[# Infos.Item, i]) {
						var _item = gridItems[# Infos.Item, i];
						var _quantidade = gridItems[# Infos.Quantidade, i];
						var _nome = gridItems[# Infos.Nome, i];
							
						gridItems[# Infos.Item, i] = gridItems[# Infos.Item, posSelecionado];
						gridItems[# Infos.Quantidade, i] = gridItems[# Infos.Quantidade, posSelecionado];
						gridItems[# Infos.Nome, i] = gridItems[# Infos.Nome, posSelecionado];
							
						gridItems[# Infos.Item, posSelecionado] = _item;
						gridItems[# Infos.Quantidade, posSelecionado] = _quantidade;
						gridItems[# Infos.Nome, posSelecionado] = _nome;
							
						itemSelecionado = -1;
						posSelecionado = -1;
					}
				}
			}
			
			if (gridItems[# Infos.Quantidade, i] <= 0) {
				gridItems[# Infos.Item, i] = -1;
				gridItems[# Infos.Quantidade, i] = -1;
				gridItems[# Infos.Nome, i] = -1;
				gridItems[# Infos.Descricao, i] = -1;
			}
			
			if (gridItems[# Infos.Item, i] != -1) {
				
				// Desenha sprite e a quantidade do item no slot
				draw_sprite_ext(sprItems, gridItems[# Infos.Item, i], _slotsX, _slotsY, _escala, _escala, 0, c_white, 1);
				scrDrawOutLine(_slotsX + _slotSize - 6, _slotsY + (6 * _escala), gridItems[# Infos.Quantidade, i], 2, c_white, 16, 100, 100, .5, .5, 0);
				
				// Desenha o ponto de interrugação
				if (point_in_rectangle(_mouseX, _mouseY, _slotsX, _slotsY, _slotsX + _slotSize, _slotsY + _slotSize)) {
					scrDrawOutLine(_slotsX + _slotSize + (-18 * _escala), _slotsY + (5 * _escala), "?", 2, c_white, 6, 100, 100, .4, .4, 0);
					//draw_circle(_slotsX + _slotSize + (-18.5 * _escala), _slotsY + (1.5 * _escala), 10, false)
					
					if (point_in_circle(_mouseX, _mouseY, _slotsX + _slotSize + (-18.5 * _escala), _slotsY + (1.5 * _escala), 10)) {
						if (_mouseClick){
							global.option = 13;
						}
					}
				}

			 /*if (point_in_rectangle(_mouseX, _mouseY, _slotsX, _slotsY, _slotsX + _slotSize, _slotsY + _slotSize)) {
					var _xx = _guiLarg/2 + (-80 * _escala);
					var _yy = _guiAlt/2 + (-25 * _escala);
				
					draw_sprite_ext(sprHoverDesc, 0, _xx, _yy, _escala, _escala, 0, c_white, 1);
					draw_set_color(#c0c0c0);
					//draw_text_ext_transformed(_xx + (14.5 * _escala), _yy + (18 * _escala), gridItems[# Infos.Descricao, i], 60, 400, .3, .3, 0);
					draw_set_color(#33323d);
				}*/
			}
			
			_iX++;
			if(_iX >= _slotsH) {
				_iX = 0;
				_iY++;
			}
		}
		// 4 - Soltar/Dropar item selecionado
		if (device_mouse_check_button_released(0, mb_left)) {
			mouseTimer = 0; // <-- Reseta
			itemSelecionado = -1;
			posSelecionado = -1;
		}
		
		if (itemSelecionado != -1 && device_mouse_check_button(0, mb_left)) {
			draw_sprite_ext(sprItems, itemSelecionado, _mouseX, _mouseY, _escala, _escala, 0, c_white, .5);
		}
		
		//Quadrado fechar
		if (point_in_rectangle(_mouseX, _mouseY, _guiLarg/2 + (-52 * _escala), _guiAlt/2 + (-44.5 * _escala), _guiLarg/2 + (-38 * _escala), _guiAlt/2 + (-30.5 * _escala))) {
			draw_sprite_ext(sprHoverButtom, 0, _guiLarg/2 + (-52 * _escala), _guiAlt/2 + (-44.5 * _escala), _escala, _escala, 0, c_white, 1); 
		}
		
		//Icone do Shops
		if (point_in_rectangle(_mouseX, _mouseY, _recIX + (49 * _escala), _recIY + (-29.5 * _escala), _recIX + (63 * _escala), _recIY + (-15.5 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recIX + (49 * _escala), _recIY + (-29.5 * _escala), _escala, _escala, 0, c_white, 1);
		}
		
		//Desenha os icones das moedas e seus valores
		var _coinX = _guiLarg/2 + (46 * _escala);
		var _coinY = _guiAlt/2 + (-3 * _escala);
		var _coinSpace = 10 * _escala;
		var _coinsScale = 3;
		draw_sprite_ext(sprSilverCoin, 0, _coinX, _coinY, _coinsScale, _coinsScale, 0, c_white, 1);
		draw_sprite_ext(sprGoldCoin, 0, _coinX, _coinY + _coinSpace, _coinsScale, _coinsScale, 0, c_white, 1);
		
		//Desenha o texto do valor das moedas e do item selecionado
		draw_text_ext_transformed(_coinX + (15 * _escala), _coinY + (-6.5 * _escala), global.coinsSilver, 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_coinX + (15 * _escala), _coinY + _coinSpace + (-6.5 * _escala), global.coinsGold, 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX + (-2 * _escala), _textY - (-62 * _escala), _textItem, 10, 600, .6, .6, 0);
	}
	
	//Desenha o icone que ira dentro do retangulo
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
		
	if (_option == 0) {
		iconClose = 4;
	} else if (_option == 2 || _option == 14) {
		iconClose = 0;
	}
	
	if (_option == 0 || _option == 2 || _option == 3 || _option == 4 || _option == 14) {
		draw_sprite_ext(sprSmallIcons, iconClose, _recBX + 12, _recBY + 12, _escala, _escala, 0, c_white, 1);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _recBX, _recBY, _recBX + (14 * _escala), _recBY + (14 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _recBX, _recBY, _escala, _escala, 0, c_white, 1);
		}
	}
		
	//Desenha sombra nas opções !
	//draw_rectangle(_recX, _recY, _recX + (72 * _escala), _recY + (14 * _escala), true);
		
	//Desenha texto do menu inicial
	var _menuText = ["Pause", "Saves", "Options", "Audio", "Guia", "Creditos", "Shop", "Vendas", "Inventario", "Tela Inicial", "Guia Elixir", "Items", "ERRO"];
	var _textSelected = 0;
	switch (_option) {
	    default: // Define erro caso não exista a seleção
	        _textSelected = _menuText[12];
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
		
		case 10: // Tela Vendas
	       _textSelected = _menuText[7];
	    break;
		
		case 11: // Tela Inventario
	       _textSelected = _menuText[8];
	    break;
		
		case 12: // Tela Inventario
	       _textSelected = _menuText[9];
	    break;
		
		case 13: // Tela guia de Elixirs
	       _textSelected = _menuText[10];
	    break;
		
		case 14: // Tela guia dos items
	       _textSelected = _menuText[11];
	    break;
		
		case 15: // Tela guia dos items
	       _textSelected = _menuText[1];
	    break;
	}
	
	// Desenha o texto selecionado
	if (_textSelected != noone) {
	switch (_option) {
		default:
	        if (_option != 9 && _option != 10) {
	            draw_text_ext_transformed(_textX + (3.5 * _escala), _textY - (38 * _escala), _textSelected, 10, 300, .8, .8, 0);
	        }
		break;
		
	    case 9:
	        draw_text_ext_transformed(_textX + (5.5 * _escala), _textY - (52.5 * _escala), _textSelected, 10, 300, .8, .8, 0);
		break;
		
	    case 10:
	        draw_text_ext_transformed(_textX + (5 * _escala), _textY - (27.5 * _escala), _textSelected, 10, 300, .8, .8, 0);
		break;
		
		case 11:
	        draw_text_ext_transformed(_textX + (-2 * _escala), _textY - (36.6 * _escala), _textSelected, 10, 300, .8, .8, 0);
		break;
		
		case 12:
	        draw_text_ext_transformed(_textX + (3.5 * _escala), _textY - (38 * _escala), _textSelected, 10, 600, .7, .7, 0);
		break;
		}
	}
	
	// Retangulos do menu principal e do options
	if (_option == 0 || _option == 2 || _option == 4 || _option == 14) {
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
	} else if (_option == 4) { 
		textArray = ["Items", "Player", "Desafios", "Inimigos"];
	} else if (_option == 14) { 
		textArray = ["Elx. de Cura", "Elx. de Estamina", "Elx. Envenenado", "Diamante"];
	}
	
	var numTexts = array_length(textArray);
	var textSpace = _textSpace;

	for (var i = 0; i < numTexts; i++) {
		var text = textArray[i];
		var textX = _textX;
		var textY = _textY + (i * textSpace);
		
		switch(_option) {
			default:
				draw_text_ext_transformed(textX - 5, textY, text, 10, 300, 0.8, 0.8, 0);
			break;
			
			case 4:
				draw_text_ext_transformed(textX + 8, textY, text, 10, 300, 0.8, 0.8, 0);
			break;
			
			case 14:
				draw_text_ext_transformed(textX + 8, textY, text, 10, 600, 0.62, 0.62, 0);
			break;
		}
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
		var _posPY = _guiAlt/2 - (4 * _escala);
		draw_sprite_ext(sprCoinsBoard, 0, _posPX, _posPY, 2.6, 2.6, 0, c_white, 1);
		

		var _textX3 = _guiLarg/2 + (40 * _escala);
		var _textY3 = _guiAlt/2 - (2.5 * _escala);
		var _textSpace3 = 37;
			
		//Desenha as moedas na posição
		draw_text_ext_transformed(_textX3 + (-5 * _escala), _textY3 + (-9 * _escala), "Save: " + string(global.save), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3, string(global.coinsSilver), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + _textSpace3, string(global.coinsGold), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + (_textSpace3 * 2), string(global.coinsDiamond), 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_textX3, _textY3 + (_textSpace3 * 3), string(global.coinsSaphire), 10, 300, .6, .6, 0);
		
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
	
	// Desenha a tela de confirmação
	if (_option == 12 || _option == 15) {
		var _xx = _guiLarg/2 + (8.5 * _escala);
		var _yy = _guiAlt/2 + (24 * _escala);
		var _spaceXX = -37 * _escala;
		var _msgText = ["Deseja voltar a tela inicial?", "Deseja substituir o progresso salvo neste save ?"];
		var _msgDef = 0;
		var _textScale = .8;
		var _textWidth = 450;
		var _textYY = -38.5 * _escala;
		
		if (_option == 12) {
			_msgDef = _msgText[0]
			_textScale = .8;
			_textWidth = 350;
			_textYY = -38.5 * _escala;
		}
		
		if (_option == 15) {
			_msgDef = _msgText[1]
			_textScale = .6;
			_textWidth = 450
			_textYY = -39 * _escala;
		}
		
		// Desenha texto da tela de confirmação
		draw_text_ext_transformed(_xx + (-26.5 * _escala), _yy + (4 * _escala), "Sim", 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_xx + (10.5 * _escala), _yy + (4 * _escala), "Nao", 10, 300, .6, .6, 0);
		draw_text_ext_transformed(_xx + (-8 * _escala), _yy + _textYY, _msgDef, 50, _textWidth, _textScale, _textScale, 0);

		if (point_in_rectangle(_mouseX, _mouseY, _xx + _spaceXX, _yy, _xx + _spaceXX + (21 * _escala), _yy + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom2, 0, _xx + _spaceXX, _yy, _escala, _escala, 0, c_white, 1);
		}
		
		if (point_in_rectangle(_mouseX, _mouseY, _xx, _yy, _xx + (21 * _escala), _yy + (14 * _escala))) {
			draw_sprite_ext(sprHoverButtom2, 0, _xx, _yy, _escala, _escala, 0, c_white, 1);
		}
	} else if (_option == 13) {
		var _xx = _guiLarg/2 + (-47.5 * _escala);
		var _yy = _guiAlt/2 + (-46 * _escala);
		
		if (point_in_rectangle(_mouseX, _mouseY, _xx, _yy, _xx + (21 * _escala), _yy + (14 * _escala))) {
			draw_sprite_ext(sprHoverClose, 0, _xx, _yy, _escala, _escala, 0, c_white, 1);
		}
	}
	draw_set_alpha(1); // Restaura a opacidade padrão (opcional, dependendo do que você deseja fazer a seguir)
	draw_set_color(c_white); // Restaura a cor padrão
}

#endregion



