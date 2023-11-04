/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
//Variaveis de movimentação
velocidadeH = 0;
velocidadeV = 0;
velocidade  = 1;
gravidade   = 0.2;
direita = 1;
esquerda = 0;
cima = 0;
isEffect = false; //<-- Ativa ou desativa os efeitos de fumaça
isEffect2 = false;
tempoAndar = 30; // Tempo para volta a andar;
isJumping = false;
walk = true;
distLimit = 80; // <-- Distancia limite de perseguição
isFall = false;

// Variaveis de modificação
estado = scrFierceTooth;
direc = 0;
arraySprite = 0;
objColisParede = objParede; //<-- Define qual é o objeto de parede
isEffect = false;
barLife = false; // <-- Define se barra de vida aparece ou some

// Variaveis de combate
lifes = 5;
maxLifes = lifes;
dano = 1;
vision = 10;
perseg = false;
hit = false;
