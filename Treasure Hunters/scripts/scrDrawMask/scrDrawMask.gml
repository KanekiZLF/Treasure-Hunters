//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
// Deve ser executado diretamente no evento Draw/Desenhar
function scrDrawMask() {
	draw_set_color(c_red); // Define a cor do retângulo
	draw_set_alpha(0.5); // Define transparência para visualizar melhor

	// Obtém as coordenadas da máscara de colisão
	var left = bbox_left;
	var right = bbox_right;
	var top = bbox_top;
	var bottom = bbox_bottom;

	// Desenha o retângulo
	draw_rectangle(left, top, right, bottom, false);

	draw_set_alpha(1); // Restaura a opacidade normal
}