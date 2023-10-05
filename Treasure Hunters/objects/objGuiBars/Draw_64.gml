/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
var _maxPoison = objPlayer.maxPoison2;  // <-- Veneno count

//Hud
draw_sprite_ext(sprLifeBar, 0, 15, _hudAlt, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(sprStaminaBar, 0, 35, _hudAlt + _sprAlt, _escala, _escala, 0, c_white, 1);
draw_sprite_ext(sprPoisonBar, 0, 35, _hudAlt + _sprAlt + _sprAlt2, _escala, _escala, 0, c_white, 1);


//Barra Cores
draw_sprite_ext(sprLifeColor, 15, 22 * _escala, _hudAlt, (_lifes/_maxLifes) * _escala, _escala, 0, c_white, 1);
draw_sprite_ext(sprStaminaColor, 0, 26 * _escala, _hudAlt + _sprAlt, (_stamina/_maxStamina) * _escala, _escala, 0, c_white, 1);
draw_sprite_ext(sprPoisonColor, 0, 26 * _escala, _hudAlt + _sprAlt + _sprAlt2, (_poison/_maxPoison) * _escala, _escala, 0, c_white, 1);






