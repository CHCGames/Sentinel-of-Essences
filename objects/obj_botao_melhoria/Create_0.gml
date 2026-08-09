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
    
        //Caso ele seja de aumentar disntancia
        case "cresce_arvore":
         
            //Definindo a sprite pelo frame
            image_index = 3;
            
            //Passando minha Função
            funcao = "Arvores demoram menos tempo para crescerem totalmente."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_crescimento;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_crescimento < 3 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.velocidade_crescimento -= 1;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumentando o custo
                custo *= 2;
                
                //Aumento o nivel em 1
                global.nivel_crescimento += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_crescimento >= 3)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
        
        //Caso ele seja de aumentar disntancia
        case "gera_troncos":
         
            //Definindo a sprite pelo frame
            image_index = 1;
            
            //Passando minha Função
            funcao = "Arvores agora geram troncos onde foram destruidas."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_troncos;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_troncos < 1 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.gerar_troncos = true;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumento o nivel em 1
                global.nivel_troncos += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_troncos >= 1)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    
        //Caso ele seja de aumentar disntancia
        case "cria_arvores":
         
            //Definindo a sprite pelo frame
            image_index = 2;
            
            //Passando minha Função
            funcao = "Gera arvores em lugares aléatorios em fases que não existem arvores naturalmente."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_cria_arvores;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_cria_arvores < 1 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.cria_arvores = true;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumento o nivel em 1
                global.nivel_cria_arvores += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_cria_arvores >= 1)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    
        //Caso ele seja de aumentar disntancia
        case "vida":
         
            //Definindo a sprite pelo frame
            image_index = 4;
            
            //Passando minha Função
            funcao = "Aumenta sua vida para quatro corações."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_vida;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_vida < 1 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.vida_player += 1;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumento o nivel em 1
                global.nivel_vida += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_vida >= 1)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    
        //Caso ele seja de aumentar disntancia
        case "livros":
         
            //Definindo a sprite pelo frame
            image_index = 5;
            
            //Passando minha Função
            funcao = "Gera livros gigantes que podem matar seus inimigos, mas cuidado se um desses cair me você vai doer! (-1 de vida)."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_livros;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_livros < 1 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                global.cair_livros = true;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Aumento o nivel em 1
                global.nivel_livros += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_livros >= 1)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    
        //Caso ele seja de aumentar disntancia
        case "bombas":
         
            //Definindo a sprite pelo frame
            image_index = 6;
            
            //Passando minha Função
            if(global.nivel_bombas < 1) funcao = "Gera Dinamites no mapa que vão te ajudar a destruir tudo."
            if(global.nivel_bombas >= 1) funcao = "Gera Bombas gigantes no mapa que vão te ajudar a destruir tudo."
            
            //Passando o meu nivel
            meu_nivel = global.nivel_bombas;
            
            //Caso o jogador clique na melhoria e o nivel do poder for menor que o max e se ele tem
            //dinheiro suficiente
            if(cliquei == true and global.nivel_bombas < 2 and global.dinheiro >= custo)
            {
                //Avisando que já cliquei
                cliquei = false;
                
                //Então ele melhora a distancia
                if(global.nivel_bombas < 1) global.cria_dinamites = true;
                if(global.nivel_bombas >= 1) global.cria_bombas = true;
                
                //Diminuindo o dinheiro
                global.dinheiro -= custo;
                
                //Drobando o custo
                custo *= 2;
                
                //Aumento o nivel em 1
                global.nivel_bombas += 1;
            }
            
            //Caso eue atinja o nivel maximo
            if(global.nivel_bombas >= 2)
            {
                //Avisando que cheguei no nível maximo
                atingi_nivel_max = true;
            }  
             
        break;
    }
}

#endregion
