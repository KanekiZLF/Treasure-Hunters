/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
iconSave = 4;
iconMusic = 5;
iconSfx = 5;
iconClose = 4;
itemSelecionado = -1; // Verifica se selecionamos algum item
posSelecionado = -1; // Guarda a posição do item selecionado

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
	Nome,
	Altura
}

gridItems = ds_grid_create(Infos.Altura, 6);
ds_grid_add_region(gridItems, 0, 0, 1, 6 - 1, -1);

gridItems[# Infos.Item, 0] = Items.Life;
gridItems[# Infos.Quantidade, 0] = 5;
gridItems[# Infos.Nome, 0] = "Elixir de Cura";

gridItems[# Infos.Item, 1] = Items.Stamina;
gridItems[# Infos.Quantidade, 1] = 3;
gridItems[# Infos.Nome, 1] = "Elixir de Estamina";


gridItems[# Infos.Item, 2] = Items.Poison;
gridItems[# Infos.Quantidade, 2] = 99;
gridItems[# Infos.Nome, 2] = "Elixir Envenenado";


gridItems[# Infos.Item, 4] = Items.Diamond;
gridItems[# Infos.Quantidade, 4] = 4;
gridItems[# Infos.Nome, 4] = "Pedra de Diamante";

gridItems[# Infos.Item, 3] = Items.Diamond;
gridItems[# Infos.Quantidade, 3] = 4;
gridItems[# Infos.Nome, 3] = "Pedra de Diamante";

