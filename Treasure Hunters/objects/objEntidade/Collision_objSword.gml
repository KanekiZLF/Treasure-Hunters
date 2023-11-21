/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Colisão com objSword
if (instance_exists(objSword)) {
    var _instSword = instance_place(x, y, objSword);
    
    // Verifica se _instSword é uma instância válida de objSword antes de acessar suas propriedades
    if (_instSword != noone && !hit && _instSword.damage) {
        lifes -= 3;
        alarm[1] = 15;
        hit = true;
    }
}




