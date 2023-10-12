/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region Bar Gui

var _pause = global.gamepause;
var _option = global.option;
var _escala = 3;
var _guiAlt = display_get_gui_height();
var _guiLarg = display_get_gui_width();
var _sprAlt = sprite_get_height(sprLifeBar) * _escala;
var _sprAlt2 = sprite_get_height(sprStaminaBar) * _escala + 8;
var _hudAlt = _guiAlt/15;

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
draw_sprite_ext(sprLifeColor, 15, 22 * _escala, _hudAlt, (_lifes/_maxLifes) * _escala, _escala, 0, c_white, 1);

draw_sprite_ext(sprStaminaColor, 0, 26 * _escala, _hudAlt + _sprAlt, (_stamina/_maxStamina) * _escala, _escala, 0, c_white, 1);

if (_maxPoison > 0) {
	draw_sprite_ext(sprPoisonColor, 0, 26 * _escala, _hudAlt + _sprAlt + _sprAlt2, (_poison/_maxPoison2) * _escala, _escala, 0, c_white, 1);
}

#endregion

#region Pause Gui
// Neste treco entra o GUI da tela de pause e seus menus respectivos !!

//Medidas da sprite de PAUSE !
var _sprDraw = 0;
var _escala2 = 4;
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
	
}
var _sprWidht = sprite_get_width(_sprDraw) * _escala2;
var _sprHeight = sprite_get_height(_sprDraw) * _escala2;
var _x = (_guiLarg - _sprWidht) / 2;
var _y = (_guiAlt - _sprHeight) / 2;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);

