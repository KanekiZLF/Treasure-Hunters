// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

function scrSaveGame() {
	scrSaveData();
    var _saveData = array_create(0);
    var _saveEntitys;

    with (objSaveMe) {
        _saveEntitys = {
            obj: object_index,
            currentRoom: room,
            y: y,
            x: x,
            layer: layer,
            sprite_index: sprite_index,
            image_number: image_number,
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

function scrLoadGame() {
	scrLoadData();
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
				room_goto(_room);
			}
			
			if (room == _room) {
				with(instance_create_layer(0, 0, _loadEntity.layer, _loadEntity.obj)) {
				
					global.coinsSilver = _loadEntity.coinsSilver;
					global.coinsGold = _loadEntity.coinsGold;
					
					if (room != rmInit) {
						x = _loadEntity.x;
						y = _loadEntity.y;
						sprite_index = _loadEntity.sprite_index;
						image_index = _loadEntity.image_number;
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

function scrSaveData() {
    var _saveData = array_create(0);
    var _saveEntitys;

    if (instance_exists(objChest)) {
        for (var i = 0; i < instance_number(objChest); i++) {
            var _chest = instance_find(objChest, i);
            _saveEntitys = {
                x : _chest.x,
                y : _chest.y,
				id : id,
                sprite_index : _chest.sprite_index,
                image_index : _chest.image_index,
                isOpen : _chest.isOpen,
            };
            // Converter a lista em um array
            array_push(_saveData, _saveEntitys);
        }
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
            _file = "saveData0.dat";
            break;

        case 2:
            _file = "saveData1.dat";
            break;

        case 3:
            _file = "saveData2.dat";
            break;
    }
    buffer_save(_buffer, _file);
}

function scrLoadData() {
    var _file = "";
    switch(global.save) {
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

    if (file_exists(_file)) {
        var _buffer = buffer_load(_file);
        var _string = buffer_read(_buffer, buffer_string);
        buffer_delete(_buffer);

        var _loadData = json_parse(_string); // <-- Transforma o Json em Array

        while (array_length(_loadData) > 0) {
            var _loadEntity = array_pop(_loadData);

            if (instance_exists(objChest)) {
                var _chest = instance_nearest(_loadEntity.x, _loadEntity.y, objChest);
                // Atribuir os valores apenas à instância correspondente
                if (_chest != noone) {
                    _chest.isOpen = _loadEntity.isOpen;
                    _chest.image_index = _loadEntity.image_index;
                    _chest.sprite_index = _loadEntity.sprite_index;
                }
            }
        }
    } 
}
