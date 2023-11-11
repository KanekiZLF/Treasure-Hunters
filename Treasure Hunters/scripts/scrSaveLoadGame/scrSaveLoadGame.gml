// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrSaveGame() {
    var _saveData = array_create(0);
	var _saveEntitys;
	
    with (objSaveMe) {
        _saveEntitys = {
            obj: object_get_name(object_index),
            currentRoom: room_get_name(room),
            y: y,
            x: x,
            layer: layer,
            sprite_index: sprite_index,
            image_number: image_number,

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

            // Variáveis do inimigo
            enemysLife: -1,

            // Variáveis de itens coletáveis
            isOpen: -1,
            mySprite: -1,
            sprIndex: -1,
            spriteIten: -1,
            chestInfo: -1,
			enemysLife: ds_list_create(),
	        chestInfo: ds_list_create(),
	        spriteIten: ds_list_create(),
        };

        // Salvando listas
	    if (instance_exists(objEntidade)) {
	        for (var i = 0; i < instance_number(objEntidade); i++) {
	            var _enemysNum = instance_find(objEntidade, i);
	            var _enemysInfo = ds_map_create();

	            _enemysInfo[? "lifes"] = _enemysNum.lifes;

	            ds_list_add(_saveEntitys.enemysLife, _enemysInfo);
	        }
	    }

	    if (instance_exists(objChest)) {
	        for (var i = 0; i < instance_number(objChest); i++) {
	            var _chest = instance_find(objChest, i);
	            var _chestInfo = ds_map_create();

	            _chestInfo[? "isOpen"] = _chest.isOpen;
	            _chestInfo[? "sprite_index"] = _chest.sprite_index;
	            _chestInfo[? "image_index"] = _chest.image_index;

	            ds_list_add(_saveEntitys.chestInfo, _chestInfo);
	        }
	    }

	    if (instance_exists(objItens)) {
	        for (var i = 0; i < instance_number(objItens); i++) {
	            var _itens = instance_find(objItens, i);
	            var _itensInfo = ds_map_create();

	            _itensInfo[? "sprite"] = _itens.sprite;
				_itensInfo[? "sprIndex"] = _itens.sprite_index;

	            ds_list_add(_saveEntitys.spriteIten, _itensInfo);
	        }
	    }

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

    // Liberando recursos (listas e mapas)
    if (_saveEntitys.enemysLife != -1) ds_list_destroy(_saveEntitys.enemysLife);
    if (_saveEntitys.chestInfo != -1) ds_list_destroy(_saveEntitys.chestInfo);
    if (_saveEntitys.spriteIten != -1) ds_list_destroy(_saveEntitys.spriteIten);
	//scrPrint("Jogo Salvo: " + _string);
	var _inst = instance_create_layer(x, y, "Effects", objTextUpGui);
	_inst.texto = "Jogo salvo com sucesso !";
	_inst.fontSize = .4;
	
}

function scrLoadGame() {
	
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
			var _room = asset_get_index(_loadEntity.currentRoom);
			
			if (!global.isLoading) {
				room_goto(_room);
			}
			
			if (room == _room) {
				with(instance_create_layer(0, 0, _loadEntity.layer, asset_get_index(_loadEntity.obj))) {
				
					global.coinsSilver = _loadEntity.coinsSilver;
					global.coinsGold = _loadEntity.coinsGold;
					
					if (room != rmInit) {
						x = _loadEntity.x;
						y = _loadEntity.y;
						sprite_index = _loadEntity.sprite_index;
						image_index = _loadEntity.image_number;
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
					
					// Carregando listas
			        if (instance_exists(objEntidade)) {
			            for (var i = 0; i < instance_number(objEntidade); i++) {
			                var _enemysLife = instance_find(objEntidade, i);

			                // Obtém as informações do inimigo salvas
			                var _enemysInfo = ds_list_find_value(_loadEntity.enemysLife, i);

			                // Aplica as informações do inimigo salvo para cada inimigo
			                _enemysLife.lifes = _enemysInfo[? "lifes"];
			            }
			        }

			        if (instance_exists(objChest) && ds_exists(_loadEntity.chestInfo, ds_type_list)) {
			            for (var i = 0; i < instance_number(objChest); i++) {
			                var _chest = instance_find(objChest, i);

			                // Obtém as informações do baú salvas
			                var _chestInfo = ds_list_find_value(_loadEntity.chestInfo, i);

			                // Aplica as informações do baú salvo para cada baú
			                _chest.isOpen = _chestInfo[? "isOpen"];
			                _chest.sprite_index = _chestInfo[? "sprite_index"];
			                _chest.image_index = _chestInfo[? "image_index"];
			            }
			        }

			        if (instance_exists(objItens) && ds_exists(_loadEntity.spriteIten, ds_type_list)) {
			            for (var i = 0; i < instance_number(objItens); i++) {
			                var _itens = instance_find(objItens, i);

			                // Obtém as informações do item salvo
			                var _itensInfo = ds_list_find_value(_loadEntity.spriteIten, i);

			                // Aplica as informações do item salvo para cada item
			                _itens.sprite = _itensInfo[? "sprite"];
							_itens.sprite_index = _itensInfo[? "sprIndex"];
			            }
			        }
				}
			}
		}
		//scrPrint("Jogo Carregado: " + _string);
	}
}

function scrResetGame() {
	with (objSaveMe) instance_destroy();
	ds_grid_clear(objGui.gridItems, -1);
	ds_grid_clear(objGui.gridItems2, -1);
	global.lifes = 10; // Define a quantidade de vidas inicial
	global.stamina = 10; // Define a quantidade de estamina inicial
	global.poison = 0; // <-- Define o tempo em que o player fica envenedado
	global.coinsSilver = 0;
	global.coinsGold = 0;
	global.coinsDiamond = 0;
	global.coinsSaphire = 0;
	global.coinsRuby = 0;
	global.upgradeLifes = 0;
	global.upgradeStam = 0;
	global.upgradeDano = 0;
	global.upgradeVeneno = 0;
	objGui.coinLabels2[0] = 15;
	objGui.coinLabels2[1] = 18;
	objGui.coinLabels2[2] = 20;
	objGui.coinLabels2[3] = 35;
}

function scrLoadCoins() {
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
	
	if (file_exists(_file)) {
		
		var _buffer = buffer_load(_file);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer);
		
		var _loadData = json_parse(_string); // <-- Transforma o Json em Array
		
		while (array_length(_loadData) > 0) {
			
			var _loadEntity = array_pop(_loadData);
			global.coinsSilver = _loadEntity.coinsSilver;
			global.coinsGold = _loadEntity.coinsGold;
		}
	} else if (!file_exists(_file)) {
		global.coinsSilver = 180;
	}
}