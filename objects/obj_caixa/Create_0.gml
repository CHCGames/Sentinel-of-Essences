#region Variáveis

//Variável de estado
estado = "parada";

//Variável de velocidade
vel = 2;

//Zerando a velocidade da animação
image_speed = 0;

//Criando array de colisões
colisoes = [obj_poder_essecia, obj_tronco_lados, obj_tronco_vertical, obj_arvore, obj_pedra, obj_caixa];

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
            if(place_meeting(x - 4, y, colisoes))
            {
                //Então ela vai para o estado de cair para direita
                estado = "caindo_direita";
            }    
              
            //Caso o poder colidir na direita
            if(place_meeting(x + 4, y, colisoes))
            {
                //Ela vai para o estado de cair para esquerda
                estado = "caindo_esquerda";
            } 
             
            //Caso o poder colidir em baixo
            if(place_meeting(x, y + 2 , colisoes))
            {
                //Ela vai para o estado de cair para cima
                estado = "caindo_cima";
            }    
              
            //Caso o poder colidir em cima
            if(place_meeting(x, y - 2, colisoes))
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
            if (instance_place(x, y, colisoes)) 
            {
                //Ele zera a velocidade
                hspeed = 0;
                
                //Ela volta a animar
                image_speed = 1;
                
                //Caso acabe animação //Ela se destroi
                if (acabou_animacao()) instance_destroy(id, false);
                
            }
            
        break;
    
        //Caso ela esteja no estado de cair para esquerda
        case "caindo_esquerda":
             
            //Dando a velocidade
            hspeed = -vel;
            
            //Quando acabou a animação
            if (instance_place(x, y, colisoes)) 
            {
                //Ele zera a velocidade
                hspeed = 0;
                
                //Ela volta a animar
                image_speed = 1;
                
                //Caso acabe animação //Ela se destroi
                if (acabou_animacao()) instance_destroy(id, false);
                
            }
            
            
        break;
    
        //Caso ela esteja no estado de cair para cima
        case "caindo_cima":
             
            //Dando a velocidade
            vspeed = -vel;
            
            //Quando acabou a animação
            if (instance_place(x, y, colisoes)) 
            {
                //Ele zera a velocidade
                vspeed = 0;
                
                //Ela volta a animar
                image_speed = 1;
                
                //Caso acabe animação //Ela se destroi
                if (acabou_animacao()) instance_destroy(id, false);
                
            }
            
        break;
    
        //Caso ela esteja no estado de cair para baixo
        case "caindo_baixo":
             
            //Dando a velocidade
            vspeed = vel;
            
            //Quando acabou a animação
            if (instance_place(x, y, colisoes)) 
            {
                //Ele zera a velocidade
                vspeed = 0;
                
                //Ela volta a animar
                image_speed = 1;
                
                //Caso acabe animação //Ela se destroi
                if (acabou_animacao()) instance_destroy(id, false);
                
            }
            
        break;
    
    
    }
}

#endregion