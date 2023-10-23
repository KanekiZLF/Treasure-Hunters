// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrPause() {
	// Percorre todos os objetos na room se o jogo estiver pausado
	var _objCount = instance_count; // Conta quantos objetos estão na room
	for (var i = 0; i < _objCount; i++) {
		  var _objId = instance_id[i]; // Encontra o objeto atual
			if (instance_exists(_objId)) {
				ds_list_add(listSpeed, _objId.image_speed, _objId.speed); // Adiciona o valor de image_speed à lista
				_objId.image_speed = 0;
		}
	}
} 


function scrResume() {
    var _imgSpeed = listSpeed[| 0];
    var _itemSpeed = listSpeed[| 1];

    for (var i = 0; i < instance_count; i++) {
        var _objId = instance_id[i];

        if (instance_exists(_objId)) {
            _objId.image_speed = _imgSpeed;
            _objId.speed = _itemSpeed;
        }
    }
}


