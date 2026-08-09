audio_play_sound(snd_botoes, 1, false);

global.ganhei = false;

//Aumentando o level em 1
global.level_atual += 1;

//mandando ele pro destino
room_goto(destino[global.level_atual]);
