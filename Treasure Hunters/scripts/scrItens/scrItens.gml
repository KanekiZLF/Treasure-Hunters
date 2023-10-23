// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrItens(){
	// Array com todas as sprites
	var spriteMap = [
		sprRedPotion, // 0
		sprBluePotion, // 1
		sprGreenBottle, // 2
		sprDiamondCoin, // 3
		sprSaphireCoin, // 4
		sprRubyCoin, // 5
		sprGoldenSkull // 6
	];
	
	// Se a variavel não existir, ele cria
	if (!variable_instance_exists(id, "spriteIndex")) {
		spriteIndex = string;
	}
	
	// Define a sprite que sera usada
	spriteIndex = spriteMap[sprite];
	
	// Altera sprite
	scrChangeSprite(spriteIndex);
}