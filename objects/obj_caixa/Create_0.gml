#region Variáveis

//Variável de estado
estado = "parada";

//Variável de velocidade
vel = 1.5;

//Variavel de destruir
destruir = false;

//Zerando a velocidade da animação
image_speed = 0;

//Criando array de colisões
colisoes = [obj_tronco_lados, obj_tronco_vertical, obj_arvore, obj_pedra, obj_mago_tapete, obj_caixa];

//array de colisões que afetam
colisoes_afetam = [obj_poder_essecia];

#endregion

#region Métodos

//Máquina de estados
maquina_estados = function()
{
    //Usando o Switch
    switch (estado) 
    {
        //Caso ela esteja no estado grande
        case "parada":
            
            //Caso o poder colidir na esquerda da arvore
            if(place_meeting(x - 4, y, colisoes_afetam))
            {
                //Então ela vai para o estado de cair para direita
                estado = "caindo_direita";
            }    
              
            //Caso o poder colidir na direita
            if(place_meeting(x + 4, y, colisoes_afetam))
            {
                //Ela vai para o estado de cair para esquerda
                estado = "caindo_esquerda";
            } 
             
            //Caso o poder colidir em baixo
            if(place_meeting(x, y + 2, colisoes_afetam))
            {
                //Ela vai para o estado de cair para cima
                estado = "caindo_cima";
            }    
              
            //Caso o poder colidir em cima
            if(place_meeting(x, y - 2, colisoes_afetam))
            {
                //Ela vai para o estado de cair para baixo
                estado = "caindo_baixo";
            } 
           
            
        break;
    
        //Caso ela esteja no estado de cair para direita
        case "caindo_direita":
             
            //Dando a velocidade
            hspeed = vel;
            
            //Quando acabou a animação
            if (instance_place(x + 2, y, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 1;
            }
            
        break;
    
        //Caso ela esteja no estado de cair para esquerda
        case "caindo_esquerda":
             
            //Dando a velocidade
            hspeed = -vel;
            
            //Quando acabou a animação
            if (instance_place(x - 2, y, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 1;
            }
            
            
        break;
    
        //Caso ela esteja no estado de cair para cima
        case "caindo_cima":
             
            //Dando a velocidade
            vspeed = -vel;
            
            //Quando acabou a animação
            if (instance_place(x, y - 2, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 1;  
            }
            
        break;
    
        //Caso ela esteja no estado de cair para baixo
        case "caindo_baixo":
             
            //Dando a velocidade
            vspeed = vel;
            
            //Quando acabou a animação
            if (instance_place(x, y + 2, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 1;
            }
            
        break;
    
    
    }
}

#endregion