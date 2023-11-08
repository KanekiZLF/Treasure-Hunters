// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrItens(){
	// Array com todas as sprites
	var spriteMap = [
		sprRedPotion,		// 0: Elixir de Vida
		sprBluePotion,		// 1: Elixir de Estamina
		sprGreenBottle,		// 2: Elixir Envenenado
		sprDiamondCoin,		// 3: Pedra de Diamante
		sprSaphireCoin,		// 4: Pedra de Saphira
		sprRubyCoin,		// 5: Pedra de Ruby
		sprGoldenSkull,		// 6: Caveira de Ouro
		sprChestKeyIdle,	// 7: Chave de Ouro
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