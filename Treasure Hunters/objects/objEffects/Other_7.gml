/// @description Controla o fim das animaçoes
// Você pode escrever seu código neste editor
	//Controla oque sera feito ao fim da animação dos efeitos
if (
    // Efeitos de Fumaça
    sprite_index == sprJumpDust || 
    sprite_index == sprFallDust || 
    sprite_index == sprRunDust || 
    // Efeitos de diálogo
    sprite_index == sprDialogueInterogation || 
    sprite_index == sprDialogueExclamation || 
    sprite_index == sprDialogueDead ||
    // Efeitos de itens coletáveis
    sprite_index == sprDiamondEffect || 
    sprite_index == sprCoinEffect || 
    sprite_index == sprMapOutEffect || 
    sprite_index == sprMapInEffect || 
    sprite_index == sprPotionEffect || 
    sprite_index == sprSkullEffect
)
{
    image_index = image_number - 1;
    instance_destroy();
}
