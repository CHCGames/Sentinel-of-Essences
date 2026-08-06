#region Variáveis

//Variável de velocidade
vel_h = 2;
vel_v = 0;

//Variável de sprite
sprite_2 = spr_atq_essencia_noar_lados;

//Varíavel de estado
estado = "surgindo";

//Variavel de distancia
distancia = 48;

#endregion

#region Métodos

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
        break;
    }
}
#endregion