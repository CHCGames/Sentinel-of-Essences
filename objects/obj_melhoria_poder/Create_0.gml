#region Variáveis

//Zerando a animação
image_speed = 0;

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
    meu_nivel = global.nv_poder;
    
    //Caso ele clique com o mouse
    if(mouse_check_button_pressed(mb_left) and global.nv_poder < max_nivel and global.dinheiro >= custo and 
        global.poder == false)
    {
        //Ele melhora a velocidade de crescimento
        global.distancia_atq += 16;
        
        //Ele diminue o dinheiro
        global.dinheiro -= custo;
        
        //Ele aumenta o valor
        custo *= 2;
        
        //Ele aumenta o nível
        global.nv_poder += 1;
    }
    
    //Caso ele chegue no nível max
    if (global.nv_poder >= 3) 
    {
    	//Então aviso que chegue no maximo
        global.poder = true;
    }
} 

#endregion
