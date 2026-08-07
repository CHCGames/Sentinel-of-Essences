#region Varíaveis

//Variavel de estados
estado = "parado";

//Variável de tempo de andar
tempo_andar = FPS;

//Variável de delei de andar
delei_andar = tempo_andar;

//Criando array de coliões de movimento
colisoes = [obj_arvore, obj_tronco_lados, obj_tronco_vertical, obj_pedra];

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
                    //Caso tenha algo na frente dele
                    if(place_meeting(x - 16, y, colisoes))
                    {
                        //Ele vai para o estado de desviar
                        estado = "desvia"; 
                    } 
                    else //Caso não tenha
                    {
                        //ele troca de sprite
                        troca_sprite(spr_mago_tp_parado_esquerda);
                         
                        //Ele anda para esquerda
                        x -= 16;
                    }    
                }
                
                if(direction < 45 or direction > 315) //Se minha direção ficar entre 315 e 45 graus
                {     
                    //Caso tenha algo na frente dele        
                    if(place_meeting(x + 16, y, colisoes))
                    {
                        //Ele vai para o estado de desviar
                        estado = "desvia";
                    } 
                    else //Caso não tenha
                    {
                        //Ele troca de sprite
                        troca_sprite(spr_mago_tp_parado_direita);
                         
                        //Ele anda para direita
                        x += 16;  
                    }	
                }
                
                //Se a minha direção ficar entre 135 e 45 graus
                if(direction < 135 and direction > 45)
                {
                    //Caso tenha algo na frente dele
                    if(place_meeting(x, y - 16, colisoes))
                    {
                        //Ele vai para o estado de desviar
                       estado = "desvia"; 
                    }
                    else //Caso não tenha
                    { 
                        //Ele troca de sprite
                        troca_sprite(spr_mago_tp_parado_cima);
                          
                        //Ele anda para cima
                        y -= 16;
                    } 
                }
           
                if(direction < 315 and direction > 225) //Se minha direção ficar entre 225 e 315 graus
                {
                    //Caso tenha algo na frente dele
                    if(place_meeting(x, y + 16, colisoes))
                    {
                        //Ele vai para o estado de desviar
                       estado = "desvia"; 
                    }
                    else //Caso não tenha
                    { 
                        //Ele troca de sprite
                        troca_sprite(spr_mago_tp_parado_baixo);
                         
                        //Ele anda para baixo
                        y += 16;
                    } 
                   
                }
                
                //Restando o delei
                delei_andar = tempo_andar;
            }
            
            //Limitando ele dentro da arena
            x = clamp(x, 24, 232);
            y = clamp(y, 26, 122);
            
        break;
    
        case "desvia":
            
        break;
    }
}
#endregion