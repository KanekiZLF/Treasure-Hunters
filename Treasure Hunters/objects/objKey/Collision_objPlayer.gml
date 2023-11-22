/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _effect = instance_create_layer(x, y - 10, "Effects", objEffects);
	_effect.direc = 15;
	scrColected("chestKey", 1);
	objCoinsGui.alphaCoins = 1;
	scrDsGridProcess(Items.Key);
instance_destroy();
