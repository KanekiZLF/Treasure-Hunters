// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDsGridProcess() {
	///@param *item
	///@param quantidade
	///@param venda
	
    var _grid = objGui.gridItems;
    var _itensShop = [Items.Life, Items.Stamina, Items.Poison, Items.Diamond, Items.Saphire, Items.Ruby, Items.Skull];
    var gridSizeX = ds_grid_width(_grid); 
    var gridSizeY = ds_grid_height(_grid);
    var _itemToCompare = _itensShop[argument0];
	var _quantidade = (argument1 != undefined) ? argument1 : 1;
	var _itemSell = (argument2 != undefined) ? argument2 : false;

    // Verifica se o item ja existe no inventario
    var itemAdded = false;
    for (var xx = 0; xx < gridSizeX; xx++) {
        for (var yy = 0; yy < gridSizeY; yy++) {
            var cellValue = _grid[# Infos.Item, yy];
			
            if (cellValue == _itemToCompare) {
				var quantidade = _grid[# Infos.Quantidade, yy];
				// Se o item não for para venda, ele adiciona no inventario
				if (!_itemSell) {
	                quantidade++;
	                _grid[# Infos.Quantidade, yy] = quantidade;
				} 
				
				if (_itemSell) {
					// Se o item estiver no inventario, ai vamos vende-lo
					var _priceItem = objGui.coinLabels3;
					if (quantidade > 0) {
						scrPrint(cellValue);
						
						if (Items.Diamond) {
							global.coinsGold += _priceItem[0]
						} else if (Items.Saphire) {
							global.coinsGold += _priceItem[1]
						} else if (Items.Ruby) {
							global.coinsGold += _priceItem[2]
						} else if (Items.Skull) {
							global.coinsGold += _priceItem[3]
						}
						
						quantidade--;
						_grid[# Infos.Quantidade, yy] = quantidade;
					}
				}
                itemAdded = true;
                break; // Encerra o loop
            }
        }
        if (itemAdded) break;
    }

    // Se o item não existir, ele cria
    if (!itemAdded && !_itemSell) {
        var _itemName;
        switch(_itemToCompare) {
            default: _itemName = "Erro ao definir grid 2"; break;
            case Items.Life: _itemName = "Elixir de Cura"; break;
            case Items.Stamina: _itemName = "Elixir de Estamina"; break;
            case Items.Poison: _itemName = "Elixir Envenenado"; break;
            case Items.Diamond: _itemName = "Pedra de Diamante"; break;
            case Items.Saphire: _itemName = "Pedra de Safira"; break;
            case Items.Ruby: _itemName = "Pedra de Ruby"; break;
			case Items.Skull: _itemName = "Caveira de Ouro"; break;
        }
        var _sprite = sprItems;

        // Verifica quais slots estão vazios
        var _checagem = 0;
        while _grid[# Infos.Item, _checagem] != -1 {
            _checagem++;
        }

        // Adiciona dentro do grid
        _grid[# 0, _checagem] = _itemToCompare;
        _grid[# 1, _checagem] = _quantidade;
        _grid[# 2, _checagem] = _itemName;
        _grid[# 3, _checagem] = _sprite;
    }
}
