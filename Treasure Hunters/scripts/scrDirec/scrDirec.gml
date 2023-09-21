// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDirec(){
	//Sprites
	switch direc{
		case 0:
			scrChangeSprite(sprPlayerIdle); //<-- Direita
			image_xscale = 1;
		break;
		
		case 1:
			scrChangeSprite(sprPlayerIdle); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 2:
			scrChangeSprite(sprPlayerRun); //<-- Direita
			image_xscale = 1;
		break;
		
		case 3:
			scrChangeSprite(sprPlayerRun); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 4:
			scrChangeSprite(sprPlayerSwordAtack1); //<-- Direita
			mask_index = sprPlayerSwordAtack1;
			image_xscale = 1;
		break;
		
		case 5:
			scrChangeSprite(sprPlayerSwordAtack1); //<-- Esquerda
			mask_index = sprPlayerSwordAtack1;
			image_xscale = -1;
		break;
		
		case 6:
			scrChangeSprite(sprPlayerJump); //<-- Direita
			image_xscale = 1;
		break;
		
		case 7:
			scrChangeSprite(sprPlayerJump); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 8:
			scrChangeSprite(sprPlayerFall); //<-- Direita
			image_xscale = 1;
		break;
		
		case 9:
			scrChangeSprite(sprPlayerFall); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 10:
			scrChangeSprite(sprPlayerGround); //<-- Direita
			image_xscale = 1;
		break;
		
		case 11:
			scrChangeSprite(sprPlayerGround); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 12:
			scrChangeSprite(sprPlayerDead); //<-- Direita
			image_xscale = 1;
		break;
		
		case 13:
			scrChangeSprite(sprPlayerDead); //<-- Esquerda
			image_xscale = -1;
		break;
		
		case 14:
			scrChangeSprite(sprPlayerHit); //<-- Direita
			image_xscale = 1;
		break;
		
		case 15:
			scrChangeSprite(sprPlayerHit);  //<-- Esquerda
			image_xscale = -1;
		break;
	}
}