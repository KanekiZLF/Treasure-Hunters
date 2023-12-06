/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (room_previous(Fase2) && room != Fase2) {
	x = 81;
	y = 445;
	room_goto(Fase2)
}

if (room_previous(room) == Fase1 && room != Fase1) {
	x = 680;
	y = 440;
    room_goto(Fase1);
}





