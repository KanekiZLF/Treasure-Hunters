/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if (instance_exists(objPlayer)) {
	
	if (place_meeting(x, y, objPlayer) && !isOpen) {
		draw_set_font(fnPressStart2P);
		if (scrFindItem(Items.Key)) {
			scrDrawOutLine(x, y + 20, "Pressione F para abrir o bau", .4, c_black, 5, 150, 900, .15, .15, 0);
		} else {
			scrDrawOutLine(x, y + 20, "Necessario chave !", .4, c_black, 30, 150, 900, .15, .15, 0);
		}
		draw_set_font(fnTextoBase30);
	}
}



