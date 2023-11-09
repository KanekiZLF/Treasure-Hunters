/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrCollision();
randomize();
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

if (sprite_index == sprChestOpen && image_index == 6) {
	coinValue = irandom_range(0, 4);
		var _quantSilver = irandom(500);
		var _quantGold = irandom(35);
		var _quantDiamond = irandom_range(1, 5);
		var _quantSaphire = irandom_range(1, 3);
		var _quantRuby= irandom_range(1, 2);
		
	switch(coinValue) {

		case 0:
			_quantGold = irandom(10);
			scrCoinColected("silver", _quantSilver);
			scrCoinColected("gold", _quantGold);
		break;
	
		case 1:
			scrCoinColected("gold", _quantGold);
		break;
	
		case 2:
			scrCoinColected("diamond", _quantDiamond);
			scrDsGridProcess(Items.Diamond, _quantDiamond);
		break;
	
		case 3:
			scrCoinColected("saphire", _quantSaphire);
			scrDsGridProcess(Items.Saphire, _quantSaphire);
		break;
	
		case 4:
			scrCoinColected("ruby", _quantRuby);
			scrDsGridProcess(Items.Ruby, _quantRuby);
		break;
	}
}