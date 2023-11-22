/// @description Tomo dano
// You can write your code in this editor
/*var _pause = global.gamepause;
var _enemy = instance_place(x, y, objEntidade);

// Verifica se o inimigo está vivo e se o jogador pode tomar dano
if (!_enemy.isDead && tomarDano && !isDead && !_pause && (mask_index == sprPlayerIdle)) {
    // Aplica a colisão e as ações relacionadas ao dano
    scrCollision();
    global.cameraActive = false;
    camDirec = (image_xscale == 1) ? 0 : 1;
    alarm[5] = 10; // Treme a tela
    alarm[0] = game_get_speed(gamespeed_fps) * 1; //<-- Intervalo para tomar dano
        
    // Atualiza variáveis relacionadas ao dano
    lifeCost += 2;
    global.lifes -= lifeCost;
    hit = true;
    dropSword = true;
    piscando = true;
    image_alpha = alphaMin;
    tomarDano = false;
}


