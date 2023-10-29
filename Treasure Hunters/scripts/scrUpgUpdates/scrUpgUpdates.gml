// Script desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF

// Função para atualizar a vida
function upgradeLife() {
    global.upgradeLifes++;
    var newValue = objPlayer.upgradeLifes[global.upgradeLifes];
    objPlayer.maxLifes = newValue;
    global.lifes = newValue;
}

// Função para atualizar a stamina
function upgradeStamina() {
    global.upgradeStam++;
    var newValue = objPlayer.upgradeStam[global.upgradeStam];
    objPlayer.maxStamina = newValue;
    global.stamina = newValue;
}

// Função para atualizar resistência ao veneno
function upgradeVenenoResist() {
    global.upgradeVeneno++;
    var newValue = objPlayer.upgradeRestVeneno[global.upgradeVeneno];
    objPlayer.restPoison = newValue;
}

// Função para atualizar dano
function upgradeDamage() {
    global.upgradeDano++;
    objPlayer.dano = objPlayer.upgradeDano[global.upgradeDano];
}
