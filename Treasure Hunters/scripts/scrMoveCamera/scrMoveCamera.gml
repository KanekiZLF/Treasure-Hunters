// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrMoveCamera(){
/// camera_move(direction, speed, distance)

var direction = argument0; // Direção (1 direita, 2 esquerda, 3 cima, 4 baixo)
var speed = argument1;    // Velocidade de movimento
var distance = argument2; // Distância a ser percorrida

var x_target = camera_get_view_x(view_camera[0]);
var y_target = camera_get_view_y(view_camera[0]);

if (direction == 1) {
    x_target += distance;
}
else if (direction == 2) {
    x_target -= distance;
}
else if (direction == 3) {
    y_target -= distance;
}
else if (direction == 4) {
    y_target += distance;
}

camera_smooth_move(x_target, y_target, speed, view_camera[0]);

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
}


}