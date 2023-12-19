/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrDsGridProcess(6);
scrColected("goldSkull", 1);
objCoinsGui.alphaCoins = 1;
if (!isEffect) {
	var _effect = instance_create_layer(x, y, "Effects", objEffects);
	_effect.direc = 9;
	isEffect = true;
}
wasCollected = true;
scrSaveDataT();
instance_destroy();






