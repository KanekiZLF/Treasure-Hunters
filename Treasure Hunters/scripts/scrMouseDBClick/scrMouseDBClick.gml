//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
function scrMouseDBClick() {
	
	var _doubleClickTime = 10 * game_get_speed(gamespeed_fps); // Tempo máximo entre cliques para considerar um double-click
	if (!variable_global_exists("lastClickTime")) {
	    global.lastClickTime = -_doubleClickTime;
	}

	if (mouse_check_button_pressed(mb_any)) {
	    if (current_time - global.lastClickTime <= _doubleClickTime) {
	        //show_debug_message("Double Click Detectado!");
	        return true;
	    }
	    global.lastClickTime = current_time;
	}

	return false;
}