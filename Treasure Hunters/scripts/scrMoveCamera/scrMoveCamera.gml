function scrMoveCamera() {
	/// @param      {int|real}   velocidade
	/// @param      {int|real}   distancia
	if !camDef {
		posCamX = camera_get_view_x(view_camera[0]);
		posCamY = camera_get_view_y(view_camera[0]);
		camDef = true;
	}
    var _velocidade = argument0;
    var _distancia = argument1;
    var _distanciaPercorrida = 0;
    var _distRefX = posCamX;
    var _distRefY = posCamY;

	
    switch (camDirec) {
        case 0:
            camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - _velocidade, camera_get_view_y(view_camera[0]));
            var camX1 = camera_get_view_x(view_camera[0]);
            _distanciaPercorrida = camX1 - _distRefX; // Corrigido para calcular em relação a _distRefX
            break;
        
        case 1:
            camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + _velocidade, camera_get_view_y(view_camera[0]));
            var camX2 = camera_get_view_x(view_camera[0]);
            _distanciaPercorrida = camX2 - _distRefX; // Corrigido para calcular em relação a _distRefX
            break;
        
        case 2:
            camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - _velocidade);
            var camY1 = camera_get_view_y(view_camera[0]); // Corrigido para pegar view_yview
            _distanciaPercorrida = camY1 - _distRefY; // Corrigido para calcular em relação a _distRefY
            break;
        
        case 3:
            camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + _velocidade);
            var camY2 = camera_get_view_y(view_camera[0]); // Corrigido para pegar view_yview
            _distanciaPercorrida = camY2 - _distRefY; // Corrigido para calcular em relação a _distRefY
            break;
		}
	

	    if (_distanciaPercorrida == -_distancia) {
	        if (camDirec == 0) {
				camDirec = 1;
	        }
        
	        if (camDirec == 2) {
				camDirec = 3;
			}
	    }
    
	    if (_distanciaPercorrida == _distancia) {
	      if (camDirec == 1) {
				camDirec = 0;
	     }
        
	    if (camDirec == 3) {
			camDirec = 2;
		}
	}
}
