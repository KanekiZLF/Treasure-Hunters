/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Atualize a posição do texto
y -= velocidade;

// Atualize a opacidade do texto
alpha -= 0.02; // Ajuste o valor conforme necessário para controlar a taxa de desaparecimento

// Verifique se o texto deve ser destruído
if (alpha <= 0) {
    instance_destroy();
}

// Verifique se o texto ultrapassou a altura máxima
/*if (y < -alturaMaxima) {
    instance_destroy(); // Destrua o objeto quando ele subir o suficiente
}







