#region Variáveis

//Variável de vida
vida = 3;

//Varíavel de movimento 
vel = 16;

//Variável de controle de ficar ivunerável
ivuneravel = false;

//Variável de estado
estado = "baixo";

//Variável de tempo do tiro
tempo_tiro = FPS/1.5;

//Variável de tempo de andar
tempo_andar = 7;

//Variável de tempo do efeito de ivunerável
tempo_efeito = FPS/4;

//Variável de delei do efeito ivunerável
delei_efeito = tempo_efeito;

//Variável de delei do tiro
delei_tiro = 0;

//Variavel delei de andar
delei_andar = 0;

//array de colisão
colisoes = [obj_parede, obj_arvore, obj_tronco_lados, obj_tronco_vertical, obj_buraco, obj_pedra, 
obj_mago_tapete, obj_caixa];

//Array inimigos
array_inimigos = [obj_mago_tapete];

//Array vazio
array_vazio = [obj_arvore, obj_tronco_lados, obj_tronco_vertical, obj_buraco, obj_pedra, obj_parede,
obj_caixa];

//Variável para salvar o array
array_atual = colisoes;

#endregion

#region Métodos

//Método para tomar dano
toma_dano = function()
{
    //Caso a vida dele acabe
    if(vida <= 0)
    {
        //ele perde
        room_restart();
    }    
    
    //Caso ele colidir com inimigo
    if(place_meeting(x, y, array_inimigos) and ivuneravel == false)
    {
        //Diminuindo a vida
        vida -= 1;
        
        //Avisando que estou ivunerável
        ivuneravel = true;
        
        //Tremendo a tela
        global.shake = 2;
        
        //Definindo o array
        array_atual = array_vazio;
        
        //Disparando o alarme
        alarm[0] = FPS * 5;
        
    }
    
    //Diminuindo o delei do efeito
    delei_efeito--;
    
    //Fazendo o efeito de ivunerável
    if(ivuneravel)
    {
        //mudando a cor
        if(image_blend == c_white and delei_efeito <= 0)
        {
            //então ele muda de cor
            image_blend = c_red;
            
            //Resetando delei
            delei_efeito = tempo_efeito;
        }
        else if(image_blend == c_red and delei_efeito <= 0)
        {
            //Ele muda de cor
            image_blend = c_white
            
            //Resetando delei
            delei_efeito = tempo_efeito;
        }    
    }
    else //Ao contraio
    {
        //ele volta a cor normal
        image_blend = c_white;
    }
    
}

//Método de movimento
movimento = function()
{
    
    //Caso o delei acabe
    if (delei_andar <= 0 ) 
    {
    	//Pegando os comandos
        var _cima = keyboard_check_pressed(vk_up);
        var _baixo = keyboard_check_pressed(vk_down);
        var _direita = keyboard_check_pressed(vk_right);
        var _esquerda = keyboard_check_pressed(vk_left);
        
        //Caso ele aperte para direita //ele se move um espaço positivo na grade
        if(_direita == true and _cima == false and _baixo == false and 
            !place_meeting(x + 16, y, array_atual)) x += vel; 
          
        //Caso ele aperte para esquerda //ele se move um espaço negativo na grade 
        if(_esquerda == true and _cima == false and _baixo == false and
            !place_meeting(x - 16, y, array_atual)) x -= vel; 
           
        //Caso ele aperte para baixo //ele se move um espaço abaixo na grade
        if(_baixo and !place_meeting(x, y + 16, array_atual)) y += vel; 
           
        //Caso ele aperte para cima //ele se move um espaço acima da grade
        if(_cima and !place_meeting(x, y - 16, array_atual)) y -= vel; 
          
        //Resetando o delei de andar
        if(keyboard_check_pressed(vk_right)) delei_andar = tempo_andar;
        if(keyboard_check_pressed(vk_left)) delei_andar = tempo_andar;
        if(keyboard_check_pressed(vk_up)) delei_andar = tempo_andar;
        if(keyboard_check_pressed(vk_down)) delei_andar = tempo_andar;
    }
    
    //Impedindo ele de sair da arena horizontalmente  
    x = clamp(x, 24, 232);
    
    //Impedindo ele de sair da arena verticalmente
    y = clamp(y, 26, 122);
}

//Método para mudar para animação de ataque
animacao_ataque = function(_sprite_atq = noone, _sprite_inicial = noone)
{
    //Trocando de sprite
    troca_sprite(_sprite_atq);
    
    //Caso acabar a animação
    if (acabou_animacao()) 
    {
        //Ele troca sprite
        troca_sprite(_sprite_inicial);
    }
}