if (_pause) {
	
	//Desenha a tela escura
	draw_set_alpha(0.5); // Defina a opacidade desejada (0 a 1, onde 0 é completamente transparente e 1 é completamente opaco)
	draw_set_color(c_black); // Defina a cor como preto
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Desenhe um retângulo preto que cobre a tela
	
	// Desenha as telas de opções
	if (_option == 0 || _option == 2 || _option == 3) {
		draw_sprite_ext(_sprDraw, 0, _x, _y, _escala2, _escala2, 0, c_white, 1);
	} else if (_option == 1) {
		draw_sprite_ext(_sprDraw, 0, _x + 12, _y, _escala2, _escala2, 0, c_white, 1);
	}
	
	// Desenha as opções do AUDIO
	if (_option == 3) {
		var _recBX3 = _guiLarg/2 + 66;
		var _recBY3 = 236;
		var _recSpace3 = 15 * _escala2;
		
		//Desenha o Retangulo Direito
		draw_sprite_ext(sprSmallIcons, iconMusic, _recBX3 + 12, _recBY3 + 12, _escala2, _escala2, 0, c_white, 1)
		draw_sprite_ext(sprSmallIcons, iconSfx, _recBX3 + 12, _recBY3 + (18 * _escala2), _escala2, _escala2, 0, c_white, 1)
		
		
		//Desenha o hover do retangulo direito
		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3, _recBX3 + (14 * _escala2), _recBY3 + (14 * _escala2))) {
			draw_sprite_ext(sprHoverButtom, 0, _recBX3, _recBY3, _escala2, _escala2, 0, c_white, 1);
		}
		
		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3 + _recSpace3, _recBX3 + (14 * _escala2), _recBY3 +_recSpace3 + (14 * _escala2))) {
			draw_sprite_ext(sprHoverButtom, 0, _recBX3, _recBY3 + _recSpace3, _escala2, _escala2, 0, c_white, 1);
		}
	}

	// Desenha os textos
	var _textSpace = 17 * _escala2;
	var _textX = _guiLarg/2 + (-3 * _escala2);
	var _textY = _guiAlt/2 + (-27.5 * _escala2);
	var _recSpace = 17 * _escala2;
	var _recX = _guiLarg/2 + (-35.5 * _escala2);
	var _recY = _guiAlt/2 + (-32 * _escala2);
	draw_set_alpha(1);
	draw_set_color(#33323d);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnTextoBase30);
	
	if (_option == 3) {
		draw_text_ext_transformed(_textX - 30, _textY + 3, "Musica", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX - 30, _textY + (16 * _escala2), "Efeitos", 10, 300, .7, .7, 0);
		draw_text_ext_transformed(_textX - (-3 * _escala2), _textY + (36 * _escala2), "Volume", 10, 300, .7, .7, 0);
	}
	
	//Desenha o icone que ira dentro do retangulo
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
		
	if (_option == 0) {
		iconClose = 4;
	} else if (_option == 2) {
		iconClose = 0;
	}
	
	if (_option == 0 || _option == 2 || _option == 3) {
		draw_sprite_ext(sprSmallIcons, iconClose, _recBX + 12, _recBY + 12, _escala2, _escala2, 0, c_white, 1);
		if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _recBX, _recBY, _recBX + (14 * _escala2), _recBY + (14 * _escala2))) {
			draw_sprite_ext(sprHoverClose, 0, _recBX, _recBY, _escala2, _escala2, 0, c_white, 1);
		}
	}
		
	//Desenha sombra nas opções !
	//draw_rectangle(_recX, _recY, _recX + (72 * _escala2), _recY + (14 * _escala2), true);
		
	//Desenha texto do menu inicial
	var _menuText = ["Pause", "Saves", "Options", "Audio", "Controles", "Creditos"];
	var _textSelected = 0;
	switch (_option) {
	    case 0:
	        _textSelected = _menuText[0];
	     break;
		
	    case 1:
	        _textSelected = _menuText[1];
	    break;
		
	    case 2:
	        _textSelected = _menuText[2];
	    break;
		
	    case 3:
	        _textSelected = _menuText[3];
	    break;
		
	    default:
	        // Caso _option não corresponda a nenhum dos casos acima
	        // Faça algo aqui, se necessário
	     break;
	}
		
	draw_text_ext_transformed(_textX + (3.5 * _escala2), _textY - (38 * _escala2), _textSelected, 10, 300, .8, .8, 0);
	
	// Retangulos do menu principal e do options
	if (_option == 0 || _option == 2) {
		var _sprW = sprite_get_width(sprOptionHover) - 5;
		var _sprH = sprite_get_height(sprOptionHover);
		var _numRetangulos = 4;
	
		for (var i = 0; i < _numRetangulos; i++) {
			var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
			var rectBottom = rectTop + (14 * _escala2); // Coordenada Y do fundo do retângulo
    
			if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (72 * _escala2), rectBottom) {
			    draw_sprite_ext(sprOptionHover, 0, _recX, _recY + (i * _recSpace), _escala2, _escala2, 0, c_white, 1);
			    break; // Encerre o loop após encontrar um retângulo
			}
		}
	}
		
	//Desenha o texto do cabeçalho dos menus
	var textArray = [];
	if (_option == 0) {
		textArray = ["Continuar", "Salvar", "Options", "Sair"];
	} else if (_option == 2) {
		textArray = ["Guia", "Controles", "Audio", "Creditos"];
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
		var _textSpace2 = 22 * _escala2;
		var _textX2 = _guiLarg/2 + (-16.5 * _escala2);
		var _textY2 = _guiAlt/2 + (-25 * _escala2);
		draw_set_alpha(1);
		draw_set_color(#33323d);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_font(fnTextoBase30);
		
		//Desenha o retangulo
		var _recBX2 = _guiLarg/2 - 190;
		var _recBY2 = 176;
		var _recSX = _guiLarg/2 + 82;
		var _recSY = 232;
		draw_sprite_ext(sprSmallIcons, iconSave, _guiLarg/2 + 94, _recBY2 + 68, _escala2, _escala2, 0, c_white, 1);
		
		if (point_in_rectangle(_mouseX, _mouseY, _recBX2, _recBY2, _recBX2 + (14 * _escala2), _recBY2 + (14 * _escala2))) {
			draw_sprite_ext(sprHoverButtom, 0, _recBX2, _recBY2, _escala2, _escala2, 0, c_white, 1);
		}
		
		if (point_in_rectangle(_mouseX, _mouseY,_recSX, _recSY, _recSX + (14 * _escala2), _recSY + (14 * _escala2))) {
			draw_sprite_ext(sprHoverButtom, 0, _recSX, _recSY, _escala2, _escala2, 0, c_white, 1);
		}
		
		for (var i = 0; i < _numTexts; i++) {
			var _text = _textArray[i];
			var textY = _textY2 + (i * _textSpace2)
			
			draw_text_ext_transformed(_textX2, textY, _text, 10, 300, .65, .65, 0);
		}
		
		var _recSpace2 = 22 * _escala2;
		var _recX2 = _guiLarg/2 + (-32.5 * _escala2);
		var _recY2 = _guiAlt/2 + (-31 * _escala2);
		var _sprW = sprite_get_width(sprHoverSave) - 5;
		var _sprH = sprite_get_height(sprHoverSave);
		var _numRetangulos = 3;
	
		for (var i = 0; i < _numRetangulos; i++) {
		    var rectTop = _recY2 + (i * _recSpace2); // Coordenada Y do topo do retângulo
		    var rectBottom = rectTop + (18 * _escala2); // Coordenada Y do fundo do retângulo
    
		    if point_in_rectangle(_mouseX, _mouseY, _recX2, rectTop, _recX2 + (32 * _escala2), rectBottom) {
		        draw_sprite_ext(sprHoverSave, 0, _recX2, _recY2 + (i * _recSpace2), _escala2, _escala2, 0, c_white, 1);
		        break; // Encerre o loop após encontrar um retângulo
		    }
		}
	}
	
} else if (!_pause) {
	draw_set_alpha(1); // Restaura a opacidade padrão (opcional, dependendo do que você deseja fazer a seguir)
	draw_set_color(c_white); // Restaura a cor padrão
}

#endregion