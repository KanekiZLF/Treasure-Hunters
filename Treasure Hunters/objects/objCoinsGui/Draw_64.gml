/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
#region Coins Gui
if (myCoinsSilver > 0) {
	scrDrawCoinInfo(sprSilverCoin, myCoinsSilver, alphaCoins, -70.5);
}

if (myCoinsGold > 0) {
	if (myCoinsSilver <= 0) {
		scrDrawCoinInfo(sprGoldCoin, myCoinsGold, alphaCoins, -70.5);
	} else {
		scrDrawCoinInfo(sprGoldCoin, myCoinsGold, alphaCoins, -60.5);
	}
}

if (myCoinsDiamond > 0) {
	if (myCoinsSilver <= 0 && myCoinsGold <= 0) {
		scrDrawCoinInfo(sprGoldCoin, myCoinsGold, alphaCoins, -70.5);
	} else if (myCoinsGold <= 0) {
		scrDrawCoinInfo(sprGoldCoin, myCoinsGold, alphaCoins, -60.5);
	} else {
		scrDrawCoinInfo(sprDiamondCoin, myCoinsDiamond, alphaCoins, -50.5);
	}
}

if (myCoinsSaphire > 0) {
	scrDrawCoinInfo(sprSaphireCoin, myCoinsSaphire, alphaCoins, -40.5);
}

if (myCoinsRuby > 0) {
	scrDrawCoinInfo(sprRubyCoin, myCoinsRuby, alphaCoins, -30.5);
}

#endregion







