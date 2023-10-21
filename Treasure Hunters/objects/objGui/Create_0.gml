/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
iconSave = 4;
iconMusic = 5;
iconSfx = 5;
iconClose = 4;

// Itens e Upgrades
coinSprites = [sprSilverCoin, sprGoldCoin, sprGoldCoin, sprGoldCoin];
coinLabels = [111, 222, 333, 0];

coinSprites2 = [sprGoldCoin, sprSilverCoin, sprGoldCoin, sprGoldCoin];
coinLabels2 = [444, 555, 666, 777];

coinSprites3 = [sprGoldCoin, sprSilverCoin, sprGoldCoin, sprGoldCoin];
coinLabels3 = [444, 555, 666, 777];

enum Items {
	Life,
	Stamina,
	Poison,
	Diamond,
	Saphire, 
	Ruby,
	Skull,
	Altura
}

enum Infos {
	Item,
	Quantidade,
	Altura
}

gridItems = ds_grid_create(Infos.Altura, 6);
ds_grid_add_region(gridItems, 0, 0, 1, 6 - 1, -1);

gridItems[# Infos.Item, 0] = Items.Life;
gridItems[# Infos.Quantidade, 0] = 3;

gridItems[# Infos.Item, 1] = Items.Stamina;
gridItems[# Infos.Quantidade, 0] = 3;

gridItems[# Infos.Item, 2] = Items.Poison;
gridItems[# Infos.Quantidade, 0] = 3;

gridItems[# Infos.Item, 3] = Items.Life;
gridItems[# Infos.Quantidade, 0] = 3;

gridItems[# Infos.Item, 5] = Items.Diamond;
gridItems[# Infos.Quantidade, 0] = 4;
