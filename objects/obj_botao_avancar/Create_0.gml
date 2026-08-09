#region Variáveis

//iniciando o efeito squash
inicia_efeito_squash();

//Variável de desenhar outline
outline = false;

//Variável de estado
estado = estado_bt;

//Variável de destino]
destino = [rm_level_1, rm_loja_gameplay, rm_level_2, rm_loja_gameplay, rm_level_3, rm_loja_gameplay];

//Variável de sprite_outline
sprite_outline = spr_botao_voltar_outline;

#endregion

//Máquina de estados para sprite e destino
maquina_estados = function()
{
    switch (estado) 
    {
    	//Caso ele estiver em jogar
        case "loja":
            
            //Ele troca de sprite
            sprite_index = spr_botao_loja;
            
            //Passando a minha outline
            sprite_outline = spr_botao_loja_outline;
            
        break;
    }
}