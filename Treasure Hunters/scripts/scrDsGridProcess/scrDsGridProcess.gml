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
				// Se o item não for para venda, ele adiciona no inventario
				if (!_itemSell) {
	                _quantidade++;
	                _grid[# Infos.Quantidade, yy] = _quantidade;
				} 
				
				if (_itemSell) {
					// Se o item estiver no inventario, ai vamos vende-lo
					var quantidade = _grid[# Infos.Quantidade, yy];
					var _priceItem = objGui.coinLabels3;
					if (quantidade > 0) {
			
						if (_itemToCompare == Items.Diamond) {
							global.coinsGold += _priceItem[0]
						} 
						
						if (_itemToCompare == Items.Saphire) {
							global.coinsGold += _priceItem[1]
						} 
						
						if (_itemToCompare == Items.Ruby) {
							global.coinsGold += _priceItem[2]
						} 
						
						if (_itemToCompare == Items.Skull) {
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
		var _itemDescricao;
        switch(_itemToCompare) {
            default: 
				_itemName = "Erro ao definir grid 2"; 
				_itemDescricao = "Erro ao definir descricao para o item: " + _itemName;
			break;
			
            case Items.Life: 
				_itemName = "Elixir de Cura"; 
				_itemDescricao = "Pocao incrivel restaura 2 Pontos de vida";
			break;
			
            case Items.Stamina: 
				_itemName = "Elixir de Estamina"; 
				_itemDescricao = "Pocao com gosto ruim, restaura 2 de estamina";
			break;
			
            case Items.Poison:
				_itemName = "Elixir Envenenado"; 
				_itemDescricao = "Pocao envenenada, te da uma habilidade aleatoria, Invisibilidade, Imunidade ou Velocidade ";
			break;
			
            case Items.Diamond: 
				_itemName = "Pedra de Diamante"; 
				_itemDescricao = "Joia linda, pode ser vendida no mercado !";
			break;
			
            case Items.Saphire: 
				_itemName = "Pedra de Safira";
				_itemDescricao = "Joia magnifica, pode ser vendida no mercado !";
			break;
			
            case Items.Ruby: 
				_itemName = "Pedra de Ruby"; 
				_itemDescricao = "Hum... Joia rarissima, pode ser vendida no mercado !";
			break;
			
			case Items.Skull: 
				_itemName = "Caveira de Ouro"; 
				_itemDescricao = "Parece que voce encontrou algo estranho. tente vende-lo no mercado !";
			break;
			
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
        _grid[# 3, _checagem] = _itemDescricao;
    }
}
