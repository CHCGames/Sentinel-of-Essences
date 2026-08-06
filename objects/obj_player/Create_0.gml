#region Variáveis

//Varíavel de movimento 
vel = 16;

//Variável de estado
estado = "baixo";


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
    if(_direita) x += vel; estado = "direita";
      
    //Caso ele aperte para esquerda //ele se move um espaço negativo na grade 
    if(_esquerda) x -= vel; estado = "esquerda";
       
    //Caso ele aperte para baixo //ele se move um espaço abaixo na grade
    if(_baixo) y += vel; estado = "baixo";
       
    //Caso ele aperte para cima //ele se move um espaço acima da grade
    if(_cima) y -= vel; estado = "cima";
      
    //Impedindo ele de sair da arena horizontalmente  
    x = clamp(x, 24, 232);
    
    //Impedindo ele de sair da arena verticalmente
    //y = clamp(x,)
}

//Máquina de estados
maquina_estado = function()
{
    //Usando o Switch
    switch (estado) 
    {
    	//Caso ele estiver no estado baixo
        case "baixo":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_baixo);
            
        break;
	
        //Caso ele estiver no estado cima
        case "cima":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_cima);
            
        break;
    
        //Caso ele estiver no estado direita
        case "direita":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_direita);
            
        break;
    
        //Caso ele estiver no estado esquerda
        case "esquerda":
            
            //Trcando de sprite
            troca_sprite(spr_player_parado_esquerda);
            
        break;
    }
}
#endregion