// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

function scrSaveGameT() {
	scrSaveData();
	scrSaveInventory();
    var _saveData = array_create(0); // <-- Crie um ARRAY para adicionarmos as informaçoes dos nossos objetos
    var _saveEntitys;

    with (objSaveMe) {
        _saveEntitys = {
            obj: object_index,
            currentRoom: room,
            y: y,
            x: x,
            layer: layer,
            sprite_index: sprite_index,
            image_index: image_index,
			image_xscale : image_xscale,
            // Variáveis globais
            coinsSilver: global.coinsSilver,
            coinsGold: global.coinsGold,
            coinsDiamond: global.coinsDiamond,
            coinsSaphire: global.coinsSaphire,
            coinsRuby: global.coinsRuby,
            lifes: global.lifes,
            stam: global.stamina,
            upgLifes: global.upgradeLifes,
            upgStam: global.upgradeStam,
            upgVeneno: global.upgradeVeneno,
            upgDano: global.upgradeDano,
            upgPrice0: global.upgPrice0,
            upgPrice1: global.upgPrice1,
            upgPrice2: global.upgPrice2,
            upgPrice3: global.upgPrice3,

            // Variáveis do objPlayer
            lifes2: objPlayer.lifes2,
            maxLifes: objPlayer.maxLifes,
            maxLifes2: objPlayer.maxLifes2,
            stamina2: objPlayer.stamina2,
            maxStamina: objPlayer.maxStamina,
            maxStamina2: objPlayer.maxStamina2,
            arraySprite: objPlayer.arraySprite,
            direcPlayer: objPlayer.direc,
		
        };
		// Converter a lista em um array
        array_push(_saveData, _saveEntitys);
    }

    // Salvando dentro do Json
    var _string = json_stringify(_saveData);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    var _file = "";
    switch (global.save) {
        default:
            show_message("Erro ao definir save !");
            break;

        case 1:
            _file = "saveGame0.save";
            break;

        case 2:
            _file = "saveGame1.save";
            break;

        case 3:
            _file = "saveGame2.save";
            break;
    }
    buffer_save(_buffer, _file);
	
    //scrPrint("Jogo Salvo: " + _string);
    var _inst = instance_create_layer(x, y, "Effects", objTextUpGui);
    _inst.texto = "Jogo salvo com sucesso !";
    _inst.fontSize = .4;
}

function scrLoadGameT() {
	scrLoadData();
	scrLoadInventory();
	var _file = "";
	switch(global.save) {
		default:
			show_message("Erro ao definir save !");
		break
		
		case 1:
			_file = "saveGame0.save";
		break;
		
		case 2:
			_file = "saveGame1.save";
		break;
		
		case 3:
			_file = "saveGame2.save";
		break;
	}
	
	with (objSaveMe) instance_destroy();
	
	if (file_exists(_file)) {
		
		var _buffer = buffer_load(_file);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _loadData = json_parse(_string); // <-- Transforma o Json em Array
		
		while (array_length(_loadData) > 0) {
			
			var _loadEntity = array_pop(_loadData);
			var _room = _loadEntity.currentRoom;
			
			if (!global.isLoading) {
				if (room != _room) {
					room_goto(_room);
				}
			}
			
			if (room == _room) {
				with(instance_create_layer(0, 0, _loadEntity.layer, _loadEntity.obj)) {
				
					global.coinsSilver = _loadEntity.coinsSilver;
					global.coinsGold = _loadEntity.coinsGold;
					
					if (room != rmInit) {
						x = _loadEntity.x;
						y = _loadEntity.y;
						sprite_index = _loadEntity.sprite_index;
						image_index = _loadEntity.image_index;
						image_xscale = _loadEntity.image_xscale;
						global.upgradeLifes = _loadEntity.upgLifes;
						global.upgradeStam  = _loadEntity.upgStam;
						global.upgradeVeneno  = _loadEntity.upgVeneno;
						global.upgradeDano  = _loadEntity.upgDano;
						global.lifes = _loadEntity.lifes;
						global.stamina = _loadEntity.stam;
						global.gamepause = false;
						global.option = noone;
					}
					
					if (instance_exists(objGui)) {
						objGui.coinLabels2[0] = _loadEntity.upgPrice0;
						objGui.coinLabels2[1] = _loadEntity.upgPrice1;
						objGui.coinLabels2[2] = _loadEntity.upgPrice2;
						objGui.coinLabels2[3] = _loadEntity.upgPrice3;
					}
					
					if (instance_exists(objPlayer)) {
						objPlayer.lifes2 = _loadEntity.lifes2;
						objPlayer.maxLifes = _loadEntity.maxLifes;
						objPlayer.maxLifes = _loadEntity.maxLifes;
						objPlayer.stamina2 = _loadEntity.stamina2;
						objPlayer.maxStamina = _loadEntity.maxStamina;
						objPlayer.maxStamina2 = _loadEntity.maxStamina2;
						objPlayer.arraySprite = _loadEntity.arraySprite;
						objPlayer.direc = _loadEntity.direcPlayer;
					}
				}
			}
		}
		//scrPrint("Jogo Carregado: " + _string);
	}
}

