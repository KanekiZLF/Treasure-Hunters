/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No evento de colisão do item com o inimigo
if (place_meeting(x, y, objEntidade)) {
    // Calcula o novo ângulo de ricochete (45 graus para cima)
    var newDirection = direction + 45;

    // Garante que o ângulo permanece entre 0 e 360 graus
    if (newDirection < 0) {
        newDirection += 360;
    } else if (newDirection >= 360) {
        newDirection -= 360;
    }

    // Aplica o novo ângulo e inverte a velocidade para ricochetear
    direction = newDirection;
    speed *= -1;

    // Ajusta a posição para evitar que fique preso no inimigo
    x += lengthdir_x(2, newDirection);
    y += lengthdir_y(2, newDirection);
}








