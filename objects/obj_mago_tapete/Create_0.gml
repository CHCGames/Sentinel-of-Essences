#region Varíaveis

//Variavel de estados
estado = "parado";

//Variável de tempo de andar
tempo_andar = FPS;

//Variável de delei de andar
delei_andar = tempo_andar;

#endregion

#region Métodos

//Máquina de estados
maquina_estado = function()
{
    //Diminuindo o delei de andar
    delei_andar--;
    
    //Usando o switch
    switch (estado) 
    {
        //Caso ele esteja parado
    	case "parado":
            
            //Ele decide para qual estado ele vai
            estado = "andar";
            
        break;
    
        //Caso ele esteja andar
    	case "andar":
            
            //Pegando a direção do player
            var _direcao = point_direction(x, y, obj_player.x, obj_player.y);
            
            //Caso o tempo de andar acabe ele anda
            if(delei_andar <= 0)
            {
                //Pasando a minha direção
                direction = _direcao;
                
                //Se a minha direção ficar entre 135 e 225 graus
                if(direction > 135 and direction < 225)
                {
                    //ele troca de sprite
                    troca_sprite(spr_mago_tp_move_esquerda);
                    
                    //Ele anda para esquerda
                    x -= 16;
                }    
                else if(direction < 45 or direction > 315) //Se minha direção ficar entre 315 e 45 graus
                {
                    //Ele anda para direita
                    x += 16;
                }
                
                //Se a minha direção ficar entre 135 e 45 graus
                if(direction < 135 and direction > 45)
                {
                    //Ele anda para cima
                    y -= 16;
                }    
                else if(direction < 315 and direction > 225) //Se minha direção ficar entre 225 e 315 graus
                {
                    //Ele anda para baixo
                    y += 16;
                }
                
                //Restando o delei
                delei_andar = tempo_andar;
            }
            
            x = clamp(x, 24, 232);
            
        break;
    }
}
#endregion