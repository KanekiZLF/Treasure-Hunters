/// @description Destroi o obj ao fim
// Você pode escrever seu código neste editor

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
    sprite_index == sprSkullEffect	||
	sprite_index == sprChestKeyEffect
)
{
    image_index = image_number - 1;
    instance_destroy();
}
