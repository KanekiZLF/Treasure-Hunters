/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrCoinColected("silver", 1);
objCoinsGui.alphaCoins = 1;
if (!isEffect) {
	var _effect = instance_create_layer(x, y, "Effects", objEffects);
	_effect.direc = 10;
	isEffect = true;
}

instance_destroy();