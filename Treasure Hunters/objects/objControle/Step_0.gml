
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

var _escala2 = 4;
var _sprW = sprite_get_width(sprOptionHover) - 5;
var _sprH = sprite_get_height(sprOptionHover);
var _recSpace = 17 * _escala2;
var _recX = display_get_gui_width() / 2 + (-35.5 * _escala2); // Corrigido
var _recY = display_get_gui_height() / 2 + (-32 * _escala2); // Corrigido
var _numRetangulos = 4;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);


if (global.option == 0) {
	// Cria uma repetição para sempre verificar a posição do mouse
	for (var i = 0; i < _numRetangulos; i++) {
	    var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
	    var rectBottom = rectTop + (14 * _escala2); // Coordenada Y do fundo do retângulo
    
	    if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (72 * _escala2), rectBottom) {
			// Continuar
			if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				global.gamepause = false;
				scrResume();
			}
		 
			// Salvar / Carregar
			if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				global.option = 1;
			}
		
			// Opções
			if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				
			}
		
			// Sair
	        if (device_mouse_check_button_pressed(0, mb_left) && i == 3) {
				game_end(); //<-- Encerra o jogo;
			}
	        break; // Encerre o loop após encontrar um retângulo
	    }
	}
}

#endregion
