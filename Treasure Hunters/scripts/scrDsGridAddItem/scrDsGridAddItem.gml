// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF
function scrDsGridAddItem() {
	///@arg item
	///@arg quantidade
	///@arg nome
	///@arg (sprite optional)
	
	var _grid = objGui.gridItems;
	var _checagem = 0;
	var _item = argument[0]
	var _quantidade = argument[1];
	var _itemName = argument[2];

	
	while _grid[# Infos.Item, _checagem] != -1 {
		_checagem++;
	}
	
	if (argument[2] == undefined) {
		switch(argument[0]) {
			default:
				show_message("Erro ao definir grid 2");
			break;
		
			case Items.Life:
				_itemName = "Elixir de Cura";
			break
			
			case Items.Stamina:
				_itemName = "Elixir de Estamina";
			break
			
			case Items.Poison:
				_itemName = "Elixir Envenenado";
			break
			
			case Items.Diamond:
				_itemName = "Pedra de Diamante";
			break
			
			case Items.Saphire:
				_itemName = "Pedra de Safira";
			break
			
			case Items.Ruby:
				_itemName = "Pedra de Ruby";
			break
			
			case Items.Skull:
				_itemName = "Caveira de oOuro";
			break
		}
	} else {
		_itemName = argument[2];
	}
	
	var _sprite = (argument[3] != undefined) ? argument[3] : sprItems;
	
	_grid[# 0, _checagem] = _item;
	_grid[# 1, _checagem] = _quantidade;
	_grid[# 2, _checagem] = _itemName;
	_grid[# 3, _checagem] = _sprite;
}