/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Variaveis da camera
posCamX = 0;
posCamY = 0;
camDirec = 3;
camDef = false;

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
isEffect = false; //<-- Ativa ou desativa os efeitos de fumaça

//Variaveis de modificação
estado = scrPlayer;
direc = 1; //<-- Define qual sprite usar
hit = false; //<-- Define sprite de piscando quando leva dano
isJumping = false; //<-- Define se estou pulando
isAttacking = false; //<-- Define se estou atacando
isAirAttacking = false; //<-- Define se esta atacando no ar
attack = true; //<-- Define um intervalo para atacar
attackCombo = -1; //<-- Define o combo de ataque
isFall = false; //<-- Define se estou caindo
isDead = false; //<-- Define se estou morto ou vivo
moveOn = true; //<-- Define se posso ou não andar
inimigos_atingidos = ds_list_create(); //<-- Cria uma lista
objColisParede = objParede; //<-- Define qual é o objeto de parede
arraySprite = 0; //<-- Define qual array de sprites ira usar
toThrow = false; //<-- Define se joguei ou não a espada
noTake = false; //<-- Impede de pegar a espada lançada até tocar na parede
dropSword = false; // <-- Solta espada quando morre
vision = 50;
stamCost = 0; // <-- Define o valor que custa para usar a habilidade
lifeCost = 0;
poisonCost = 0;


//Variaves de combate
danoAlpha = -1; //<-- Define o alpha para dar efeito de pisca
tomarDano = false; //<-- Define se posso tomar dano
empurrarDir = 0; //<-- Define a direcao que serei empurrado
dano = 1; //<-- Define o valor do dano que da no inimigo
maxLifes = 10;
maxStamina = 10;
maxPoison = 10;
global.lifes = maxLifes;
global.stamina = maxStamina;
global.poison = maxPoison;

//Variaveis das barras de cor
maxLifes2 = global.lifes;
maxStamina2 = global.stamina;
maxPoison2 = global.poison;
lifes2 = maxLifes2;
stamina2 = maxStamina2;
poison2 = maxPoison2;