function scrSaveDataT() {
	scrSaveInventory();
	
    // Limpa o ARRAY 2 para escrever as novas alterações
    global.savedItems[2] = array_create(0, 0);
	

    // Verificar se o arquivo existe
    var _file = "";
    switch (global.save) {
        default:
            show_message("Erro ao definir save !");
            break;

        case 1:
            _file = "saveData0.dat";
            break;

        case 2:
            _file = "saveData1.dat";
            break;

        case 3:
            _file = "saveData2.dat";
            break;
    }

    if (instance_exists(objChest)) {
        for (var i = 0; i < instance_number(objChest); i++) {
            var _chest = instance_find(objChest, i);

            // Verifica se o item já está na lista para a sala atual antes de adicioná-lo
            var _itemAlreadyExists = false;
            for (var j = 0; j < array_length(global.savedItems[0]); j++) {
                var _existingItem = global.savedItems[0][j];
                if ( _existingItem.room == room && _existingItem.x == _chest.x && _existingItem.y == _chest.y ) {
                    _itemAlreadyExists = true;
                    break;
                }
            }

            if (!_itemAlreadyExists && _chest.wasCollected) {
                // Adiciona apenas se o item não existir na lista e se ele não tiver sido alterado
				var saveEntity = {
				    x: _chest.x,
				    y: _chest.y,
				    room: room,
				    id: _chest.id,
				    sprite_index: _chest.sprite_index,
				    image_index: _chest.image_index,
				    wasCollected: _chest.wasCollected,
				};
				array_push(global.savedItems[0], saveEntity);
            }
        }
    }
	
	// Verificações para objKey
	if (instance_exists(objKey)) {
	    for (var k = 0; k < instance_number(objKey); k++) {
	        var _key = instance_find(objKey, k);

	        // Verifica se o item já está na lista para a sala atual antes de adicioná-lo
	        var _itemAlreadyExistsKey = false;
	        for (var l = 0; l < array_length(global.savedItems[1]); l++) {
	            var _existingItemKey = global.savedItems[1][l];
	            if (_existingItemKey.room == room && _existingItemKey.x == _key.x && _existingItemKey.y == _key.y) {
	                _itemAlreadyExistsKey = true;
	                break;
	            }
	        }

	        if (!_itemAlreadyExistsKey && _key.wasCollected) {
	            // Adiciona apenas se o item não existir na lista e se ele não tiver sido alterado
	            var _saveEntityKey = {
	                x: _key.x,
	                y: _key.y,
	                room: room,
	                id: _key.id,
	                sprite_index: _key.sprite_index,
	                image_index: _key.image_index,
					wasCollected : _key.wasCollected,
	            };
	            array_push(global.savedItems[1], _saveEntityKey);
	        }
	    }
	}
	
	// Verificações para SaveMe
	with (objSaveMe) {
        var _saveEntitys = {
            obj: object_index,
            currentRoom: room,
            y: y,
            x: x,
            layer: layer,
            sprite_index: sprite_index,
            image_index: image_index,
			image_xscale : image_xscale,
            // Variáveis globais
            coinsSilver: global.coinsSilver,
            coinsGold: global.coinsGold,
            coinsDiamond: global.coinsDiamond,
            coinsSaphire: global.coinsSaphire,
            coinsRuby: global.coinsRuby,
            lifes: global.lifes,
            stam: global.stamina,
            upgLifes: global.upgradeLifes,
            upgStam: global.upgradeStam,
            upgVeneno: global.upgradeVeneno,
            upgDano: global.upgradeDano,
            upgPrice0: global.upgPrice0,
            upgPrice1: global.upgPrice1,
            upgPrice2: global.upgPrice2,
            upgPrice3: global.upgPrice3,

            // Variáveis do objPlayer
            lifes2: objPlayer.lifes2,
            maxLifes: objPlayer.maxLifes,
            maxLifes2: objPlayer.maxLifes2,
            stamina2: objPlayer.stamina2,
            maxStamina: objPlayer.maxStamina,
            maxStamina2: objPlayer.maxStamina2,
            arraySprite: objPlayer.arraySprite,
            direcPlayer: objPlayer.direc,
		
        };
		// Converter a lista em um array
        array_push(global.savedItems[2], _saveEntitys);
    }
		
    // Salvando dentro do Json
    var _string = json_stringify(global.savedItems);
    var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
    buffer_write(_buffer, buffer_string, _string);
    buffer_save(_buffer, _file);
}

