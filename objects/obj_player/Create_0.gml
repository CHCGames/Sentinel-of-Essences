#region Variáveis

//Varíavel de movimento 
vel = 16;

//Variável de estado
estado = "baixo";


//Pegando os controles


#endregion

#region Métodos

//Método de movimento
movimento = function()
{
    //Pegando os comandos
    var _cima = keyboard_check_pressed(vk_up);
    var _baixo = keyboard_check_pressed(vk_down);
    var _direita = keyboard_check_pressed(vk_right);
    var _esquerda = keyboard_check_pressed(vk_left);
    
    //Caso ele aperte para direita //ele se move um espaço positivo na grade
    if(_direita) x += vel;
      
    //Caso ele aperte para esquerda //ele se move um espaço negativo na grade 
    if(_esquerda) x -= vel; 
       
    //Caso ele aperte para baixo //ele se move um espaço abaixo na grade
    if(_baixo) y += vel; 
       
    //Caso ele aperte para cima //ele se move um espaço acima da grade
    if(_cima) y -= vel; 
      
    //Impedindo ele de sair da arena horizontalmente  
    x = clamp(x, 24, 232);
    
    //Impedindo ele de sair da arena verticalmente
    y = clamp(y, 26, 122);
}

//Método de atacar
ataque_lados = function(_direcao_h = 1, _direcao_v = 1, _vel_h = 2, _vel_v = 0, _layer = "Poderes",
_sprite_1 = spr_atq_essencia_surigindo_lado, _sprite_2 = spr_atq_essencia_noar_lados)
{
    //Pegando o comando
    var _space = keyboard_check_pressed(vk_space);
    
    //Caso ele aperte
    if(_space)
    {
        //Criando ataque
        var _poder = instance_create_layer(x, y - 5, _layer, obj_poder_essecia);
        
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
    }
}

//Máquina de estados
maquina_estado = function()
{
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
            
            //Usando a função de atacar 
            ataque_lados(1, 1, 0, 2, , spr_atq_essencia_surigindo_baixo, spr_atq_essencia_noar_baixo);
            
        break;
	
        //Caso ele estiver no estado cima
        case "cima":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_cima);
            
            //Usando a função de atacar 
            ataque_lados(1, -1, 0, -2, "Poderes_cima", spr_atq_essencia_surigindo_baixo, spr_atq_essencia_noar_baixo);
            
        break;
    
        //Caso ele estiver no estado direita
        case "direita":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_direita);
            
            //Usando a função de atacar para os lados
            ataque_lados();
            
        break;
    
        //Caso ele estiver no estado esquerda
        case "esquerda":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_esquerda);
            
            //Usando a função de atacar para os lados
            ataque_lados(-1, 1, -2, 0);
        break;
    }
}
#endregion