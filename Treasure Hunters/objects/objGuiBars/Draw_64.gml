/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _escala = 3;
var _guiAlt = display_get_gui_height();
var _guiLarg = display_get_gui_width();
var _sprAlt = sprite_get_height(sprLifeBar) * _escala;
var _hudAlt = _guiAlt/15;

var _lifes = global.lifes
var _maxLifes = objPlayer.maxLifes;

//Hud
draw_sprite_ext(sprLifeBar, 0, 15, _hudAlt, _escala, _escala, 0, c_white, 1)

//Barra Vida
draw_sprite_ext(sprLifeColor, 15, 22*_escala, _hudAlt, (_lifes/_maxLifes) * _escala, _escala, 0, c_white, 1)

//Barra Estamina





