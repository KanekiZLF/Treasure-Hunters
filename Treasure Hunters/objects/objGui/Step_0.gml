/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala2 = 4;
var _recX = display_get_gui_height()/2 + (-35.5 * _escala2);
var _recY = display_get_gui_width()/2 + (-32 * _escala2);

if (point_in_rectangle(mouse_x, mouse_y, _recX, _recY, (72 * _escala2) + _recX, (14 * _escala2) + _recY)) {
	show_message("AA")
}




