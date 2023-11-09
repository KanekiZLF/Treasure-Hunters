//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
function scrCoinColected(coinType, quant){
	
	if (coinType == "silver") {
		global.coinsSilver += quant;
		objCoinsGui.myCoinsSilver += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "gold") {
		global.coinsGold += quant;
		objCoinsGui.myCoinsGold += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "diamond") {
		global.coinsDiamond += quant;
		objCoinsGui.myCoinsDiamond += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "saphire") {
		global.coinsSaphire += quant;
		objCoinsGui.myCoinsSaphire += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "ruby") {
		global.coinsRuby += quant;
		objCoinsGui.myCoinsRuby += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
}