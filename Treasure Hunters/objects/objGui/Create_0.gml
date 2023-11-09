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
coinLabels = [180, 250, 350, 0];

// Upgrades

coinSprites2 = [sprGoldCoin, sprGoldCoin, sprGoldCoin, sprGoldCoin];
coinLabels2[0] = 15;
coinLabels2[1] = 18;
coinLabels2[2] = 20;
coinLabels2[3] = 35;

// Vendas
coinSprites3 = [sprGoldCoin, sprGoldCoin, sprGoldCoin, sprGoldCoin];
coinLabels3 = [10, 18, 26, 55];

enum Items {
	Life,
	Stamina,
	Poison,
	Diamond,
	Saphire, 
	Ruby,
	Skull,
	Key,
	Altura
}

enum Infos {
	Item,
	Quantidade,
	Nome,
	Descricao,
	Altura
}

gridItems2 = ds_grid_create(Infos.Altura, 18);
gridItems = ds_grid_create(Infos.Altura, 18);

ds_grid_add_region(gridItems, 0, 0, 1, 18 - 1, -1);
ds_grid_add_region(gridItems2, 0, 0, 1, 18 - 1, -1);

/*
scrDsGridProcess(Items.Life, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Stamina, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Poison, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Diamond, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Saphire, 5); // <-- Adiciona item no inventario
scrDsGridProcess(Items.Ruby, 5); // <-- Adiciona item no inventario

scrDsGridAddItem(Items.Skull, 30); // <-- Adiciona item no

















