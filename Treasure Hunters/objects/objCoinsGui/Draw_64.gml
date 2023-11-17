/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
#region Coins Gui
// Ajuste as constantes para a posição conforme necessário
var posicaoBase = -70;
var passoPosicao = 12.0;

// Moeda de Prata
if (myCoinsSilver > 0) {
    scrDrawInfo(sprSilverCoin, myCoinsSilver, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Moeda de Ouro
if (myCoinsGold > 0) {
    scrDrawInfo(sprGoldCoin, myCoinsGold, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Moeda de Diamante
if (myCoinsDiamond > 0) {
    scrDrawInfo(sprDiamondCoin, myCoinsDiamond, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Moeda de Safira
if (myCoinsSaphire > 0) {
    scrDrawInfo(sprSaphireCoin, myCoinsSaphire, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Moeda de Rubi
if (myCoinsRuby > 0) {
    scrDrawInfo(sprRubyCoin, myCoinsRuby, alphaCoins, posicaoBase);
	posicaoBase += passoPosicao;
}

// Elixir de Vida
if (myElxLife > 0) {
    scrDrawInfo(sprRedPotion, myElxLife, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Elixir de Vida
if (myElxStam > 0) {
    scrDrawInfo(sprBluePotion, myElxStam, alphaCoins, posicaoBase);
    posicaoBase += passoPosicao;
}

// Elixir de Vida
if (myElxPoison > 0) {
    scrDrawInfo(sprGreenBottle, myElxPoison, alphaCoins, posicaoBase);
}


#endregion







