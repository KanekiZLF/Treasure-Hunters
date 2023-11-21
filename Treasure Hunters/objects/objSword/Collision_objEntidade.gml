/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No evento de colisão do item com o inimigo

// Verificar colisão com objEntidade
if (place_meeting(x, y, objEntidade)) {
    // Calcula o novo ângulo de ricochete (45 graus para cima)
    var newDirection = direction - 45;

    // Aplica o novo ângulo
    direction = newDirection;

    // Calcula as novas velocidades usando lengthdir
    var x_speed = lengthdir_x(speed, newDirection);
    var y_speed = lengthdir_y(speed, newDirection);

    // Inverte as velocidades para ricochetear
    x_speed *= -1;
    y_speed *= -1;

    // Aplica as novas velocidades
    speed = sqrt(x_speed * x_speed + y_speed * y_speed);
    direction = point_direction(0, 0, x_speed, y_speed);
    x += x_speed;
    y += y_speed;
	alarm[2] = 30;
	ricochete = true;
}










