/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region Bar Gui

var _pause = global.gamepause;
var _escala = 3;
var _guiAlt = display_get_gui_height();
var _guiLarg = display_get_gui_width();
var _sprAlt = sprite_get_height(sprLifeBar) * _escala;
var _sprAlt2 = sprite_get_height(sprStaminaBar) * _escala + 8;
var _hudAlt = _guiAlt/15;

var _lifes = objPlayer.lifes2 // <-- Vida count
var _stamina = objPlayer.stamina2;  // <-- Estamina count
var _maxLifes = objPlayer.maxLifes2;  // <-- Max Vida count
var _maxStamina = objPlayer.maxStamina2;  // <-- Max Estamina count
var _poison = objPlayer.poison2;  // <-- Veneno count
var _maxPoison2 = objPlayer.maxPoison2;  // <-- Veneno count
var _maxPoison = objPlayer.maxPoison;

//Hud
draw_sprite_ext(sprLifeBar, 0, 15, _hudAlt, _escala, _escala, 0, c_white, 1);

draw_sprite_ext(sprStaminaBar, 0, 35, _hudAlt + _sprAlt, _escala, _escala, 0, c_white, 1);

if (_maxPoison > 0) {
	draw_sprite_ext(sprPoisonBar, 0, 35, _hudAlt + _sprAlt + _sprAlt2, _escala, _escala, 0, c_white, 1);
}


//Barra Cores
draw_sprite_ext(sprLifeColor, 15, 22 * _escala, _hudAlt, (_lifes/_maxLifes) * _escala, _escala, 0, c_white, 1);

draw_sprite_ext(sprStaminaColor, 0, 26 * _escala, _hudAlt + _sprAlt, (_stamina/_maxStamina) * _escala, _escala, 0, c_white, 1);

if (_maxPoison > 0) {
	draw_sprite_ext(sprPoisonColor, 0, 26 * _escala, _hudAlt + _sprAlt + _sprAlt2, (_poison/_maxPoison2) * _escala, _escala, 0, c_white, 1);
}

#endregion

#region Pause Gui
// Neste treco entra o GUI da tela de pause e seus menus respectivos !!

//Medidas da sprite de PAUSE !
var _sprDraw = sprPauseBoard;
var _escala2 = 3;
if _sprDraw == sprPauseBoard {
	_escala2 = 4;
}
var _sprWidht = sprite_get_width(_sprDraw) * _escala2;
var _sprHeight = sprite_get_height(_sprDraw) * _escala2;
var _x = (_guiLarg - _sprWidht) / 2;
var _y = (_guiAlt - _sprHeight) / 2;

if (_pause) {
	
	//Desenha a tela escura
	draw_set_alpha(0.5); // Defina a opacidade desejada (0 a 1, onde 0 é completamente transparente e 1 é completamente opaco)
	draw_set_color(c_black); // Defina a cor como preto
	draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Desenhe um retângulo preto que cobre a tela
	
	// Desenha a tela de PAUSE ! 
	draw_sprite_ext(_sprDraw, 0, _x, _y, _escala2, _escala2, 0, c_white, 1);
	
	// Desenha os textos dentros dos menus
	draw_set_alpha(1);
	draw_set_color(c_black);

	draw_set_font(fnTextoBase);
	draw_text_ext_transformed(_guiLarg/2, _guiAlt/2 + (-26 * _escala2), "Continuar", 10, 300, 2, 2, 0);

	
} else if (!_pause) {
	draw_set_alpha(1); // Restaura a opacidade padrão (opcional, dependendo do que você deseja fazer a seguir)
	draw_set_color(noone); // Restaura a cor padrão
}

#endregion


