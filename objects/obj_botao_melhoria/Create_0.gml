#region Variáveis

//Zerando a animação
image_speed = 0;

//Iniciando efeito squash
inicia_efeito_squash(1.5, 1.5);

//Variável de controle de desenhar outline
outline = false;

//Variável de controle de nivel max
atingi_nivel_max = false;

//Variavel de controle para dizer minha função
escreve_funcao = false;

//Variável de controle de clicar
cliquei = false;

//Variável de estado
estado = melhoria;

//Variável de custo
custo = meu_custo;

//Variável para salvar o nivel
meu_nivel = 0;

//Variável de minha função
funcao = "opa";


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
         
            //Passando minha Função
            funcao = "Aumenta a distancia do ataque em mais um bloco."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_poder;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_poder < 3 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.distancia_atq += 16;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumentando o custo
                custo *= 2;
                
                //Aumento o nivel em 1
                global.nivel_poder += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_poder >= 3)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    }
}

#endregion




