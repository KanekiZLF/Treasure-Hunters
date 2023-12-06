/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Variaveis de definição
floatSpeed = .2; // <-- Velocidade de flutuação
float = false; // <-- Define se pode ou não flutuar
hight = 5; // <-- Altura maxima de flutuação

// Variaveis de colisão
velocidadeV = 0;
velocidadeH = 0;
velocidade = 1;
gravidade = .2;
direita = 0;
esquerda = 0;
cima = 0;
inWall = false;
objColisParede = layer_tilemap_get_id("Paredes");
vision = 7; // <-- Define um raio para saber qual distancia a espada esta do chão
wasCollected = false;





