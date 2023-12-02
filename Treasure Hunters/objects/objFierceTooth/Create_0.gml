/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited();
//Variaveis de movimentação
velocidadeH = 0;
velocidadeV = 0;
velocidade  = 1;
gravidade   = 0.2;
direita = 0;
esquerda = 1;
cima = 0;
isEffect = false; //<-- Ativa ou desativa os efeitos de fumaça
isEffect2 = false;
tempoAndar = 30; // Tempo para volta a andar;
isJumping = false;
walk = true;
distLimit = 100; // <-- Distancia limite de perseguição
distAttack = 30;
isFall = false;
dialog = false;
canFall = false;

// Variaveis de modificação
estado = scrFierceTooth;
direc = 0;
arraySprite = 0;
objColisParede = layer_tilemap_get_id("Paredes"); //<-- Define qual é o objeto de parede
isEffect = false;
barLife = false; // <-- Define se barra de vida aparece ou some

// Variaveis de combate
dano = 1;
vision = 10;
perseg = false;
