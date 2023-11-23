/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (room != rmInit) {
	global.isLoading = true;
}

if (!instance_exists(objPlayer)) {
	if (room != rmInit) {
		instance_create_layer(50, 430, "Instances", objPlayer);
	}
}

