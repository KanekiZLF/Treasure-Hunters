/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Verificar se a tecla desejada foi pressionada (por exemplo, a tecla W)
if (keyboard_check_pressed(ord("W"))) {
    moving = true;
}

// Mover a câmera se a flag "moving" estiver definida como verdadeira
if (moving) {
    // Calcular a nova posição da câmera
    var new_x = camera_get_view_x(camera) + camera_speed;
    
    // Chamar o script para mover a câmera suavemente
    camera_smooth_move(new_x, camera_get_view_y(camera), camera_speed, camera);
}

// Função para mover a câmera suavemente
function camera_smooth_move(x_target, y_target, speed, camera_id) {
    var x_distance = x_target - camera_get_view_x(camera_id);
    var y_distance = y_target - camera_get_view_y(camera_id);
    
    var distance = point_distance(0, 0, x_distance, y_distance);
    
    if (distance > 0) {
        var x_step = x_distance / distance;
        var y_step = y_distance / distance;
        
        camera_set_view_pos(camera_id, camera_get_view_x(camera_id) + x_step * speed, camera_get_view_y(camera_id) + y_step * speed);
    }
    else {
        moving = false;
    }
}





