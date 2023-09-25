// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrFimAnimacao23(){
/// scrFimAnimacao23(sprite_index, image_index)
// Use este script para verificar se a animação atingiu o fim.
// Argumentos:
// - sprite_index: o índice do sprite que você deseja verificar.
// - image_index: o índice do quadro atual.

var _sprite = argument0;
var _image = argument1;

// Verifica se a animação atingiu o último quadro
var isAnimationEnd = (_image == sprite_get_number(_sprite) - 1);

return isAnimationEnd;

}