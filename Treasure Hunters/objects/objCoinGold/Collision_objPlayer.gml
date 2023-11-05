/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (objGui.drawCoin == sprSilverCoin) {
	objGui.myCoins = 0;
}
global.coinsGold++;
objGui.drawCoin = sprGoldCoin;
objGui.myCoins++;
objGui.alphaCoins = 1;
objGui.alarm[2] =  1 * game_get_speed(gamespeed_fps);

instance_destroy();



