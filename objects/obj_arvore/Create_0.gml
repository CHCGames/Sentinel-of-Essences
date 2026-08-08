#region Variáveis

//Variável de estado
estado = "pequena";

//Variavel de variação de tempo
varia_tempo = FPS * irandom_range(1, 2);

//Variavel de tempo de Crescimento
tempo_crescer = FPS * 3 + varia_tempo;

//variável de Cresimento
crescimento = tempo_crescer;

//Criando array de colisões
colisoes = [obj_poder_essecia, obj_tronco_lados, obj_tronco_vertical, obj_pedra, obj_caixa];

#endregion

#region Métodos

//Método de gerar troncos
gera_troncos = function(_px = 0, _py = 0)
{
    //Caso ele tenha o purk
    if (global.gerar_troncos) 
    {
    	//Varíavel de troncos aleatórios
        var _tronco = choose(obj_tronco_lados, obj_tronco_vertical);
        
        //Criando os troncos
        instance_create_layer(x, y - 2, "Troncos", _tronco);
        
    }
}

//Máquina de estados
maquina_estados = function()
{
    //Usando o Switch
    switch (estado) 
    {
    	//Caso ela esteja no estado pequena
        case "pequena":
             
            //Diminuo o tempo de crescimento
            crescimento--;
            
            //caso o tempo de acabe
            if(crescimento <= 0)
            {
                //Criando efeito de crecsimento
                instance_create_layer(x, y -8, "Efeitos", obj_efeito_cresci);
                
                //Reseta o tempo de Crescimento
                crescimento = tempo_crescer;
                
                //Ele vai para o proximo estado
                estado = "media";
            }
            
        break;
    
    	//Caso ela esteja no estado media
        case "media":
            
            //Ela troca de sprite
            troca_sprite(spr_arvore_media);
             
            //Diminuo o tempo de crescimento
            crescimento--;
            
            //caso o tempo de acabe
            if(crescimento <= 0)
            {
                //Criando efeito de crecsimento
                instance_create_layer(x, y -18, "Efeitos", obj_efeito_cresci);
                
                //Ele vai para o proximo estado
                estado = "grande";
            }
            
        break;
    
        //Caso ela esteja no estado grande
        case "grande":
             
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
                
                //Criando tronco
                gera_troncos();
                
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
                
                //Criando tronco
                gera_troncos(-16);
                
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
                
                //Criando tronco
                gera_troncos(0, -16);
                
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
                
                //Criando tronco
                gera_troncos(0, 16);
                
                instance_destroy(id, false);
            }
            
        break;
    
    
    }
}

#endregion