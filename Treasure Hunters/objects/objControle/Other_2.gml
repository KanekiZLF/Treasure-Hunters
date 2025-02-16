/// @description Inicia as variaveis globais
// Você pode escrever seu código neste editor
//Inicia os grupos de audio
if !audio_group_is_loaded(audiogroup1)
{
	audio_group_set_gain(audiogroup1, volumeMusic, 0);
    audio_group_load(audiogroup1);
	audio_group_load(audiogroup2);
}
global.music = 0; // Define qual musica esta sendo tocada
global.hoverSound = false; // <-- Define o som do hover
global.lifes = 10; // Define a quantidade de vidas inicial
global.stamina = 10; // Define a quantidade de estamina inicial
global.poison = 0; // <-- Define o tempo em que o player fica envenedado
global.gameover = false; // <-- Define se suas vidas chegaram a zero ou não
global.option = 7; // <-- Define qual tela de menu usar
global.save	= 1; // <-- Define qual save esta sendo usado
global.cameraActive = true; // <-- Ativa ou desativa a camera do PLAYER !!
global.gamepause = true; // <-- Define se o jogo esta pausado ou não
global.isLoading = false;
global.fullScreen = false;
global.inventory = false;
global.coinsSilver = 180;
global.coinsGold = 0;
global.coinsDiamond = 0;
global.coinsSaphire = 0;
global.coinsRuby = 0;
global.upgradeLifes = 0;
global.upgradeStam = 0;
global.upgradeDano = 0;
global.upgradeVeneno = 0;
global.upgPrice0 = 0;
global.upgPrice1 = 0;
global.upgPrice2 = 0;
global.upgPrice3 = 0;
global.savedItems = [];
global.savedItems[0] = array_create(0, 0);
global.savedItems[1] = array_create(0, 0);
global.savedItems[2] = array_create(0, 0);
global.savedItems[3] = array_create(0, 0);
scrVerificationSave();