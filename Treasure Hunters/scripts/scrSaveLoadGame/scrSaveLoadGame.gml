// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrSaveGame() {
	var _saveData = array_create(0);
	
	with (objSaveMe) {
		var _saveEntitys = {
			obj : object_get_name(object_index),
			currentRoom : room_get_name(room),
			y : y,
			x : x,
			coinsSilver : global.coinsSilver,
			coinsGold : global.coinsGold,
			coinsDiamond : global.coinsDiamond,
			coinsSaphire : global.coinsSaphire,
			coinsRuby : global.coinsRuby,
			
			lifes : global.lifes,
			lifes2 : objPlayer.lifes2,
			maxLifes : objPlayer.maxLifes,
			maxLifes2 : objPlayer.maxLifes2,
			
			stam : global.stamina,
			stamina2 : objPlayer.stamina2,
			maxStamina : objPlayer.maxStamina,
			maxStamina2 : objPlayer.maxStamina2,
			
			arraySprite : objPlayer.arraySprite,
		}
		array_push(_saveData, _saveEntitys)
	}
	
	//Salvando dentro do Json
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	var _file = "";
	switch(global.save) {
		default:
			show_message("Erro ao definir save !");
		break
		
		case 0:
			_file = "saveGame0.save";
		break;
		
		case 1:
			_file = "saveGame1.save";
		break;
		
		case 2:
			_file = "saveGame2.save";
		break;
	}
	buffer_save(_buffer, _file);
	scrPrint("Saved" + _string);
	scrPrint(global.lifes);
}

function scrLoadGame(){
	
	var _file = "";
	switch(global.save) {
		default:
			show_message("Erro ao definir save !");
		break
		
		case 0:
			_file = "saveGame0.save";
		break;
		
		case 1:
			_file = "saveGame1.save";
		break;
		
		case 2:
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
				with(instance_create_layer(0, 0, layer, asset_get_index(_loadEntity.obj))) {
					x = _loadEntity.x;
					y = _loadEntity.y;
					global.coinsSilver = _loadEntity.coinsSilver;
					global.coinsGold = _loadEntity.coinsGold;
					
					global.lifes = _loadEntity.lifes;
					if (instance_exists(objPlayer)) {
						objPlayer.lifes2 = _loadEntity.lifes2;
						objPlayer.maxLifes = _loadEntity.maxLifes;
						objPlayer.maxLifes = _loadEntity.maxLifes;
						
						objPlayer.stamina2 = _loadEntity.stamina2;
						objPlayer.maxStamina = _loadEntity.maxStamina;
						objPlayer.maxStamina2 = _loadEntity.maxStamina2;
						
						objPlayer.arraySprite = _loadEntity.arraySprite;
					}
					global.stamina = _loadEntity.stam;
					global.gamepause = false;
					global.option = noone;
				}
			}
		}
		scrPrint("Load" + _string);
		scrPrint(global.lifes);
	}
}