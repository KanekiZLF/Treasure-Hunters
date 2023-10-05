// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
// Metodo de utilização scrRecharge(5 (optional), 1 (optional), 2 (optional));
// +5 Pontos de vida, +1 Ponto de estamina, +2 Pontos de veneno
function scrRecharge() {
	/// @param      {int|real}   lifes
	/// @param      {int|real}   stamina
	/// @param      {int|real}   poison
	
	var _valueLifes = argument0;
	var _valueStamina = argument1;
	var _valuePoison = argument2;
	
	_valueLifes = (argument0 != undefined) ? argument0 : 0;
	_valueStamina = (argument1 != undefined) ? argument1 : 0;
	_valuePoison = (argument2 != undefined) ? argument2 : 0;
	
	
	if (global.lifes != objPlayer.maxLifes) {
		objPlayer.lifeCost += -_valueLifes;
	}
	
	if (global.stamina != objPlayer.maxStamina) {
		objPlayer.stamCost += -_valueStamina;
	}
	
	if (global.poison != objPlayer.maxPoison) {
		objPlayer.poisonCost += -_valuePoison;
	}
	
	global.lifes += _valueLifes;
	global.stamina += _valueStamina;
	global.poison += _valuePoison;
}