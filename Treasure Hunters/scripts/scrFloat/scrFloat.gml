// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

//Script Flutuação vertical
function scrFloat() {
	
// Verifica se as variaveis existem, se não existir, as cria com valores padrão
	if !variable_instance_exists(id, "initialPositionY") {
	    initialPositionY = y;
	}
	
	if !variable_instance_exists(id, "floatSpeed") {
	    floatSpeed = 1;
	}
	
	if !variable_instance_exists(id, "position") {
	    position = 0;
	}
	
	if !variable_instance_exists(id, "hight") {
	    hight = 12;
	}
	
// Inicia a aniação
	if (position == 0) // Direção inicial para cima
	{
	    y -= floatSpeed;
	    if (y <= initialPositionY - hight) // Altura máxima de flutuação
	    {
	        position = 1; // Alterna a direção para baixo
	    }
	}
	else // Direção inicial para baixo
	{
	    y += floatSpeed;
	    if (y >= initialPositionY + hight) // Altura mínima de flutuação
	    {
	        position = 0; // Alterna a direção para cima
	    }
	}
}