//Método de atacar
ataque_lados = function(_x = 0, _direcao_h = 1, _direcao_v = 1, _vel_h = 2, _vel_v = 0, _layer = "Poderes",
_sprite_1 = spr_atq_essencia_surigindo_lado, _sprite_2 = spr_atq_essencia_noar_lados)
{
    //Pegando o comando
    var _space = keyboard_check_pressed(vk_space);
    
    //Caso ele aperte
    if(_space)
    {
        //Criando ataque
        var _poder = instance_create_layer(x + _x, y - 4, _layer, obj_poder_essecia);
        
        //Defindo a spite
        _poder.sprite_index = _sprite_1;
        
        //Definindo a segunda sprite
        _poder.sprite_2 = _sprite_2;
        
        //Defindo o image_xscale
        _poder.image_xscale = _direcao_h;
        
        //Definindo a image_yscale
        _poder.image_yscale = _direcao_v
        
        //Dando a velocidade horizontal
        _poder.vel_h = _vel_h;
        
        //Dando a velocidade vertical
        _poder.vel_v = _vel_v;
        
        //resetando o delei do tiro
        delei_tiro = tempo_tiro;
    }
}

//Máquina de estados
maquina_estado = function()
{
    //Diminuindo delei do tiro
    if(delei_tiro >= 0) delei_tiro--;  
       
    //Diminuindo o delei de andar
    if(delei_andar >= 0) delei_andar--;
    
    //Mudando o estado conforme a direção
    if(keyboard_check_pressed(vk_right)) estado = "direita";
    if(keyboard_check_pressed(vk_left)) estado = "esquerda";
    if(keyboard_check_pressed(vk_up)) estado = "cima";
    if(keyboard_check_pressed(vk_down)) estado = "baixo";
      
    //Usando o Switch
    switch (estado) 
    {
    	//Caso ele estiver no estado baixo
        case "baixo":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_baixo);
            
            //Caso o delei aindo não tenha acabado
            if (delei_tiro <= 0)
            {
                 //Usando a função de atacar 
                 ataque_lados( ,1, 1, 0, 2, , spr_atq_essencia_surigindo_baixo, spr_atq_essencia_noar_baixo);
                 
                 //Caso ele aperte espaço //eele muda de estado
                 if (keyboard_check_pressed(vk_space)) estado = "ataque_baixo";
                   
            }    
              
        break;
	
        //Caso ele estiver no estado cima
        case "cima":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_cima);
            
            //Caso o delei ainda não tenha acabado
            if(delei_tiro <= 0) 
            {
               //Usando a função de atacar 
               ataque_lados( ,1, -1, 0, -2, "Poderes_cima", spr_atq_essencia_surigindo_baixo, spr_atq_essencia_noar_baixo);
               
               //Caso ele aperte espaço //eele muda de estado
               if (keyboard_check_pressed(vk_space)) estado = "ataque_cima";
            }
              
            
        break;
    
        //Caso ele estiver no estado direita
        case "direita":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_direita);
            
            //Caso o delei do tiro acabe 
            if(delei_tiro <= 0)
            {
                //Usando a função de atacar para os lados
               ataque_lados(5);
               
               //Caso ele aperte espaço //eele muda de estado
               if (keyboard_check_pressed(vk_space)) estado = "ataque_direita";
            }
            
        break;
    
        //Caso ele estiver no estado esquerda
        case "esquerda":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_esquerda);
            
            //caso o delei do tiro acabe
            if(delei_tiro <= 0)
            {
               //Usando a função de atacar para os lados
               ataque_lados(-5, -1, 1, -2, 0);
               
               //Caso ele aperte espaço //eele muda de estado
               if (keyboard_check_pressed(vk_space)) estado = "ataque_esquerda"; 
            }
            
        break;
         
        //Caso ele ataque para baixo
        case "ataque_baixo":
            
            //Ele troca de sprite
            troca_sprite(spr_player_atq_baixo);
            
            //Quando acabar a anaimação
            if (acabou_animacao()) 
            {
            	//Ele volta para o estado baixo
                estado = "baixo";
            }
        break;
         
        //Caso ele ataque para baixo
        case "ataque_cima":
           
            //Ele troca de sprite
            troca_sprite(spr_player_atq_cima);
            
            //Quando acabar a animção
            if (acabou_animacao()) 
            {
            	//Ele volta para o estado cima
                estado = "cima";
            }
        break;
            
        //Caso ele ataque para baixo
        case "ataque_esquerda":
              
            //Ele troca de sprite
            troca_sprite(spr_player_atq_esquerda);
            
            //Quando acabar a animção
            if(acabou_animacao())
            {
                //Ele vai para o estado de esquerda
                estado = "esquerda";
            }
        break;
           
        //Caso ele ataque para baixo
        case "ataque_direita":
              
            //Ele troca de sprite
            troca_sprite(spr_player_atq_direita);
            
            //Quando acabar a animação
            if (acabou_animacao()) 
            {
            	//Ele vai para o estado de direita
                estado = "direita";
            }
        break;
    }
}
#endregion