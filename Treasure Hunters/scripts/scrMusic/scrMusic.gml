//Desenvolvido por Luiz F. R. Pimentel
// https://github.com/KanekiZLF para obter mais informações

function scrMusic() {
	scrMusicStopBG(); // <-- Para todas as musicas de fundo
	
	if (audio_group_is_loaded(audiogroup1)) {
		switch (room) {
			case rmInit:
				if (!audio_is_playing(sndTelaInicial)) {
					audio_play_sound(sndTelaInicial, 1, 1);
					global.music = 0;
				}
			break;
		
			case Fase1:
				if (!audio_is_playing(sndFaseInicial)) {
					audio_play_sound(sndFaseInicial, 1, 1);
					global.music = 1;
				}
			break;
		
			case Fase2:
				if (!audio_is_playing(sndFaseInicial2)) {
					audio_play_sound(sndFaseInicial2, 1, 1);
					global.music = 2;
				}
			break;
		}
	}
}

// Função de parar as musicas de fundo
function scrMusicStopBG() {
	audio_stop_sound(sndTelaInicial);
	audio_stop_sound(sndFaseInicial);
	audio_stop_sound(sndFaseInicial2);
}