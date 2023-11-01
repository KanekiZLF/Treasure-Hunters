/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
//scrPrint(lifes)
randomise();
scrFierceTooth();
scrEnemysDirec();

if alarm[0] > 0 {
	if (place_meeting(x + 1, y, objParede)) {
	    // Colisão à direita
	    direita = 0;
	    esquerda = 1;
	}

	if (place_meeting(x - 1, y, objParede)) {
	    // Colisão à esquerda
	    direita = 1;
	    esquerda = 0;
	}
}

if (alarm[0] > 0) {
	direita = 0;
	esquerda = 0;
}









