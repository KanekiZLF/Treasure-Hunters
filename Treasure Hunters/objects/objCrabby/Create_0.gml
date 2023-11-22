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
tempoAndar = 80; // Tempo para volta a andar;
distAttack = 40;
isJumping = false;
walk = true;
distLimit = 100; // <-- Distancia limite de perseguição
isFall = false;

// Variaveis de modificação
estado = scrCrabby;
direc = 0;
arraySprite = 2;
objColisParede = layer_tilemap_get_id("Paredes"); //<-- Define qual é o objeto de parede
isEffect = false;
barLife = false; // <-- Define se barra de vida aparece ou some

// Variaveis de combate
dano = 1;
vision = 10;
vision2 = 10;
perseg = false;
