#region Variáveis

//Zerando a animação
image_speed = 0;

//Iniciando efeito squash
inicia_efeito_squash(1.5, 1.5);

//Variável de controle de desenhar outline
outline = false;

//Variável de controle de nivel max
atingi_nivel_max = false;

//Variável de estado
estado = melhoria;

//Variável de custo
custo = meu_custo;

//Variáel de nivel do poder
poder_nivel = 0;

//Variável de limite de upgrade
nivel_max = 3;

#endregion

#region Métodos

//Máquina de estados
maquina_estado = function()
{
    //Usando o switch
    switch (estado) 
    {
    	//Caso ele seja de aumentar disntancia
        case "aumento_distancia":
         
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(mouse_check_button_pressed(mb_left) and poder_nivel < 3 and global.dinheiro >= custo)
            {
                //Então ele melhora a distancia
                global.distancia_atq += 16;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumento o nivel em 1
                poder_nivel += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(poder_nivel >= 3)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    }
}

#endregion




