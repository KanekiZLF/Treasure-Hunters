#region Variaveis do Player

if (room == Fase1 && !instance_exists(objPlayer)) {
	instance_create_layer(display_get_gui_width()/3, display_get_gui_height()/3, "Instances", objPlayer);
}

if (instance_exists(objPlayer)) {
	global.lifes = clamp(real(global.lifes), 0, objPlayer.maxLifes);
	global.stamina = clamp(real(global.stamina), 0, objPlayer.maxStamina);
	global.poison = clamp(real(global.poison), 0, objPlayer.maxPoison);
}

if (global.coinsSilver) >= 999 {
	global.coinsGold += 1;
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
_option 10 = Tela do Vendas do Shops
_option 11 = Inventario
*/

var _option = global.option;
var _escala = 4;
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mouseClick = device_mouse_check_button_pressed(0, mb_left);
var _guiLarg = display_get_gui_width();
var _guiAlt = display_get_gui_height();


if (_option == 0 || _option == 2 || _option == 3 || _option == 4 || _option == 14) {
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
					global.option = noone;
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
				
				case 14: // Volta para tela GUIA, se estiver na tela ITEMS
					global.option = 4;
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
						show_message("Erro ao definir _option: " + string(i));
					break;
					
					case 0: // Se _option == 0
						global.gamepause = false;
						global.option = noone;
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
					
					case 4: // Items
						global.option = 14;
					break;
					
					case 14: // Elixir Cura
						global.option = 13;
					break;
					
				}
			}
		 
			// Salvar / Carregar // Controles
			if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option: " + string(i));
					break;
					
					case 0: // Se _option == 0
						global.option = 1;
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
						
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
					
					case 14: // Elixir Estamina
						global.option = 13;
					break;
				}
			}
		
			// Opções // Audio
			if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option: " + string(i));
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
					
					case 14: // Elixir Envenenado
						global.option = 13;
					break;
				}
			}
		
			// Sair // Creditos
	        if (device_mouse_check_button_pressed(0, mb_left) && i == 3) {
				switch(_option) {
					default:
						show_message("Erro ao definir _option: " + string(i));
					break;
					
					case 0: // Se _option == 0
						global.option = 12;
					break;
					
					case 1: // Se _option == 1
						
					break;
					
					case 2: // Se _option == 2
						
					break;
					
					case 3: // Se _option == 3
						
					break;
					
					case 4: // Se _option == 4
						
					break;
					
					case 14: // Diamante
						global.option = 13;
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
	
	//Verifica se tem algum save selecionado e libera o botão de carregar
	if (global.save != 0) {
			objGui.iconSave = 5; //<-- Altera o icone caso algum save exista
		} else {
			objGui.iconSave = 4;
		}
	
	//Botão para carregar o jogo dependendo de qual save foi selecionado
	if (point_in_rectangle(_mouseX, _mouseY,_recSX, _recSY, _recSX + (14 * _escala), _recSY + (14 * _escala)) && global.save != 0) {
			if (_mouseClick) {
				switch(global.save) {
					default:
						show_message("Erro ao selecionar SAVE")
					break;
					
					case 1:
						if (file_exists("saveGame0.save")) {
							scrLoadGame();
							scrLoadInventory();
							global.gamepause = false;
							global.option = noone;
							if (alarm[0] <= 0) {
								alarm[0] = 10;
							}
						} 
						else {
							global.gamepause = false;
							global.option = noone;
							room_goto_next();
						}
					break;
					
					case 2:
						if (file_exists("saveGame1.save")) {
							global.gamepause = false;
							global.option = noone;
							scrLoadGame();
							scrLoadInventory();
							if (alarm[0] <= 0) {
								alarm[0] = 10;
							}
						}
						else {
							global.gamepause = false;
							global.option = noone;
							room_goto_next();
						}
					break;
					
					case 3:
						if (file_exists("saveGame2.save")) {
							global.gamepause = false;
							global.option = noone;
							scrLoadGame();
							scrLoadInventory();
							if (alarm[0] <= 0) {
								alarm[0] = 10;
							}
						}
						else {
							global.gamepause = false;
							global.option = noone;
							room_goto_next();
						}
					break;
				}
			} 
		}
	
	//Retangulo da seta voltar da tela de save
	if (point_in_rectangle(_mouseX, _mouseY, _recBX, _recBY, _recBX + (14 * _escala), _recBY + (14 * _escala))) {
		if (device_mouse_check_button_pressed(0, mb_left)) {
			if (room != rmInit) {
				global.option = 0;
			} else if (room == rmInit) {
				global.option = 7;
			}
		}
	}
	
	for (var i = 0; i < _numRetangulos; i++) {
			var rectTop = _recY + (i * _recSpace); // Coordenada Y do topo do retângulo
			var rectBottom = rectTop + (18 * _escala); // Coordenada Y do fundo do retângulo
    
	if point_in_rectangle(_mouseX, _mouseY, _recX, rectTop, _recX + (32 * _escala), rectBottom) {
		//Save 1
		if (device_mouse_check_button_pressed(0, mb_left) && i == 0) {
				global.save = 1;
				scrLoadCoins()
			}
			
		//Save 2
		if (device_mouse_check_button_pressed(0, mb_left) && i == 1) {
				global.save = 2;
				scrLoadCoins()
			}
			
		//Save 3
		if (device_mouse_check_button_pressed(0, mb_left) && i == 2) {
				global.save = 3;
				scrLoadCoins()
			}
		break; // Encerre o loop após encontrar um retângulo
		}
	}
} else if (_option == 7) {
	// Funçoes dos retangulos GUIA e SAIR
	var _textX = _guiLarg/2 + (-3 * _escala);
	var _recTX = _textX + 53.8;
	var _recTY = _guiAlt/2 + 80;
	var _recTX2 = _textX + 173.8;
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
			game_end() // <-- Encerra o jogo
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
			global.option = 9;
		}
	}
	// Play		
	else if (point_in_rectangle(_mouseX, _mouseY, _recTX - (32 * _escala), _recTY - (16 * _escala), _recTX - (32 * _escala) + (28 * _escala), _recTY - (16 * _escala) + (28 * _escala))) {
		if (_mouseClick) {
			global.option = 1;
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
			global.gamepause = false;
			objPlayer.direc = 0;
			objPlayer.isDead = false;
			scrRecharge(10, 10) //<-- Define a recarga para Lifes, Stamina e Poison
		}
	}
	// Sair
	else if (point_in_rectangle(_mouseX, _mouseY, _recX2 + _recSpace2 + (33 * _escala), _recY2 + (1 * _escala), _recX2 + _recSpace2 + (33 * _escala) + (32 * _escala), _recY2 + (1 * _escala) + (13 * _escala))) {
		if (_mouseClick) {
			global.option = 12;
		}
	}
} else if (_option == 9 || _option == 10) {
	// Parte dos cards da loja
	var _recSX = _guiLarg/2 + (-57 * _escala);
	var _recSY = _guiAlt/2 + (2.5 * _escala);
	var _coinX = _guiLarg/2 + (-50 * _escala);
	var _coinY = _guiAlt/2;
	var _recSSpace = 30 * _escala;
	var _recSSpace2 = -50 * _escala;
	var _recBackSpaceX = -19 * _escala;
	var _recBackSpaceY = -60.5 * _escala;
	var _numRetangulos = 4;
	
	if (_option == 9) {
	// Seta voltar do shops
	if (point_in_rectangle(_mouseX, _mouseY, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY, _coinX + (14 * _escala + _recBackSpaceX), _coinY + (14 * _escala + _recBackSpaceY))) {
			if (room != rmInit) {
				if (_mouseClick) {
					global.option = 11; // Volta para o inventario
					global.inventory = true;
				}
			} else if (room == rmInit) {
				if (_mouseClick) {
					global.option = 7; // Volta para tela inicial
				}
			}
		}
		
		if (point_in_rectangle(_mouseX, _mouseY, _guiLarg/2 + (80 * _escala ), _coinY + (-45.5 * _escala), _guiLarg/2 + (94 * _escala ), _coinY + (-31.5 * _escala))) {
			if (room != rmInit) {
				if (_mouseClick) {
					global.option = 11; // Volta para o inventario
					global.inventory = true;
				}
			} else if (room == rmInit) {
				if (_mouseClick) {
					global.option = 7; // Volta para tela shops
				}
			}
		}
	} else if (_option == 10) {
		// Seta voltar da tela de vendas
		if (point_in_rectangle(_mouseX, _mouseY, _coinX + _recBackSpaceX, _coinY + _recBackSpaceY + 100, _coinX + (14 * _escala + _recBackSpaceX), _coinY + (14 * _escala + _recBackSpaceY + 100))) {
			if (_mouseClick) {
				global.option = 9;
			}
		}
	}
	
	
	for (var i = 0; i < _numRetangulos; i++) {
	    var _priceItem = 0;
		var _coinSprites = 0;

		global.coinsSilver = clamp(real(global.coinsSilver), 0, 9999);
		global.coinsGold = clamp(real(global.coinsGold), 0, 9999);
		if (_option == 9) {
		    if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY + _recSSpace2, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala + _recSSpace2))) {
		        _priceItem = objGui.coinLabels;
		        _coinSprites = objGui.coinSprites;
				if (_mouseClick && i == 3) {
					global.option = 10;
				}
		    } else if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + (39 * _escala))) {
		        _priceItem = objGui.coinLabels2;
		        _coinSprites = objGui.coinSprites2;
		    }
		} 
		// Vende os items
		else if (_option == 10) {
			var _spaceX = 10 * _escala;
			var _spaceY = -25 * _escala;
				
			if (point_in_rectangle(_mouseX, _mouseY, _recSX + (_recSSpace * i), _recSY + _spaceY, _recSX + (28 * _escala + (_recSSpace * i)), _recSY + _spaceY + (39 * _escala))) {
				_priceItem = objGui.coinLabels3;
				_coinSprites = objGui.coinSprites3;
				
				//Venda os itens
				if (_mouseClick) {
					if (i == 0) {
						scrDsGridProcess(3, 1, true);
					} else if (i == 1) {
						scrDsGridProcess(4, 1, true);
					} else if (i == 2) {
						scrDsGridProcess(5, 1, true);
					} else if (i == 3) {
						scrDsGridProcess(6, 1, true);
					}
				}
			}
		}
			
	// Compra item que selecionar nos hovers !
	    if (_mouseClick) {
			var _grid = objGui.gridItems;
	        if (i < array_length(_priceItem)) {
	            if (_coinSprites[i] == sprSilverCoin) {
					if (_option == 9) {
						if (global.coinsSilver >= _priceItem[i] || global.coinsGold >= 1) {
							if (global.coinsSilver >= _priceItem[i]) {
								global.coinsSilver -= _priceItem[i];
							} else if (global.coinsGold >= 1) {
								global.coinsGold -= 1;
								global.coinsSilver += (1000 - _priceItem[i]);
							}
							
							if (i == 0) {
								scrDsGridProcess(0)
							} else if (i == 1) {
								scrDsGridProcess(1)
							} else if (i == 2) {
								scrDsGridProcess(2)
							} 
						}
					} 
	            }
				// Upgrades
				else if (_coinSprites[i] == sprGoldCoin) {
					if (global.option == 9) {
						if (_priceItem[i] != "Max" && global.coinsGold >= _priceItem[i]) {
							if (instance_exists(objPlayer)) {
								var percentIncrease = 45; // A porcentagem de aumento desejada
								var increaseAmount = 0;
								
								if (_priceItem[i] != "Max") {
									increaseAmount = round((_priceItem[i] * percentIncrease) / 100); // Calcula o valor do aumento
								}
								
								switch(i) {
								    case 0:
										if (global.upgradeLifes < 10) {
									        upgradeLife();
											global.coinsGold -= _priceItem[i];
											_priceItem[i] += increaseAmount; // Aumenta o valor em %
										}
										
										if (global.upgradeLifes == 10) {
											_priceItem[i] = "Max";
										}
								    break;
									
								    case 1:
										if (global.upgradeStam < 10) {
									        upgradeStamina();
											global.coinsGold -= _priceItem[i];
											_priceItem[i] += increaseAmount; // Aumenta o valor em %
										}
										
										if (global.upgradeStam == 10) {
											_priceItem[i] = "Max";
										}
								    break;
									
								    case 2:
										if (global.upgradeVeneno < 10) {
									        upgradeVenenoResist();
											global.coinsGold -= _priceItem[i];
											_priceItem[i] += increaseAmount; // Aumenta o valor em %
										}
										
										if (global.upgradeVeneno == 10) {
											_priceItem[i] = "Max";
										}
								    break;
									
								    case 3:
										if (global.upgradeDano < 10) {
									        upgradeDamage();
											global.coinsGold -= _priceItem[i];
											_priceItem[i] += increaseAmount; // Aumenta o valor em %
										}
										
										if (global.upgradeDano == 10) {
											_priceItem[i] = "Max";
										}
								    break;
								}
							}
						}
					}
	            }
	        }
	    }
	}
} else if (_option == 11) {
	var _recInvX = _guiLarg/2 + (10 * _escala);
	var _recInvY = _guiAlt/2 + (10 * _escala);
	var _spaceInvX = 10 * _escala;
	var _spaceInvY = 10 * _escala;
	var _recIX = _guiLarg/2;
	var _recIY = _guiAlt/2;
		
	//Quadrado fechar
	if (point_in_rectangle(_mouseX, _mouseY, _guiLarg/2 + (-52 * _escala), _guiAlt/2 + (-44.5 * _escala), _guiLarg/2 + (-38 * _escala), _guiAlt/2 + (-30.5 * _escala))) {
		if (_mouseClick) {
			global.option = noone;
			global.gamepause = false;
			global.inventory = false;
			scrResume();
		}
	} else if (point_in_rectangle(_mouseX, _mouseY, _recIX + (49 * _escala), _recIY + (-29.5 * _escala), _recIX + (63 * _escala), _recIY + (-15.5 * _escala))) {
		if (_mouseClick) { 
			global.inventory = false;
			global.option = 9;
		}
	}
	
	// Setas da tewla de inventario
	var _grid = objGui.gridItems;
	var _grid2 = objGui.gridItems2;
	var _recInvX2 = _guiLarg/2 + (-39 * _escala);
	var _recInvY2 = _guiAlt/2 + (-30.5 * _escala);
	if (point_in_rectangle(_mouseX, _mouseY, _recInvX2 + (-12 * _escala), _recInvY2 + (17.5 * _escala), _recInvX2 + (-12 * _escala) + (8 * 3), _recInvY2 + (17.5 * _escala) + (12 * 3))) {	
			if (_mouseClick) {
				ds_grid_set_grid_region(_grid2, _grid, 0, 0, 3, 6, 0, 6);
				ds_grid_set_grid_region(_grid2, _grid, 0, 6, 3, 11, 0, 12);
				ds_grid_set_grid_region(_grid2, _grid, 0, 12, 3, 17, 0, 0);
				ds_grid_copy(_grid, _grid2);
			}
		} 
		
	else if (point_in_rectangle(_mouseX, _mouseY, _recInvX2 + (74 * _escala), _recInvY2 + (17.5 * _escala), _recInvX2 + (74 * _escala) + (8 * 3), _recInvY2 + (17.5 * _escala) + (12 * 3))) {	
			if (_mouseClick) {
				ds_grid_set_grid_region(_grid2, _grid, 0, 0, 3, 6, 0, 12);
				ds_grid_set_grid_region(_grid2, _grid, 0, 6, 3, 11, 0, 0);
				ds_grid_set_grid_region(_grid2, _grid, 0, 12, 3, 17, 0, 6);
				ds_grid_copy(_grid, _grid2);
			}
		} 
} else if (_option == 12) {
	// Tela de confirmacao
		var _xx = _guiLarg/2 + (8.5 * _escala);
		var _yy = _guiAlt/2 + (24 * _escala);
		var _spaceXX = -37 * _escala;
		
		// Sim
		if (point_in_rectangle(_mouseX, _mouseY, _xx + _spaceXX, _yy, _xx + _spaceXX + (21 * _escala), _yy + (14 * _escala))) {
			if (_mouseClick) {
				if (room != rmInit) { 
					global.option = 7;
					global.save = 0;
					global.isLoading = false;
					scrResetGame()
					room_goto(rmInit);
				}
			}
		}
		
		// Nao
		if (point_in_rectangle(_mouseX, _mouseY, _xx, _yy, _xx + (21 * _escala), _yy + (14 * _escala))) {
			if (_mouseClick) {
				if (!global.gameover) {
					global.option = 0;
				} else if (global.gameover) {
					global.option = 8;
				}
			}
		}
	}
	else if (_option == 13) {
		var _xx = _guiLarg/2 + (-45 * _escala);
		var _yy = _guiAlt/2 + (-45 * _escala);
		var _spaceXX = -37 * _escala;
		
		if (point_in_rectangle(_mouseX, _mouseY, _xx, _yy, _xx + (21 * _escala), _yy + (14 * _escala))) {
			if (global.inventory) {
				if (_mouseClick) {
					global.option = 11;
				}
			} else {
				if (_mouseClick) {
					global.option = 14; // < -- Volta para tela de items
				}
			}
		}
	}
#endregion