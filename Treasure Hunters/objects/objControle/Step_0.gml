if instance_exists(objSword) {
    var _num = instance_number(objSword);

    for (var i = 0; i < _num; i++) {
        var _inst = instance_find(objSword, i);
		
		if (_inst.isSpeed == 0) {
			_inst.isSpeed = _inst.speed; // Armazena a velocidade atual da instância
		}

        if (global.gamepause) {
            _inst.speed = 0;
        } else if (!global.gamepause && _inst.isSpeed <> 0) {
            _inst.speed = _inst.isSpeed;
        }
		scrPrint("Speed: " + string(_inst.isSpeed));
    }
}


