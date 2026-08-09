#region Variáveis

//Zerando a animação
image_speed = 0;

//Mudando minha sprite pelo frame
image_index = 3;

//Iniciando efeito squash
inicia_efeito_squash(1.5, 1.5);

//Variável de controle de desenhar outline
outline = false;

//Variavel de controle para dizer minha função
escreve_funcao = false;

//Variável de custo
custo = 15;

//Variável de nivel max
max_nivel = 4

//Variáel de nivel do poder
nivel = 0;

//Variável para salvar o nivel
meu_nivel = nivel;

//Passando minha Função
funcao = "Arvores demoram menos tempo para crescerem totalmente."
  
#endregion

#region Métodos

//Método para melhoras
melhorar = function()
{
    //Passando meu nível
    meu_nivel = global.nivel_av;
    
    //Caso ele clique com o mouse
    if(mouse_check_button_pressed(mb_left) and global.nivel_av < max_nivel and global.dinheiro >= custo and 
        global.arvores == false)
    {
        //Ele melhora a velocidade de crescimento
        global.velocidade_crescimento -= 1;
        
        //Ele diminue o dinheiro
        global.dinheiro -= custo;
        
        //Ele aumenta o valor
        custo *= 2;
        
        //Ele aumenta o nível
        global.nivel_av += 1;
    }
    
    //Caso ele chegue no nível max
    if (global.nivel_av >= 3) 
    {
    	//Então aviso que chegue no maximo
        global.arvores = true;
    }
} 

#endregion
