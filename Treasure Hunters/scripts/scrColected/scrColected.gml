//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações
function scrColected(coinType, quant){
	
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
	
	if (coinType == "elxLife") {
		objCoinsGui.myElxLife += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "elxStam") {
		objCoinsGui.myElxStam += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "elxPoison") {
		objCoinsGui.myElxPoison += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "goldSkull") {
		objCoinsGui.mySkull += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
	
	if (coinType == "chestKey") {
		objCoinsGui.myKey += quant;
		objCoinsGui.alphaCoins = 1;
		objCoinsGui.alarm[0] =  1 * game_get_speed(gamespeed_fps);
	}
}