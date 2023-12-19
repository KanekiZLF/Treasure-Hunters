// Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrVerificationSave() {
	// Este script tem como finalidade carregar as informações no arrays e repassar para que elas não sejam substituidas
    var _file = "";

    switch(global.save) {
        default:
            show_message("Nenhum save selecionado !");
            break;

        case 1:
            _file = "saveData0.dat";
            break;

        case 2:
            _file = "saveData1.dat";
            break;

        case 3:
            _file = "saveData2.dat";
            break;
    }

    if (file_exists(_file)) {
        var _buffer = buffer_load(_file);

        if (_buffer != -1) {
            var _string = buffer_read(_buffer, buffer_string);
            buffer_delete(_buffer);

            var _loadData = json_parse(_string);

            // Loop para ambos os arrays dentro de _loadData
            for (var arrayIndex = 0; arrayIndex < array_length(_loadData); arrayIndex++) {
                var _currentArray = _loadData[arrayIndex];

                // Verificar se cada item ainda existe na sala antes de aplicar as alterações
                for (var i = 0; i < array_length(_currentArray); i++) {
                    var _loadEntity = _currentArray[i];
					
                    // Verifica o tipo de entidade (0: baú, 1: chave, 2: SaveMe)
                    switch (arrayIndex) {
                        case 0: // Baú
							array_push(global.savedItems[0], _loadEntity);
                        break;

                        case 1: // Chave
							array_push(global.savedItems[1], _loadEntity);
                        break;

                        case 2: // SaveMe
                            
						break;
                    }
                }
            }
        } else {
            show_message("Erro ao carregar o buffer do arquivo.");
        }
    }
}
