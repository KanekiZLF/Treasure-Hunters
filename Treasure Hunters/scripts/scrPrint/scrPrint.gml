// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrPrint() {
	///@description Print(string, value)
	/// @function Print
	/// @param string
	/// @param value
 
	// Imprime, da mesma forma que show_debug_message, mas com opções de gravação
 
	var argCount = argument_count;
 
	switch (argCount){
	    case 0:
	        show_debug_message("Nenhum valor passado para mostrar.")
	    break;
    
	    case 1:
	        var _value = argument[0];
	        show_debug_message(_value);
	    break;
    
	    case 2:
	        var _string = argument[0];
	        var _value2 = argument[1];
 
	        show_debug_message(_string + string(_value2));
	    break;
		
		case 3:
		show_debug_message(string(device_mouse_x_to_gui(0)) + ":X MOUSE Y:" + string(device_mouse_y_to_gui(0)));
		break;
	}

}