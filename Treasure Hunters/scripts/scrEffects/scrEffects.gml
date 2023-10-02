// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrEffects(){
	var spriteMap = [
	//Efeitos de fumaça
		sprJumpDust, // 0: <-- Direita
		sprJumpDust, // 1: <-- Esquerda
		sprFallDust, // 2: <-- Direita
		sprFallDust, // 3: <-- Esquerda
		sprRunDust,  // 4: <-- Direita
		sprRunDust,  // 5: <-- Esquerda
	//Efeitos de dialogo
		sprDialogueInterogation, // 6:
		sprDialogueExclamation,  // 7:
		sprDialogueDead,		 // 8:
	//Efeitos de itens coletaveis
		sprDiamondEffect,	// 9:
		sprCoinEffect,		// 10:
		sprMapOutEffect,	// 11:
		sprMapInEffect,		// 12:
		sprSkullEffect,		// 13:
		sprPotionEffect,	// 14:
		sprChestKeyEffect,	// 15:
	]
	
	if(!variable_instance_exists(id, "spriteIndex")){
		spriteIndex = string;
	}
	
	// Defina a imagem_xscale com base na direção
    image_xscale = (direc % 2 == 0) ? 1 : -1;
	
	spriteIndex = spriteMap[direc]
	
	scrChangeSprite(spriteIndex)
}