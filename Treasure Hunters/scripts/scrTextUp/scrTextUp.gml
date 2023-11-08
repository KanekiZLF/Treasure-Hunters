//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrTextUp(){
	/// @param text,
	/// @param height,
	/// @param speed
	
	/// scrTextEffect(text, altura, velocidade)
	/// Cria um efeito de texto que sobe e diminui o alpha.

	var _text = argument0; // O texto a ser exibido
	var _maxHeight = argument1; // A altura máxima que o texto pode subir
	var _speed = argument2; // A velocidade de subida

	var obj = instance_create_layer(x, y, "Effects", objTextUp); // Crie um objeto de texto
	obj.texto = _text; // Defina o texto do objeto
	obj.alturaMaxima = _maxHeight; // Defina a altura máxima
	obj.velocidade = _speed; // Defina a velocidade

}