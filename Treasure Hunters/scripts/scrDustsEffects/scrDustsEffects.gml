// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDustsEffects(){
	var spriteMap = [
		sprJumpDust, // <-- Direita
		sprJumpDust, // <-- Esquerda
		sprFallDust, // <-- Direita
		sprFallDust, // <-- Esquerda
		sprRunDust, // <-- Direita
		sprRunDust, // <-- Esquerda
	]
	
	if(!variable_instance_exists(id, "spriteIndex")){
		spriteIndex = string;
	}
	
	// Defina a imagem_xscale com base na direção
    image_xscale = (direc % 2 == 0) ? 1 : -1;
	
	spriteIndex = spriteMap[direc]
	
	scrChangeSprite(spriteIndex)
}