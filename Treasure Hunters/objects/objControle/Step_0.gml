global.lifes = clamp(global.lifes, 0, objPlayer.maxLifes)
global.stamina = clamp(global.stamina, 0, objPlayer.maxStamina)
global.poison = clamp(global.poison, 0, objPlayer.maxPoison)

scrPrint(global.gamepause);