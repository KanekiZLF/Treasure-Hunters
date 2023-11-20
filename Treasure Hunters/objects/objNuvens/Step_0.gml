/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _guiLarg = display_get_gui_width();
var _guiAlt = display_get_gui_height();
randomize();
x -= velocidade;
// Se a nuvem ultrapassou a borda direita da tela
if (x == -sprite_get_width(sprite_index)) {
	var _nuv = instance_create_layer(room_width + sprite_get_width(sprite_index), y + irandom(5), layer, objNuvens);
		_nuv.image_index = irandom_range(0, 3);
	
	instance_destroy();
}








