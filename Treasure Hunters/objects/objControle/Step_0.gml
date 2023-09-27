/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (global.screenShakeIntensity > 0) {
    var intensity = global.screenShakeIntensity;
    view_xview[0] = random_range(-intensity, intensity);
    view_yview[0] = random_range(-intensity, intensity);
    
    // Reduza a intensidade da trepidação gradualmente
    global.screenShakeIntensity -= 1;
}
else {
    // Se a intensidade da trepidação for zero, volte a tela para a posição normal
    view_xview[0] = 0;
    view_yview[0] = 0;
}







