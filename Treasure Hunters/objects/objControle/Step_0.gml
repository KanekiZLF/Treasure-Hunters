
#region Efeitos da espada

if instance_exists(objSword) {
    var _num = instance_number(objSword);

    for (var i = 0; i < _num; i++) {
        var _inst = instance_find(objSword, i);
		
		if (_inst.isSpeed == 0) {
			_inst.isSpeed = _inst.speed; // Armazena a velocidade atual da instância
		}

        if (global.gamepause) {
            _inst.speed = 0;
        } else if (!global.gamepause && _inst.isSpeed != 0) {
			_inst.speed = _inst.isSpeed;
			_inst.isSpeed = 0;
        } 
    }
}

#endregion

#region Menu de pause
var _option = global.option;
var _escala2 = 4;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _guiLarg = display_get_gui_width();
var _guiAlt = display_get_gui_height();


if (_option == 0 || _option == 2) {
	var _sprW = sprite_get_width(sprOptionHover) - 5;
	var _sprH = sprite_get_height(sprOptionHover);
	var _recSpace = 17 * _escala2;
	var _recX = display_get_gui_width() / 2 + (-35.5 * _escala2); // Corrigido
	var _recY = display_get_gui_height() / 2 + (-32 * _escala2); // Corrigido
	var _numRetangulos = 4;

	//Fecha a tela de opções
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _recBX, _recBY, _recBX + (14 * _escala2), _recBY + (14 * _escala2))) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			
			if (_option == 0) {
				global.gamepause = false;
				scrResume();
			}
					
			if (_option == 2) {
				global.option = 0;
			}
			show_debug_message(_option)
		}
	}
	
	// Tela de opções 
	for (var i = 0; i < _numRetangulos; i++) {
	    var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
	    var rectBottom = rectTop + (14 * _escala2); // Coordenada Y do fundo do retângulo
    
	    if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (72 * _escala2), rectBottom) {
			// Continuar
			if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				if (_option == 0) {
					global.gamepause = false;
					scrResume();
				}
			}
		 
			// Salvar / Carregar
			if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				if (_option == 0) {
					global.option = 1;
				}
			}
		
			// Opções
			if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				if (_option == 0) {
					global.option = 2;
				}
				
				if (_option == 2) {
					global.option = 3;
				}
			}
		
			// Sair
	        if (device_mouse_check_button_pressed(0, mb_left) && i == 3) {
				if (_option == 0) {
					game_end(); //<-- Encerra o jogo;
				}
			}
			break; // Encerre o loop após encontrar um retângulo
	    }
	}// Opções da tela de save 
} else if (_option == 1) {
	var _recSpace = 21 * _escala2;
	var _recX = display_get_gui_width()/2 + (-33.5 * _escala2);
	var _recY = display_get_gui_height()/2 + (-27.5 * _escala2);
	var _sprW = sprite_get_width(sprHoverSave) - 5;
	var _sprH = sprite_get_height(sprHoverSave);
	var _numRetangulos = 3;
	var _recBX = _guiLarg/2 - 203;
	var _recBY = 178;
	var _recSX = _guiLarg/2 + 70
	var _recSY= 234
	
	//Botão para carregar o jogo dependendo de qual save foi selecionado
	if (point_in_rectangle(_mouseX, _mouseY,_recSX, _recSY, _recSX + (14 * _escala2), _recSY + (14 * _escala2))) {
			//objGui.smallIcon = 5; //<-- Altera o icone caso algum save exista
		}
	
	//Retangulo da seta voltar da tela de save
	if (point_in_rectangle(_mouseX, _mouseY, _recBX, _recBY, _recBX + (14 * _escala2), _recBY + (14 * _escala2))) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			global.option = 0;
		}
	}
	
	for (var i = 0; i < _numRetangulos; i++) {
			var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
			var rectBottom = rectTop + (14 * _escala2); // Coordenada Y do fundo do retângulo
    
	if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (28 * _escala2), rectBottom) {
		//Save 1
		if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				
			}
			
		//Save 2
		if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				
			}
			
		//Save 3
		if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				
			}
		break; // Encerre o loop após encontrar um retângulo
		}
	}
}

#endregion