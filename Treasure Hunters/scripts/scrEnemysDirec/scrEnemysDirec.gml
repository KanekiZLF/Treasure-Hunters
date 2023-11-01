// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrEnemysDirec(){
	// Sprites FierceTooth
	var spriteMap0 = [
		sprFierceToothIdle, // 0: Parado Direita
		sprFierceToothIdle, // 1: Parado Esquerda
		sprFierceToothRun, // 2: Andando Direita
		sprFierceToothRun, // 3: Andando Esquerda
		sprFierceToothJump, // 4: Pulando Direita
		sprFierceToothJump, // 5: Pulando Esquerda
		sprFierceToothFall, // 6: Caindo Direita
		sprFierceToothFall, // 7: Caindo Esquerda
		sprFierceToothGround, // 8: Aterrissagem Direita
		sprFierceToothGround, // 9: Aterrissagem Esquerda
		sprFierceToothAttack, // 10: Ataque Direita
		sprFierceToothAttack, // 11: Ataque Esquerda
		sprFierceToothAntecipation, // 12: Pulando Direita
		sprFierceToothAntecipation, // 13: Pulando Esquerda
		sprFierceToothHit, // 14: Pulando Direita
		sprFierceToothHit, // 15: Pulando Esquerda
		sprFierceToothDead, // 16: Pulando Direita
		sprFierceToothDead, // 17: Pulando Esquerda
		sprFierceToothDeadGround, // 18: Pulando Esquerda
		sprFierceToothDeadGround, // 19: Pulando Esquerda
	]
	
	
	
	// Defina a imagem_xscale com base na direção
    image_xscale = (direc % 2 == 0) ? 1 : -1;
	
	if (!variable_instance_exists(id, "spriteIndex")) {
		spriteIndex = string;
	}
	
    // Obtenha o sprite correto com base na direção
	if (arraySprite = 0) {
		spriteIndex = spriteMap0[direc];
	} else if (arraySprite = 1) {
		spriteIndex = spriteMap1[direc];
	}

    // Chame a função para mudar o sprite
    scrChangeSprite(spriteIndex);
}