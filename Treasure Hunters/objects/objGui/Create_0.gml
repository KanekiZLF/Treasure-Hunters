/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
iconSave = 4;
iconMusic = 5;
iconSfx = 5;
iconClose = 4;
itemSelecionado = -1; // Verifica se selecionamos algum item
itemSelecionado2 = -1; // Verifica se selecionamos algum item

posSelecionado = -1; // Guarda a posição do item selecionado

mouseTimer = 0; // <-- Cria um delay para mover os items
doubleClick = 0; //<-- Clicar duas vezes em um item o consome

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

scrDsGridAddItem(Items.Life, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Stamina, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Poison, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Diamond, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Life, 5); // <-- Adiciona item no inventario



