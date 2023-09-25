// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrSword(){
	var spriteMap = [
		sprSwordIdle, // 0: Direita
		sprSwordIdle, // 1: Esquerda
		sprSwordSpinig, // 2: Direita
		sprSwordSpinig, // 2: Esquerda
		sprSwordEmbeded, // 3: Direita
		sprSwordEmbeded // 3: Esquerda
	]
	
	// Defina a imagem_xscale com base na direção
	image_xscale = (direc % 2 == 0) ? 1 : -1;
	
	if (!variable_instance_exists(id, "spriteIndex")) {
		spriteIndex = string;
	}
	
	// Obtenha o sprite correto com base na direção
	spriteIndex = spriteMap[direc];
	
	// Chame a função para mudar o sprite
    scrChangeSprite(spriteIndex);
}