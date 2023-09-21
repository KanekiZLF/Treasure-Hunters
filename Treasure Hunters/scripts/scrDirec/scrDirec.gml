// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDirec() {
    // Defina um mapa de direções para sprites
    var spriteMap = [
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
        sprPlayerHit    // 15: Esquerda
    ];

    // Defina a imagem_xscale com base na direção
    image_xscale = (direc % 2 == 0) ? 1 : -1;

    // Obtenha o sprite correto com base na direção
    var spriteIndex = spriteMap[direc];

    // Chame a função para mudar o sprite
    scrChangeSprite(spriteIndex);

    // Se necessário, defina a mask_index
    if (direc >= 4 && direc <= 5) {
        mask_index = sprPlayerSwordAtack1;
    }
}
