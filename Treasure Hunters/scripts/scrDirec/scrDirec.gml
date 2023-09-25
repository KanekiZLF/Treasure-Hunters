// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDirec() {
    // Defina um mapa de direções para sprites
    var spriteMap0 = [
        sprPlayerIdle,  // 0: Direita
        sprPlayerIdle,  // 1: Esquerda
        sprPlayerRun,   // 2: Direita
        sprPlayerRun,   // 3: Esquerda
        sprPlayerSwordAtack1, // 4: Direita
        sprPlayerSwordAtack1, // 5: Esquerda
        sprPlayerJump,  // 6: Direita
        sprPlayerJump,  // 7: Esquerda
        sprPlayerFall,  // 8: Direita
        sprPlayerFall,  // 9: Esquerda
        sprPlayerGround, // 10: Direita
        sprPlayerGround, // 11: Esquerda
        sprPlayerDead,  // 12: Direita
        sprPlayerDead,  // 13: Esquerda
        sprPlayerHit,   // 14: Direita
        sprPlayerHit,    // 15: Esquerda
		sprPlayerGround, // 16: Direita
		sprPlayerGround,  // 17: Esquerda
    ];
	
	var spriteMap1 = [
		sprPlayerSwordIdle, // 0: Direita
		sprPlayerSwordIdle, // 1: Esquerda
		sprPlayerSwordRun, // 2: Direita
		sprPlayerSwordRun, // 3: Esquerda
		sprPlayerSwordAtack1, // 4: Direita
		sprPlayerSwordAtack1, // 5: Esquerda
		sprPlayerSwordJump, // 6: Direita
		sprPlayerSwordJump, // 7: Esquerda
		sprPlayerSwordFall, // 8: Direita
		sprPlayerSwordFall, // 9: Esquerda
		sprPlayerSwordGround, // 10: Direita
		sprPlayerSwordGround, // 11: Esquerda
		sprPlayerDead, // 12: Direita
		sprPlayerDead, // 13: Esquerda
		sprPlayerSwordHit, // 14: Direita
		sprPlayerSwordHit, // 15: Esquerda
		sprPlayerSwordGround, // 16: Direita
		sprPlayerSwordGround, // 17: Esquerda
		sprPlayerSwordAtack2, // 18: Direita
		sprPlayerSwordAtack2, // 19: Esquerda
		sprPlayerSwordAtack3, // 20: Direita
		sprPlayerSwordAtack3, // 21: Esquerda
		sprPlayerSwordAirAtack1, // 22: Direita
		sprPlayerSwordAirAtack1, // 23: Esquerda
		sprPlayerSwordAirAtack2, // 24: Direita
		sprPlayerSwordAirAtack2, // 25: Esquerda
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

    // Se necessário, defina a mask_index
    if (direc >= 4 && direc <= 5) {
        mask_index = sprPlayerSwordAtack1;
    } else {
		mask_index = sprPlayerIdle;
	}
}
