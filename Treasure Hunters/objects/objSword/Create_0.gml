/// @description Variaveis aqui !
// Você pode escrever seu código neste editor
// Variaveis da camera
posCamX = 0; //<-- Armazena a posição atual da camera no momento em que a espada é lançada
posCamY = 0;
camDirec = 0; // <<-- Define a direção em que a camera ira tremer
camDef = false; // <-- Após a camera armazenar as posições X, Y, fica true, para não fica alterando as posições
camDef2 = false; // <-- mesma coisa do acima

// Variaveis de definição
floatSpeed = .2; // <-- Velocidade de flutuação
float = true; // <-- Define se pode ou não flutuar
hight = 5; // <-- Altura maxima de flutuação
direc = 0; // <-- Define qual sprite utilizar de acordo com o numero
toThrow = false; // <-- Define se a espada foi lançada ou não
efeito = false; // <-- Cria efeito de fumaça
autoDestroy = false; // <-- Se auto destroi se for true
isSpeed = 0; // <-- Armazena a velocidade em que a espada foi lançada

// Variaveis de colisão
velocidadeV = 0;
velocidadeH = 0;
velocidade = 1;
gravidade = .2;
objColisParede = objParede;
vision = 7; // <-- Define um raio para saber qual distancia a espada esta do chão

//Variaveis de controle de pause
isPaused = false; // <-- Define se o jogo esta pausado ou não !