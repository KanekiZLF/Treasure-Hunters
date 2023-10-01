/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/*if instance_exists(objSword) {
	var _num = instance_number(objSword)
	
	for (var i = 0; i < _num; i++) {
		var _inst = instance_find(objSword, i);
		if _inst.efeito && !_inst.float {
			if (image_index >= sprite_get_number(sprFallDust) - 1) {
				_inst.efeito = false; // Desative o efeito
			}
			draw_sprite_ext(sprFallDust, -1,_inst.x, _inst.y, 1, 1, 90 * _inst.image_xscale, c_white, 1);
		}
	}
}




