// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDebug() {
	var _value = argument0;
	switch(_value) {
		default:
			show_debug_message(string(_value));
		break;
		
		case 0:
			show_debug_message(string(device_mouse_x_to_gui(0)) + ":X MOUSE Y:" + string(device_mouse_y_to_gui(0)));
		break;
	}
}