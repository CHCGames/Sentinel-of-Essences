#region Variáveis

//Variável de estado
estado = "parada";


//Criando array de colisões
colisoes = [obj_poder_essecia, obj_tronco_lados, obj_tronco_vertical];

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
             
            //Caso ele tomar dano
            if(instance_place(x, y, obj_dano)) estado = choose("caindo_direita", "caindo_esquerda",
                "caindo_baixo", "caindo_cima");
            
            //Ela troca de sprite para arvore grande
            troca_sprite(spr_arvore_grande);
            
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
             
            //Ela troca de sprite de cair para direita
            troca_sprite(spr_arvore_caindo_direita);
            
            //Quando acabou a animação
            if (acabou_animacao()) 
            {
                //Cria o dano
                instance_create_layer(x + 16, y, "Troncos", obj_dano);
                
            	//Cria efeitos de explosão
                instance_create_layer(x, y - 5, "Efeitos", obj_efeito_explosao);
                instance_create_layer(x + 16, y - 5, "Efeitos", obj_efeito_explosao);
                
                instance_destroy(id, false);
            }
            
            
        break;
    
        //Caso ela esteja no estado de cair para esquerda
        case "caindo_esquerda":
             
            //Ela troca de sprite de cair para esquerda
            troca_sprite(spr_arvore_caindo_esquerda);
            
            //Quando acabou a animação
            if (acabou_animacao()) 
            {
                //Cria o dano
                instance_create_layer(x - 16, y, "Troncos", obj_dano);
                
            	//Cria efeitos de explosão
                instance_create_layer(x, y - 5, "Efeitos", obj_efeito_explosao);
                instance_create_layer(x - 16, y - 5, "Efeitos", obj_efeito_explosao);
                
                instance_destroy(id, false);
            }
            
        break;
    
        //Caso ela esteja no estado de cair para cima
        case "caindo_cima":
             
            //Ela troca de sprite caindo pra cima
            troca_sprite(spr_arvore_caindo_cima);
            
            //Quando acabou a animação
            if (acabou_animacao()) 
            {
                //Cria o dano
                instance_create_layer(x, y - 16, "Troncos", obj_dano);
                
            	//Cria efeitos de explosão
                instance_create_layer(x, y - 5, "Efeitos", obj_efeito_explosao);
                instance_create_layer(x, y - 16, "Efeitos", obj_efeito_explosao);
                
                instance_destroy(id, false);
            }
            
        break;
    
        //Caso ela esteja no estado de cair para baixo
        case "caindo_baixo":
             
            //Ela troca de sprite caindo pra baixo
            troca_sprite(spr_arvore_caindo_baixo);
            
            //Quando acabou a animação
            if (acabou_animacao()) 
            {
                //Cria o dano
                instance_create_layer(x, y + 16, "Troncos", obj_dano);
                
            	//Cria efeitos de explosão
                instance_create_layer(x, y - 5, "Efeitos", obj_efeito_explosao);
                instance_create_layer(x, y + 16, "Efeitos", obj_efeito_explosao);
                
                instance_destroy(id, false);
            }
            
        break;
    
    
    }
}

#endregion