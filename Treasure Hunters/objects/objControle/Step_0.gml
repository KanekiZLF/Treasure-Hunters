#region Variaveis do Player

if (instance_exists(objPlayer)) {
	global.lifes = clamp(global.lifes, 0, objPlayer.maxLifes)
	global.stamina = clamp(global.stamina, 0, objPlayer.maxStamina)
	global.poison = clamp(global.poison, 0, objPlayer.maxPoison)
	global.coinsSilver = objPlayer.coinsSilver;
	global.coinsGold = objPlayer.coinsGold;
	global.coinsDiamond = objPlayer.coinsDiamond;
	global.coinsSaphire = objPlayer.coinsSaphire;
	global.coinsRuby = objPlayer.coinsRuby;
}

#endregion

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

/*
_option 0 = Tela Pause inicial
_option 1 = Tela Saves
_option 2 = Tela Options
_option 3 = Tela Audio
_option 4 = Tela Guia
_option 5 = Tela Controles
_option 6 = Tela Creditos
_option 7 = Tela Inicial
_option 8 = Tela Game Over
_option 9 = Tela do Shop
*/

var _option = global.option;
var _escala = 4;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mouseClick = device_mouse_check_button_pressed(0, mb_left);
var _guiLarg = display_get_gui_width();
var _guiAlt = display_get_gui_height();


