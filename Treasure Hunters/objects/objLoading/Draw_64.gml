/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Configurações de desenho do retângulo
draw_set_color(#9b624f);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Configurações de texto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_font(fnPressStart2P);

// Desenha a mensagem no centro da tela
scrDrawOutLine(display_get_gui_width() / 2, display_get_gui_height() / 2, "Carregando...", 5, c_white, 10, 8, 300, 1, 1, 0);

// Redefine as configurações de desenho e texto
draw_set_font(fnTextoBase30);
draw_set_color(c_white);









