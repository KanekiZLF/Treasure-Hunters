/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrCollision();

if (instance_exists(objPlayer)) {
	if (instance_place(x, y, objPlayer)) {
		
		if (keyboard_check_pressed(ord("F")) && scrFindItem(Items.Key) && !isOpen) {
			sprite_index = sprChestOpen;
			isOpen = true;
			scrRemoveItem(Items.Key);
		}
	}
}

if (sprite_index == sprChestOpen && image_index == 2) {
	var _padLock = instance_create_layer(x, y, "Enemys", objPadLock);
		_padLock.image_xscale = 1 * objPlayer.image_xscale;
		_padLock.velocidadeV = -2;
		_padLock.velocidadeH = 2 * _padLock.image_xscale;
}
