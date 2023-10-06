// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrPause() {
	// Percorre todos os objetos na room se o jogo estiver pausado
	var _objCount = instance_count; // Conta quantos objetos estão na room
	for (var i = 0; i < _objCount; i++) {
		  var _objId = instance_id_get(i); // Encontra o objeto atual
			if (_objId) {
				ds_list_add(imgSpeedList, _objId.image_speed, _objId.speed); // Adiciona o valor de image_speed à lista
				_objId.image_speed = 0;
		}
	}
} 


function scrResume() {
	// Percorre a lista e define o valor para seus objetos depois que jogo é despausado
		for (var i = 0; i < ds_list_size(imgSpeedList); i += 2) {
		    var imgSpeedValue = ds_list_find_value(imgSpeedList, i);
			var speedValue = ds_list_find_value(imgSpeedList, i);
			var _objCount2 = instance_count; // Conta quantos objetos estão na room
			
			for (var j = 0; j < _objCount2; j++) {
			   var _objId = instance_id_get(j); // Encontra o objeto atual
					if (_objId) {
						_objId.image_speed = imgSpeedValue;
						
				}
		    scrPrint("Objeto " + string(i) + ": image_speed = " + string(speedValue));
		}
	}
}