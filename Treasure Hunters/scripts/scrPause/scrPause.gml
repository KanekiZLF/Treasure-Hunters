// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrPause() {
	// Percorre todos os objetos na room se o jogo estiver pausado
	var _objCount = instance_count; // Conta quantos objetos estão na room
	for (var i = 0; i < _objCount; i++) {
		  var _objId = instance_id_get(i); // Encontra o objeto atual
			if (_objId) {
				ds_list_add(imgSpeedList, _objId.speed); // Adiciona o valor de image_speed à lista
		}
	}
} 


function scrResume() {
	// Percorre a lista e define o valor para seus objetos depois que jogo é despausado
		for (var i = 0; i < ds_list_size(imgSpeedList); i++) {
			var speedValue = imgSpeedList[| i]; // <-- Localiza dentro da lista usando um assessor
			var _objCount2 = instance_count; // Conta quantos objetos estão na room
	}
}