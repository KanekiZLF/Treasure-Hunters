//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrRemoveItem() {
	// @param itemName*
    // Substitua "grid" pelo nome da sua grid
	
	var _itemName = argument0;
    var _grid = objGui.gridItems; // Substitua "grid_name" pelo nome da sua grid
	var _gridWidth = ds_grid_width(_grid);
	var _gridHeight = ds_grid_height(_grid);

    // Percorre todas as células da grid
    for (var xx = 0; xx < _gridWidth; xx++) {
        for (var yy = 0; yy < _gridHeight; yy++) {
           // Verifica se o índice x e y está dentro dos limites da grid
            if (xx >= 0 && xx < _gridWidth && yy >= 0 && yy < _gridHeight) {
                // Verifica se o item na célula atual é igual ao item desejado
                if (_grid[# xx, yy] == _itemName) {
                    // O item foi encontrado, retornamos true
                    _grid[# Infos.Quantidade, yy]--;
                }
			}
        }
    }

    // O item não foi encontrado em nenhuma célula da grid, retornamos false
    return false;
}