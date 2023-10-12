/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _mouseX = device_mouse_x_to_gui(0)
var _mouseY = device_mouse_y_to_gui(0)
sprite_index = sprSliderBoard;

var _mouse = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
	
if(_mouse && mouse_check_button_pressed(mb_left) && global.option == 3) {
	selected = true;
}


if (mouse_check_button_released(mb_left) || global.option != 3) {
	selected = false;
}

if selected {
	value = clamp((_mouseX-x)/sprite_width, 0, maxValue);
}



