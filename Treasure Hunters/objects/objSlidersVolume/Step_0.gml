/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mouseX = device_mouse_x_to_gui(0)
var _mouseY = device_mouse_y_to_gui(0)
sprite_index = sprSliderBoard;

var _mouse = position_meeting(_mouseX, _mouseY, id);
	
if(_mouse && device_mouse_check_button(0, mb_left) && global.option == 3) {
	selected = true;
}


if (device_mouse_check_button_released(0, mb_left) || global.option != 3) {
	selected = false;
}

if selected {
	value = clamp((_mouseX-x)/sprite_width, 0, maxValue);
}



