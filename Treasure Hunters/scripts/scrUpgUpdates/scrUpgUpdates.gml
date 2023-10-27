// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

// Função para atualizar a vida
function upgradeLife() {
    objControle.upgradeLifes++;
    var newValue = objPlayer.upgradeLifes[objControle.upgradeLifes];
    objPlayer.lifes2 = newValue;
    objPlayer.maxLifes2 = newValue;
    objPlayer.maxLifes = newValue;
    global.lifes = newValue;
}

// Função para atualizar a stamina
function upgradeStamina() {
    objControle.upgradeStam++;
    var newValue = objPlayer.upgradeStam[objControle.upgradeStam];
    objPlayer.stamina2 = newValue;
    objPlayer.maxStamina2 = newValue;
    objPlayer.maxStamina = newValue;
    global.stamina = newValue;
}

// Função para atualizar resistência ao veneno
function upgradeVenenoResist() {
    objControle.upgradeVeneno++;
    var newValue = objPlayer.upgradeRestVeneno[objControle.upgradeVeneno];
    objPlayer.restPoison = newValue;
}

// Função para atualizar dano
function upgradeDamage() {
    objControle.upgradeDano++;
    objPlayer.dano = objPlayer.upgradeDano[objControle.upgradeDano];
}
