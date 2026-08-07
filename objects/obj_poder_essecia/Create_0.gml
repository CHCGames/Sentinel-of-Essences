#region Variáveis

//Variável de velocidade
vel_h = 2;
vel_v = 0;

//Variável de sprite
sprite_2 = spr_atq_essencia_noar_lados;

//Varíavel de estado
estado = "surgindo";

//Variavel de distancia
distancia = 28;

//array de colisões
colisoes = [obj_arvore, obj_tronco_lados, obj_tronco_vertical]

#endregion

#region Métodos

//Método de colisão
colisao = function()
{
    //Caso ele colir com os objetos do array
    if(instance_place(x, y, colisoes))
    {
        //Criando efeito de explosão
        instance_create_layer(x, y, "Efeitos", obj_efeito_explosao);
        
        //Ele se destroi
        instance_destroy(id, false);
    } 
}

//Maquina de estados
maquina_estados = function()
{
    //Usando o switch
    switch (estado) 
    {
    	//Caso ele esteja surgindo
        case "surgindo":
            
            //Quando acabar a animação 
            if(acabou_animacao())
            {
                //Ele troca de estado
                estado = "voando";
            }    
        break;
    
    	//Caso ele esteja voando
        case "voando":
             
            //Ele troca de sprite
            troca_sprite(sprite_2);
            
            //Ele ganha velocidade
            hspeed = vel_h;
            vspeed = vel_v;
            
            //Caso ele chegue no limete de distancia horizontal
            if(x >= xstart + distancia or x <= xstart - distancia)
            {
                //Ele se destroi
                instance_destroy(id, false);
            }
            
            //Caso ele chegue no limite de destancia vertical
            if(y >= ystart + distancia or y <= ystart - distancia)
            {
                //Ele se destroi
                instance_destroy(id, false);
            }    
            
            //Limitando a saida da tela //Ele se destroi
            if(x >= 242 or x <= 14) instance_destroy(id, false);
            if(y >= 132 or y <= 16) instance_destroy(id, false);
            
        break;
    }
}

#endregion