if (_option == 0 || _option == 2 || _option == 3 || _option == 4) {
	var _sprW = sprite_get_width(sprOptionHover) - 5;
	var _sprH = sprite_get_height(sprOptionHover);
	var _recSpace = 17 * _escala;
	var _recX = display_get_gui_width() / 2 + (-35.5 * _escala); // Corrigido
	var _recY = display_get_gui_height() / 2 + (-32 * _escala); // Corrigido
	var _numRetangulos = 4;
	
	// Retangulos das opções de AUDIO
	if (_option == 3) {
		var _recBX3 = _guiLarg/2 + 66;
		var _recBY3 = 236;
		var _recSpace3 = 15 * _escala;

		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3, _recBX3 + (14 * _escala), _recBY3 + (14 * _escala))) {
			if (device_mouse_check_button_pressed(0, mb_left)) {
			    objGui.iconMusic = (objGui.iconMusic == 5) ? 4 : 5;
			}
		}
		
		if (point_in_rectangle(_mouseX, _mouseY,_recBX3, _recBY3 + _recSpace3, _recBX3 + (14 * _escala), _recBY3 +_recSpace3 + (14 * _escala))) {
			if (device_mouse_check_button_pressed(0, mb_left)) {
			    objGui.iconSfx = (objGui.iconSfx == 5) ? 4 : 5;
			}
		}
	}

	//Fecha a tela de opções
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _recBX, _recBY, _recBX + (14 * _escala), _recBY + (14 * _escala))) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			switch(_option) {
				default:
					show_message("Erro ao selecionar _option");
				break;
				
				case 0: //Fecha o menu e volta ao jogo se estiver no PAUSE
					global.gamepause = false;
					scrResume();
				break;
				
				case 1: // Não definido
					
				break;
				
				case 2: // Volta a tela de pause inicial se estiver em OPTIONS
					if (room != rmInit) {
						global.option = 0;
					} else if (room == rmInit) {
						global.option = 7;
					}
				break;
				
				case 3: // Volta para tela de opções se estiver no SAVE
					global.option = 2;
				break;
				
				case 4: // Volta para tela de opções se estiver em GUIA
					if (room != rmInit) {
						global.option = 2;
					} else if (room == rmInit) {
						global.option = 7;
					}
				break;
			}
		}
	}

	// Tela de opções 
	for (var i = 0; i < _numRetangulos; i++) {
	    var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
	    var rectBottom = rectTop + (14 * _escala); // Coordenada Y do fundo do retângulo
    
	    if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (72 * _escala), rectBottom) {
			// Continuar // Guia
			if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				// Verifica qual tela esta e define o comando
				switch(_option) {
					default:
						show_message("Erro ao definir _option");
					break;
					
					case 0: // Se _option == 0
						global.gamepause = false;
						scrResume();
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
					if (room != rmInit) {
						global.option = 4;
					} else if (room == rmInit) {
						global.option = 1;
					}
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
				}
			}
		 
			// Salvar / Carregar // Controles
			if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option");
					break;
					
					case 0: // Se _option == 0
						global.option = 1
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
						global.option = 9;
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
				}
			}
		
			// Opções // Audio
			if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option");
					break;
					
					case 0: // Se _option == 0
						global.option = 2;
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
						global.option = 3;
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
				}
			}
		
			// Sair // Creditos
	        if (device_mouse_check_button_pressed(0, mb_left) && i == 3) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option");
					break;
					
					case 0: // Se _option == 0
						game_end(); //<-- Encerra o jogo;
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
						
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
				}
			}
			break; // Encerre o loop após encontrar um retângulo
	    }
	}// Opções da tela de save 
} else if (_option == 1) {
	var _recSpace = 22 * _escala;
	var _recX = display_get_gui_width()/2 + (-31.5 * _escala);
	var _recY = display_get_gui_height()/2 + (-31 * _escala);
	var _sprW = sprite_get_width(sprHoverSave) - 5;
	var _sprH = sprite_get_height(sprHoverSave);
	var _numRetangulos = 3;
	var _recBX = _guiLarg/2 - 190;
	var _recBY = 176;
	var _recSX = _guiLarg/2 + 106;
	var _recSY = 232;
	
	//Botão para carregar o jogo dependendo de qual save foi selecionado
	if (point_in_rectangle(_mouseX, _mouseY,_recSX, _recSY, _recSX + (14 * _escala), _recSY + (14 * _escala))) {
			objGui.iconSave = 5; //<-- Altera o icone caso algum save exista
		}
	
	//Retangulo da seta voltar da tela de save
	if (point_in_rectangle(_mouseX, _mouseY, _recBX, _recBY, _recBX + (14 * _escala), _recBY + (14 * _escala))) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			if (room != rmInit) {
				global.option = 0;
			} else if (room == rmInit) {
				global.option = 2;
			}
		}
	}
	
	for (var i = 0; i < _numRetangulos; i++) {
			var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
			var rectBottom = rectTop + (18 * _escala); // Coordenada Y do fundo do retângulo
    
	if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (32 * _escala), rectBottom) {
		//Save 1
		if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				global.save = 0;
			}
			
		//Save 2
		if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				global.save = 1;
			}
			
		//Save 3
		if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				global.save = 2;
			}
		break; // Encerre o loop após encontrar um retângulo
		}
	}
} else if (_option == 7) {
	// Funçoes dos retangulos GUIA e SAIR
	var _textX = _guiLarg/2 + (-3 * _escala);
	var _recTX = _textX + 85.8;
	var _recTY = _guiAlt/2 + 80;
	var _recTX2 = _textX + 205.8;
	var _recTY2 = _guiAlt/2 + 100;
	var _recSpaceX = -50 * _escala
	var _recSpaceY = -1 * _escala
	// Guia
	if (point_in_rectangle(_mouseX, _mouseY, _recTX, _recTY, _recTX + (33 * _escala), _recTY + (12 * _escala))) {
		if (_mouseClick) {
			global.option = 4;
		}
	} 
	// Sair	
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX2, _recTY2, _recTX2 + (33 * _escala), _recTY2 + (12 * _escala))) {
		if (_mouseClick) {
			game_end(); //<-- Encerra o jogo;
		}
	}
	// Config		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX + _recSpaceX, _recTY + _recSpaceY - (16 * _escala), _recTX + _recSpaceX + (14 * _escala), _recTY + _recSpaceY - (2 * _escala))) {
		if (_mouseClick) {
			global.option = 2;
		}
	}
	// Inventario		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX + _recSpaceX, _recTY + _recSpaceY, _recTX +_recSpaceX + (14 * _escala), _recTY + _recSpaceY + (14 * _escala))) {
		if (_mouseClick) {
			
		}
	}
	// Conquistas		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX, _recTY + _recSpaceY - (16 * _escala), _recTX + (14 * _escala), _recTY + _recSpaceY - (2 * _escala))) {
		if (_mouseClick) {
			
		}
	}
	// Carrinho		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX + 156, _recTY + _recSpaceY - (33 * _escala), _recTX + 156 + (14 * _escala), _recTY + _recSpaceY - (19 * _escala))) {
		if (_mouseClick) {
			
		}
	}
	// Play		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX - (32 * _escala), _recTY - (16 * _escala), _recTX - (32 * _escala) + (28 * _escala), _recTY - (16 * _escala) + (28 * _escala))) {
		if (_mouseClick) {
			global.gamepause = false;
			global.option = noone;
			room_goto_next();
		}
	}
	// Cifrao		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX + 156, _recTY + _recSpaceY - (52 * _escala), _recTX + 156 + (14 * _escala), _recTY + _recSpaceY - (38 * _escala))) {
		if (_mouseClick) {
			
		}
	}
} else if (_option == 8) {
	var _textX2 = _guiLarg/2 + (-13 * _escala);
	var _textY2 = _guiAlt/2 + (-63 * _escala);
	var _recX2 = _guiLarg/2 + (-32 * _escala);
	var _recY2 = _guiAlt/2 + (24.5 * _escala);
	var _recSpace2 = 18 * _escala;
	
	// Cifrao
	if (point_in_rectangle(_mouseX, _mouseY, _recX2, _recY2, _recX2 + (14 * _escala), _recY2 + (14 * _escala))) {
		if (_mouseClick) {
			
		}
	}
	// Play
	else if (point_in_rectangle(_mouseX, _mouseY, _recX2 + _recSpace2, _recY2, _recX2 + _recSpace2 + (28 * _escala), _recY2 + (14 * _escala))) {
		if (_mouseClick) {
			global.gameover = false;
			global.gamepause = noone;
			objPlayer.direc = 0;
			objPlayer.isDead = false;
			scrRecharge(10, 10) //<-- Define a recarga para Lifes, Stamina e Poison
		}
	}
	// Sair
	else if (point_in_rectangle(_mouseX, _mouseY, _recX2 + _recSpace2 + (33 * _escala), _recY2 + (1 * _escala), _recX2 + _recSpace2 + (33 * _escala) + (32 * _escala), _recY2 + (1 * _escala) + (13 * _escala))) {
		if (_mouseClick) {
			game_end();
		}
	}
}

#endregion