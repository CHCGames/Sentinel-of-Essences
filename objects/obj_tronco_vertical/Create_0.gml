#region Variáveis

//Variável de estado
estado = "parado";

//Variável de velocidade
vel = 1;

//Variavel de controle de se destruir
destruir = false;

//zerando a animação
image_speed = 0;

//array de colisao
colisoes = [obj_arvore, obj_tronco_lados, obj_mago_tapete, obj_caixa, obj_totem, obj_lava];

//array de colsisoes que afetam
colisoes_afetam = [obj_poder_essecia, obj_pedra, obj_tronco_vertical, obj_caixa];

#endregion

#region Métodos

//Máquina de estados
maquina_estados = function()
{
    //Usando o Switch
    switch (estado) 
    {
        //Caso ela esteja no estado grande
        case "parado":
            
            //Caso o poder colidir na esquerda da arvore
            if(instance_place(x, y - 2, colisoes_afetam))
            {
                //Então ela vai para o estado de cair para direita
                estado = "caindo_direita";
            }    
              
            //Caso o poder colidir na direita
            if(instance_place(x, y + 2, colisoes_afetam))
            {
                //Ela vai para o estado de cair para esquerda
                estado = "caindo_esquerda";
            } 
              
        break;
    
        //Caso ela esteja no estado de cair para direita
        case "caindo_direita":
             
            //Ela troca de sprite de cair para direita
            troca_sprite(spr_tronco_baixo);
            
            //Retoma a animação
            image_speed = 1;
            
            //Dando velocidade pra ele
            vspeed = vel;
            
            //Caso ele colidir com algo
            if (instance_place(x, y + 15, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 2;
            }
            
        break;
    
        //Caso ela esteja no estado de cair para esquerda
        case "caindo_esquerda":
             
            //Ela troca de sprite de cair para esquerda
            troca_sprite(spr_tronco_cima);
            
            //Retoma a animação
            image_speed = 1;
            
            //Dando velocidade pra ele
            vspeed = -vel;
            
            //Caso ele colidir com algo
            if (instance_place(x, y - 15, colisoes)) 
            {
                //Ele se destroi
                alarm[0] = 2;
            }
            
        break;
    
    }
}

#endregion