/// @description Efeito de piscar !
// You can write your code in this editor
draw_self();

// Faz animação do personagem piscando
if alarm[0] > 0 && global.lifes >= 0 {
	if image_alpha >= 1 {
		danoAlpha = -0.05;
	}
	else if image_alpha <= 0 {
		danoAlpha = 0.05;
	}
	image_alpha += danoAlpha;
}
else {
	image_alpha = 1;
}