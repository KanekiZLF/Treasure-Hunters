//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
// Função para desenhar informações de moeda
function scrDrawCoinInfo(sprite, amount, alpha, posYOffset) {
    if (amount > 0) {
        var escala = 4;
        var guiLarg = display_get_gui_width();
        var guiAlt = display_get_gui_height();
        var posX = guiLarg + (-10 * escala);
        var posY = guiAlt / 2 + (posYOffset * escala);

        draw_set_alpha(alpha);
        draw_sprite_ext(sprite, 0, posX, posY, 3, 3, 0, c_white, alpha);
        draw_text_ext_transformed(posX - (6 * escala), posY - (5.5 * escala), "x", 10, 300, 0.5, 0.5, 0);
        draw_text_ext_transformed(posX - (12 * escala), posY - (6 * escala), string(amount), 10, 300, 0.6, 0.6, 0);
        draw_set_alpha(1);
    }
}