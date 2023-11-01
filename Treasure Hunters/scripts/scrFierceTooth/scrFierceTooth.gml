// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrFierceTooth(){
	scrCollision();
	velocidadeH = (direita - esquerda) * velocidade;
	
	if velocidadeH != 0 && velocidadeV == 0 {
		if direita {
			direc = 2;
		}
		
		if esquerda {
			direc = 3;
		}
	} else if velocidadeH == 0 && velocidadeV == 0 {
		if direc = 2 {
			direc = 0;
		}
		
		if direc = 3 {
			direc = 1;
		}
	}
}