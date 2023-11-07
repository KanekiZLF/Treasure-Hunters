/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
scrCollision();

// Define a variável vision e vision2 e limita o campo de visão até 20
visionX = clamp(visionX, 0, 100);
visionY = clamp(visionY, 0, 100);

// Verifica a colisão com as linhas de visão
var _lineWallX = collision_line(x, y - 10, x + (visionX * image_xscale), y - 10, objColisParede, false, true);
var _lineWallY = collision_line(x, y - 10, x, y + visionY, objColisParede, false, true);

// Se houver colisão, diminui a visão
if (_lineWallX) {
    visionX--;
}

if (_lineWallY) {
    visionY--;
}

// Se não houver colisão, aumenta a visão
if (!_lineWallX) {
    visionX++;
}

if (!_lineWallY) {
    visionY++;
}

if (_lineWallX && visionX <= 6) {
	velocidadeH = -1 * image_xscale;
	velocidadeV = -.5;

} else if (!_lineWallX && visionX == 15) { 
	velocidadeH = 0;
	velocidadeV = 0;
}

if (!_lineWallX && velocidadeH != 0 && visionX > 15) {
	velocidadeH = 1 * image_xscale;
	if visionY == 3 {
		velocidadeV = -.6;
	}
	if wait("timerH", .5) {
		velocidadeH = 0;
		velocidadeV = 0;
	}
}
