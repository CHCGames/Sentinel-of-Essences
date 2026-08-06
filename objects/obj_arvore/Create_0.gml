#region Variáveis

//Variável de estado
estado = "pequena";

//Variavel de tempo de Crescimento
tempo_crescer = FPS*5;

//variável de Cresimento
crescimento = tempo_crescer;

#endregion

#region Métodos

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
             
            //Ela troca de sprite para arvore grande
            troca_sprite(spr_arvore_grande);
            
            //Caso o poder colidir na esquerda da arvore
            if(place_meeting(x - sprite_height/2, y, obj_poder_essecia))
            {
                //Então ela vai para o estado de cair para direita
                estado = "caindo_direita";
            }    
              
            //Caso o poder colidir na direita
            if(place_meeting(x + sprite_height/2, y, obj_poder_essecia))
            {
                //Ela vai para o estado de cair para esquerda
                estado = "caindo_esquerda";
            } 
             
            //Caso o poder colidir em baixo
            if(place_meeting(x, y + sprite_width/2, obj_poder_essecia))
            {
                //Ela vai para o estado de cair para cima
                estado = "caindo_cima";
            }    
              
            //Caso o poder colidir em cima
            if(place_meeting(x, y - sprite_width/2, obj_poder_essecia))
            {
                //Ela vai para o estado de cair para baixo
                estado = "caindo_baixo";
            } 
            
        break;
    
        //Caso ela esteja no estado de cair para direita
        case "caindo_direita":
             
            //Ela troca de sprite de cair para direita
            troca_sprite(spr_arvore_caindo_direita);
            
            
        break;
    
        //Caso ela esteja no estado de cair para esquerda
        case "caindo_esquerda":
             
            //Ela troca de sprite de cair para esquerda
            troca_sprite(spr_arvore_caindo_esquerda);
            
            
        break;
    
        //Caso ela esteja no estado de cair para cima
        case "caindo_cima":
             
            //Ela troca de sprite caindo pra cima
            troca_sprite(spr_arvore_caindo_cima);
            
            
        break;
    
        //Caso ela esteja no estado de cair para baixo
        case "caindo_baixo":
             
            //Ela troca de sprite caindo pra baixo
            troca_sprite(spr_arvore_caindo_baixo);
            
            
        break;
    
    
    }
}

#endregion