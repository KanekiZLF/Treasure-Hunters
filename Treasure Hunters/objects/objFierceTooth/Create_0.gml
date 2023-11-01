/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Variaveis de movimentação
velocidadeH = 0;
velocidadeV = 0;
velocidade  = 2;
gravidade   = 0.2;
direita = 0;
esquerda = 0;
cima = 0;
doubleJump = 0;
isEffect = false; //<-- Ativa ou desativa os efeitos de fumaça
isSpeed = 0;

// Variaveis de modificação
estado = scrFierceTooth;
direc = 0;
arraySprite = 0;
objColisParede = objParede; //<-- Define qual é o objeto de parede

// Variaveis de combate
lifes = 5;
dano = 1;