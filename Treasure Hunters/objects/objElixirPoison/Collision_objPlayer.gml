/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrDsGridProcess(2);
scrColected("elxPoison", 1);
objCoinsGui.alphaCoins = 1;
if (!isEffect) {
	var _effect = instance_create_layer(x, y, "Effects", objEffects);
	_effect.direc = 14;
	isEffect = true;
}
wasCollected = true;
scrSaveData();
instance_destroy();






