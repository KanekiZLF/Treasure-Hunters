// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrEnemysDirec(){
	
	// FierceTooth
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
		sprFierceToothHit, // 14: Hit Direita
		sprFierceToothHit, // 15: Hit Esquerda
		sprFierceToothDead, // 16: Hit Dead Direita
		sprFierceToothDead, // 17: Hit Dead Esquerda
		sprFierceToothDeadGround, // 18: Morto Direita
		sprFierceToothDeadGround, // 19: Morto Esquerda
	]
	
	// PinkStar
	var spriteMap1 = [
		sprPinkStarIdle, // 0: Parado Direita
		sprPinkStarIdle, // 1: Parado Esquerda
		sprPinkStarRun, // 2: Andando Direita
		sprPinkStarRun, // 3: Andando Esquerda
		sprPinkStarJump, // 4: Pulando Direita
		sprPinkStarJump, // 5: Pulando Esquerda
		sprPinkStarFall, // 6: Caindo Direita
		sprPinkStarFall, // 7: Caindo Esquerda
		sprPinkStarGround, // 8: Aterrissagem Direita
		sprPinkStarGround, // 9: Aterrissagem Esquerda
		sprPinkStarAttack, // 10: Ataque Direita
		sprPinkStarAttack, // 11: Ataque Esquerda
		sprPinkStarAntecipation, // 12: Antecipação Direita
		sprPinkStarAntecipation, // 13: Antecipação Esquerda
		sprPinkStarHit, // 14: Hit Direita
		sprPinkStarHit, // 15: Hit Esquerda
		sprPinkStarDead, // 16: Hit Dead Direita
		sprPinkStarDead, // 17: Hit Dead Esquerda
		sprPinkStarDeadGround, // 18: Morto Direita
		sprPinkStarDeadGround, // 19: Morto Esquerda
	]
	
	// Crabby
	var spriteMap2 = [
		sprCrabbyIdle, // 0: Parado Direita
		sprCrabbyIdle, // 1: Parado Esquerda
		sprCrabbyRun, // 2: Andando Direita
		sprCrabbyRun, // 3: Andando Esquerda
		sprCrabbyJump, // 4: Pulando Direita
		sprCrabbyJump, // 5: Pulando Esquerda
		sprCrabbyFall, // 6: Caindo Direita
		sprCrabbyFall, // 7: Caindo Esquerda
		sprCrabbyGround, // 8: Aterrissagem Direita
		sprCrabbyGround, // 9: Aterrissagem Esquerda
		sprCrabbyAttack, // 10: Ataque Direita
		sprCrabbyAttack, // 11: Ataque Esquerda
		sprCrabbyAntecipation, // 12: Antecipação Direita
		sprCrabbyAntecipation, // 13: Antecipação Esquerda
		sprCrabbyHit, // 14: Hit Direita
		sprCrabbyHit, // 15: Hit Esquerda
		sprCrabbyDead, // 16: Hit Dead Direita
		sprCrabbyDead, // 17: Hit Dead Esquerda
		sprCrabbyGround, // 18: Morto Direita
		sprCrabbyGround, // 19: Morto Esquerda
	]
	
	// SealShell
	var spriteMap3 = [
		sprSealShellIdle, // 0: Parado Direita
		sprSealShellIdle, // 1: Parado Esquerda
		sprSealShellOpen, // 2: Abrindo Direita
		sprSealShellOpen, // 3: Abrindo Esquerda
		sprSealShellBite, // 4: Fechando Direita
		sprSealShellBite, // 5: Fechando Esquerda
		sprSealShellFire, // 6: Atacando Direita
		sprSealShellFire, // 7: Atacando Esquerda
		sprSealShellHit, // 8: Hit Direita
		sprSealShellHit, // 9: Hit Esquerda
		sprSealShellDestroy, // 10: Destruido Direita
		sprSealShellDestroy, // 11: Destruido Esquerda
	]
	
	// Totem Head 1 : 1-2
	var spriteMap4 = [
		sprHead1Idle1, // 0: Parado Direita
		sprHead1Idle1, // 1: Parado Esquerda
		sprHead1Attack1, // 2: Atacando Direita
		sprHead1Attack1, // 3: Atacando Esquerda
		sprHead1Hit1, // 4: Hit Direita
		sprHead1Hit1, // 5: Hit Esquerda
		sprHead1Destroyed1, // 6: Destruido Direita
		sprHead1Destroyed1, // 7: Destruido Esquerda
	]
	
	// Totem Head 1 : 2-2
	var spriteMap5 = [
		sprHead1Idle2, // 0: Parado Direita
		sprHead1Idle2, // 1: Parado Esquerda
		sprHead1Attack2, // 2: Atacando Direita
		sprHead1Attack2, // 3: Atacando Esquerda
		sprHead1Hit2, // 4: Hit Direita
		sprHead1Hit2, // 5: Hit Esquerda
		sprHead1Destroyed2, // 6: Destruido Direita
		sprHead1Destroyed2, // 7: Destruido Esquerda
	]
	
	// Totem Head 2 : 1-2
	var spriteMap6 = [
		sprHead2Idle1, // 0: Parado Direita
		sprHead2Idle1, // 1: Parado Esquerda
		sprHead2Attack1, // 2: Atacando Direita
		sprHead2Attack1, // 3: Atacando Esquerda
		sprHead2Hit1, // 4: Hit Direita
		sprHead2Hit1, // 5: Hit Esquerda
		sprHead2Destroyed1, // 6: Destruido Direita
		sprHead2Destroyed1, // 7: Destruido Esquerda
	]
	
	// Totem Head 2 : 2-2
	var spriteMap7 = [
		sprHead2Idle2, // 0: Parado Direita
		sprHead2Idle2, // 1: Parado Esquerda
		sprHead2Attack2, // 2: Atacando Direita
		sprHead2Attack2, // 3: Atacando Esquerda
		sprHead2Hit2, // 4: Hit Direita
		sprHead2Hit2, // 5: Hit Esquerda
		sprHead2Destroyed2, // 6: Destruido Direita
		sprHead2Destroyed2, // 7: Destruido Esquerda
	]
	
	// Totem Head 3 : 1-2
	var spriteMap8 = [
		sprHead3Idle1, // 0: Parado Direita
		sprHead3Idle1, // 1: Parado Esquerda
		sprHead3Attack1, // 2: Atacando Direita
		sprHead3Attack1, // 3: Atacando Esquerda
		sprHead3Hit1, // 4: Hit Direita
		sprHead3Hit1, // 5: Hit Esquerda
		sprHead3Destroyed1, // 6: Destruido Direita
		sprHead3Destroyed1, // 7: Destruido Esquerda
	]
	
	// Totem Head 3 : 2-2
	var spriteMap9 = [
		sprHead3Idle2, // 0: Parado Direita
		sprHead3Idle2, // 1: Parado Esquerda
		sprHead3Attack2, // 2: Atacando Direita
		sprHead3Attack2, // 3: Atacando Esquerda
		sprHead3Hit2, // 4: Hit Direita
		sprHead3Hit2, // 5: Hit Esquerda
		sprHead3Destroyed2, // 6: Destruido Direita
		sprHead3Destroyed2, // 7: Destruido Esquerda
	]
	
	// Defina a imagem_xscale com base na direção
    image_xscale = (direc % 2 == 0) ? -1 : 1;
	
	if (!variable_instance_exists(id, "spriteIndex")) {
		spriteIndex = string;
	}
	
    // Seleciona o array de sprite que sera usado !
	switch(arraySprite) {
		default:
			show_message("Erro ao definir sprite inimigo: " + string(arraySprite))
		break;
		
		// FierceTooth
		case 0:
			spriteIndex = spriteMap0[direc];
		break;
		
		// PinkStar
		case 1:
			spriteIndex = spriteMap1[direc];
		break;
		
		// Crabby
		case 2:
			spriteIndex = spriteMap2[direc];
		break;
		
		// SealShell
		case 3:
			spriteIndex = spriteMap3[direc];
		break;
		
		// Totem Head 1 : 1-2
		case 4:
			spriteIndex = spriteMap4[direc];
		break;
		// Totem Head 1 : 2-2
		case 5:
			spriteIndex = spriteMap5[direc];
		break;
		
		// Totem Head 2 : 2-1
		case 6:
			spriteIndex = spriteMap6[direc];
		break;
		// Totem Head 2 : 2-2
		case 7:
			spriteIndex = spriteMap7[direc];
		break;
		
		// Totem Head 3 : 2-1
		case 8:
			spriteIndex = spriteMap8[direc];
		break;
		// Totem Head 3 : 2-2
		case 9:
			spriteIndex = spriteMap9[direc];
		break;
	}

    // Chame a função para mudar o sprite
    scrChangeSprite(spriteIndex);
}