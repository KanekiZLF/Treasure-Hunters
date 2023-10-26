// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
// Função para desenhar upgrades
function scrDrawUpgrades(xx, yy, escala, upgCount) {
	//Barrinha vermelha de upgrade
	var _guiLarg = display_get_gui_width();
	var _guiAlt = display_get_gui_height();
	var _xx = _guiLarg/2 + (-52 * escala);
	var _yy = _guiAlt/2 + (30.5 * escala);
	var _upgCount2 = 0;
	var _spaceXX = 4 * escala;
	var _spaceYY = -6 * escala;
	
	if (upgCount >= 5) {
        _upgCount2 += upgCount - 5;
        upgCount = 5;
    }
			
    for (var i = 0; i < upgCount; i++) {
        for (var j = 0; j < _upgCount2; j++) {
            draw_sprite_ext(sprUpgrade, 0, xx + _spaceXX * j, yy + _spaceYY, escala, escala, 0, c_white, 1);
        }
        draw_sprite_ext(sprUpgrade, 0, xx + _spaceXX * i, yy, escala, escala, 0, c_white, 1);
    }
 
}