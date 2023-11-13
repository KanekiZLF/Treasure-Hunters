/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
for (var i = 0; i < instance_number(objItens); i++) {
	var _inst = instance_find(objItens, i);
		sprite = _inst.sprite;
}

if (instance_exists(objSaveMe)) {
    for (var i = 0; i < instance_number(objSaveMe); i++) {
        var _inst = instance_find(objSaveMe, i);

        // Verifica se a instância tem a variável antes de adicioná-la
        if (!variable_instance_exists(_inst, "sprite")) {
            _inst.sprite = sprite;
        }
    }
}





