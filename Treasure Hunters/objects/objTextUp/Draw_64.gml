/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Defina a cor do texto
draw_set_color(c_white); // Pode escolher uma cor diferente

// Defina a fonte e o tamanho do texto
draw_set_font(fnTextoBase30); // Pode escolher uma fonte diferente
draw_set_halign(fa_center); // Alinhe o texto ao centro
draw_set_alpha(alpha);

// Desenhe o texto
scrDrawOutLine(x, y, texto, 2, c_black, 5, 10, 700, fontSize, fontSize, 0)

// Restaure a cor e a fonte padrão
draw_set_alpha(1);
draw_set_color(c_white); // Restaura a cor padrão
draw_set_font(fnTextoBase30); // Restaura a fonte padrão









