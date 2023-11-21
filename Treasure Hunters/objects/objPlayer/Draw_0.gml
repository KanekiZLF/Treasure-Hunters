/// @description Desenha os efeitos
// You can write your code in this editor
draw_self();
//draw_line(x - 14, y + 2, x + 10, y + 2);
//draw_line(x - 14, y - 28, x + 10, y - 28);

/*
// Define o efeito de ataque no chao
var swordX = image_xscale * 30 + x; //<-- Calcula se é -30 ou 30
var swordY = y - sprite_height / 2 + 12; //<-- Obtem o centro da sprite e soma +12
var swordScaleX = image_xscale * 1; //<-- Define se é -1 ou 1
var swordScaleY = 1; //<-- Padrãozera

if (sprite_index == sprPlayerSwordAtack12) { //<-- Efeito de ataque 1
    draw_sprite_ext(sprSwordAttack1, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}
else if (sprite_index == sprPlayerSwordAtack22) {//<-- Efeito de ataque 2
    draw_sprite_ext(sprSwordAttack2, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}
else if (sprite_index == sprPlayerSwordAtack32) {//<-- Efeito de ataque 3
    draw_sprite_ext(sprSwordAttack3, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}


// Define o efeito de ataque no AR

if (sprite_index == sprPlayerSwordAirAtack1) {
    draw_sprite_ext(sprSwordAttackAir1, -1,  (image_xscale * 15) + x, y - sprite_height / 2 + 35, image_xscale * 1, 1, 0, c_white, 1);
} else if (sprite_index == sprPlayerSwordAirAtack2) {
    draw_sprite_ext(sprSwordAttackAir2, -1,  (image_xscale * 18) + x, y - sprite_height / 2 + 32, image_xscale * 1, 1, 0, c_white, 1);
}