function scrLoadDataT() {
	scrLoadInventory();
    var _file = "";

    switch(global.save) {
        default:
            show_message("Nenhum save selecionado !");
        break;

        case 1:
            _file = "saveData0.dat";
        break;

        case 2:
            _file = "saveData1.dat";
        break;

        case 3:
            _file = "saveData2.dat";
        break;
    }
    
    with (objSaveMe) instance_destroy();

    if (file_exists(_file)) {
        var _buffer = buffer_load(_file);

        if (_buffer != -1) {
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);

            var _loadData = json_parse(_string);

            // Loop para ambos os arrays dentro de _loadData
            for (var arrayIndex = 0; arrayIndex < array_length(_loadData); arrayIndex++) {
                var _currentArray = _loadData[arrayIndex];

                // Verificar se cada item ainda existe na sala antes de aplicar as alterações
                for (var i = 0; i < array_length(_currentArray); i++) {
                    var _loadEntity = _currentArray[i];
					
                    // Verifica o tipo de entidade (0: baú, 1: chave, 2: SaveMe)
                    switch (arrayIndex) {
                        case 0: // Baú
                            if (instance_exists(objChest)) {
                                var _chest = instance_nearest(_loadEntity.x, _loadEntity.y, objChest);

                                if (_chest != noone && variable_instance_exists(_chest, "wasCollected") && room == _loadEntity.room && _chest.x == _loadEntity.x && _chest.y == _loadEntity.y) {
                                    // Atribuir os valores apenas à instância correspondente
                                    _chest.wasCollected = _loadEntity.wasCollected;
                                    _chest.image_index = _loadEntity.image_index;
                                    _chest.sprite_index = _loadEntity.sprite_index;
                                }
                            }
                            break;

                        case 1: // Chave
                            if (instance_exists(objKey)) {
                                var _key = instance_nearest(_loadEntity.x, _loadEntity.y, objKey);

                                if (_key != noone && _key.x == _loadEntity.x) {
                                    // Destruir a instância apenas se ela existir
                                    instance_destroy(_key);
                                }
                            }
                            break;

                        case 2: // SaveMe
                            // Criar uma instância do objeto SaveMe e atribuir os valores
							var _room = _loadEntity.currentRoom;
		
							if (!global.isLoading) {
								if (room != _room) {
									room_goto(_room);
								}
							}
							
							if (room == _room) {
								with(instance_create_layer(0, 0, _loadEntity.layer, _loadEntity.obj)) {
				
								global.coinsSilver = _loadEntity.coinsSilver;
								global.coinsGold = _loadEntity.coinsGold;
					
								if (room != rmInit) {
									x = _loadEntity.x;
									y = _loadEntity.y;
									sprite_index = _loadEntity.sprite_index;
									image_index = _loadEntity.image_index;
									image_xscale = _loadEntity.image_xscale;
									global.upgradeLifes = _loadEntity.upgLifes;
									global.upgradeStam  = _loadEntity.upgStam;
									global.upgradeVeneno  = _loadEntity.upgVeneno;
									global.upgradeDano  = _loadEntity.upgDano;
									global.lifes = _loadEntity.lifes;
									global.stamina = _loadEntity.stam;
									global.gamepause = false;
									global.option = noone;
								}
					
								if (instance_exists(objGui)) {
									objGui.coinLabels2[0] = _loadEntity.upgPrice0;
									objGui.coinLabels2[1] = _loadEntity.upgPrice1;
									objGui.coinLabels2[2] = _loadEntity.upgPrice2;
									objGui.coinLabels2[3] = _loadEntity.upgPrice3;
								}
					
								if (instance_exists(objPlayer)) {
									objPlayer.lifes2 = _loadEntity.lifes2;
									objPlayer.maxLifes = _loadEntity.maxLifes;
									objPlayer.maxLifes = _loadEntity.maxLifes;
									objPlayer.stamina2 = _loadEntity.stamina2;
									objPlayer.maxStamina = _loadEntity.maxStamina;
									objPlayer.maxStamina2 = _loadEntity.maxStamina2;
									objPlayer.arraySprite = _loadEntity.arraySprite;
									objPlayer.direc = _loadEntity.direcPlayer;
								}
							}
						}
						break;
                    }
                }
            }
        } else {
            show_message("Erro ao carregar o buffer do arquivo.");
        }
    }
}

