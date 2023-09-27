/// @description Desneha os efeitos
// You can write your code in this editor
draw_self();


// Define o efeito de ataque no chao
var swordX = image_xscale * 30 + x; //<-- Calcula se é -30 ou 30
var swordY = y - sprite_height / 2 + 12; //<-- Obtem o centro da sprite e soma +12
var swordScaleX = image_xscale * 1; //<-- Define se é -1 ou 1
var swordScaleY = 1; //<-- Padrãozera

if (sprite_index == sprPlayerSwordAtack1) { //<-- Efeito de ataque 1
    draw_sprite_ext(sprSwordAttack1, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}
else if (sprite_index == sprPlayerSwordAtack2) {//<-- Efeito de ataque 2
    draw_sprite_ext(sprSwordAttack2, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}
else if (sprite_index == sprPlayerSwordAtack3) {//<-- Efeito de ataque 3
    draw_sprite_ext(sprSwordAttack3, -1, swordX, swordY, swordScaleX, swordScaleY, 0, c_white, 1);
}


// Define o efeito de ataque no AR

if (sprite_index == sprPlayerSwordAirAtack1) {
    draw_sprite_ext(sprSwordAttackAir1, -1,  (image_xscale * 15) + x, y - sprite_height / 2 + 35, image_xscale * 1, 1, 0, c_white, 1);
} else if (sprite_index == sprPlayerSwordAirAtack2) {
    draw_sprite_ext(sprSwordAttackAir2, -1,  (image_xscale * 18) + x, y - sprite_height / 2 + 32, image_xscale * 1, 1, 0, c_white, 1);
}
