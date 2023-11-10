/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (room != rmInit) {
	global.isLoading = true;
}

if (room != rmInit && !instance_exists(objPlayer)) {
	instance_create_layer(display_get_gui_width()/3, display_get_gui_height()/3, "Instances", objPlayer);
}
