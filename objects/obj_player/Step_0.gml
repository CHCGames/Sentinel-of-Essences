//Pausando
if(global.game_pause == true) exit;

//Aplicando o movimento
movimento();

//Aplicando a máquina de estados
maquina_estado();

//Aplicando o toma dano
toma_dano()
