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
pulo = -4;
alturaPulo = pulo;
doubleJump = 0;

//Variaveis de modificação
estado = scrPlayer;
direc = 1; //<-- Define qual sprite usar
isJumping = false; //<-- Define se estou pulando
isAttacking = false; //<-- Define se estou atacando
attack = true; //<-- Define se posso atacar
isFall = false; //<-- Define se estou caindo
isDead = false; //<-- Define se estou morto ou vivo
moveOn = true; //<-- Define se posso ou não andar
inimigos_atingidos = ds_list_create(); //<-- Cria uma lista
objColisParede = objParede; //<-- Define qual é o objeto de parede

//Variaves de combate
danoAlpha = -1; //<-- Define o alpha para dar efeito de pisca
tomarDano = true; //<-- Define se posso tomar dano
empurrarDir = 0; //<-- Define a direcao que serei empurrado
dano = 1; //<-- Define o valor do dano que da no inimigo
global.lifes = 3;
