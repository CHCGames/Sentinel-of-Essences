#region Variáveis

//iniciando o efeito squash
inicia_efeito_squash();

//Variável de desenhar outline
outline = false;

//Variável de estado
estado = estado_bt;

//Variável de destino
destino = destino_bt

//Variável de controle de sair do jogo
sair_jogo = false;

#endregion

//Máquina de estados para sprite e destino
maquina_estados = function()
{
    switch (estado) 
    {
    	//Caso ele estiver em jogar
        case "tutorial":
            
            //Ele troca de sprite
            sprite_index = spr_botao_tutorial;
            
        break;
    
    	//Caso ele estiver em jogar
        case "sair":
            
            //Ele troca de sprite
            sprite_index = spr_botao_sair;
            
            //Avisando pra sair do jogo
            sair_jogo = true;
        break;
        
    }
}