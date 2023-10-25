/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
iconSave = 4;
iconMusic = 5;
iconSfx = 5;
iconClose = 4;
itemSelecionado = -1; // Verifica se selecionamos algum item
itemSelecionado2 = -1; // Verifica se selecionamos algum item
current_page = 1;

posSelecionado = -1; // Guarda a posição do item selecionado

mouseTimer = 0; // <-- Cria um delay para mover os items
doubleClick = 0; //<-- Clicar duas vezes em um item o consome

// Itens
coinSprites = [sprSilverCoin, sprSilverCoin, sprSilverCoin, sprGoldCoin];
coinLabels = [140, 190, 250, 0];

// Upgrades
coinSprites2 = [sprGoldCoin, sprGoldCoin, sprGoldCoin, sprGoldCoin];
coinLabels2 = [15, 18, 20, 35];

// Vendas
coinSprites3 = [sprGoldCoin, sprGoldCoin, sprGoldCoin, sprGoldCoin];
coinLabels3 = [10, 18, 40, 85];

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

gridState = 0;
gridItems2 = ds_grid_create(Infos.Altura, 18);
gridItems3 = ds_grid_create(Infos.Altura, 18);
gridItems = ds_grid_create(Infos.Altura, 18);
ds_grid_add_region(gridItems, 0, 0, 1, 18 - 1, -1);
ds_grid_add_region(gridItems2, 0, 0, 1, 18 - 1, -1);
ds_grid_add_region(gridItems3, 0, 0, 1, 18 - 1, -1);



scrDsGridProcess(Items.Life, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Stamina, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Poison, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Diamond, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Saphire, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Skull, 5); // <-- Adiciona item no inventario

scrDsGridAddItem(Items.Life, 1);
scrDsGridAddItem(Items.Poison, 1);
scrDsGridAddItem(Items.Diamond, 1);
scrDsGridAddItem(Items.Skull, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Life, 1);
scrDsGridAddItem(Items.Life, 1);

scrDsGridAddItem(Items.Life, 1);
scrDsGridAddItem(Items.Poison, 1);
scrDsGridAddItem(Items.Skull, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Skull, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Skull, 5); // <-- Adiciona item no inventario
scrDsGridAddItem(Items.Skull, 5); // <-- Adiciona item no inventario












