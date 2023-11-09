//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
function scrShowLoadScreen() {
	global.loadingProgress = 0;
	instance_create_layer(0, 0, "Instances", objLoading);
}

function scrHideLoadScreen() {
	instance_destroy(objLoading);
}