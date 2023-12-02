//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrCanFall(){
	// Verifica se ambas as linhas não estão colidindo com objColisParede
	var _lineBottom = collision_line(x - (15 * image_xscale), y + 16, x - (35 * image_xscale), y + 16, objColisParede, false, false);
	var _lineHigher = collision_line(x - (15 * image_xscale), y + 54, x - (35 * image_xscale), y + 54, objColisParede, false, false);

	// Se ambas as linhas não colidirem, não pode cair
	if (!_lineBottom && !_lineHigher) {
	    return false;
	} else {
		canFall = false;
	    return true;
	}
}