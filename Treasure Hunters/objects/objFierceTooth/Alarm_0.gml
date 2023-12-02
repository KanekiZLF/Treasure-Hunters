/// @description Controla a velocidade
// Você pode escrever seu código neste editor
if (!global.gamepause) {
	if (!perseg && walk) {
		velocidade = velocidade ? 0 : 1;
		var _ranNum = choose(0, 1, 2, 2, 1, 1 , 1, 2, 2); // Gere um número aleatório entre 0, 1 e 2

		if _ranNum == 1 {
			direita = 1;
			esquerda = 0;
		} else if (_ranNum == 2) {
			direita = 0;
			esquerda = 1;
		}
	} else {
		velocidade = velocidade;
	}
}