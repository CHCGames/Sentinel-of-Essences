//Se sair do jogo for falso
if(sair_jogo == false) 
{
    audio_play_sound(snd_botoes, 1, false);
    
    //Chamando Transição
    cria_transicao_inicia(destino);
}  
else //Ao contrario
{
    //Saindo do Jogo
    game_end();
}    

