// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function toThrowSword() {
    // Verifica se a animação do jogador chegou ao fim
	
    if (scrFimAnimacao(objPlayer.sprite_index, objPlayer.image_index)) {
        // Determina a posição do novo objeto de espada
		
        var sword_x = objPlayer.x + (objPlayer.image_xscale == 1 ? 15 : -15);
        var sword_y = objPlayer.y - 2.5;

        // Cria a nova espada
        var _newSword = instance_create_layer(sword_x, sword_y, "BackItens", objSword);

        // Define as propriedades da nova espada
        _newSword.speed = objPlayer.image_xscale * 4;
        _newSword.direc = (objPlayer.image_xscale == 1) ? 2 : 3;
		_newSword.toThrow = true;
		_newSword.float = false;
		_newSword.autoDestroy = true;
		_newSword.damage = true;
    }
}
