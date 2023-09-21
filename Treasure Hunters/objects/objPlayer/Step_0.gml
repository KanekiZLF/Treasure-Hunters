/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado) //<-- Executa script

if global.lifes <= 0 {
	isDead = true;
	velocidadeH = 0;
	alturaPulo = 0;
	global.gameover = true;
}

