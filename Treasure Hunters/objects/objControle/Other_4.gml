/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

scrMusic(); // <-- Script das musicas

if (room != rmInit) {
	global.isLoading = true;
	scrLoadData();
}

if (!instance_exists(objPlayer)) {
	if (room != rmInit) {
		instance_create_layer(50, 430, "Instances", objPlayer);
	}
}

if (instance_exists(objPlayer)) {
	if (room != rmInit) {
		alarm[1] = 5;
	}
}