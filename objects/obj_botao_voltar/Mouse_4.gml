//Caso ele tenha pausado jogo
if(global.game_pause)
{
    //Então ele rseta a room
    room_restart();
    
    //Ele despausa o jogo
    global.game_pause = false;
    
    //Ele restaura a vida do player
    global.vida_player = global.moldura_vida;
}
else 
{
     //mandando ele pro destino
     room_goto(destino);
}
