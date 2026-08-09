#region Varíaveis globais

//Variável de desbloqueio de poder arvores agora geram troncos
global.gerar_troncos = false;

//Variável de criar bombas
global.cria_dinamites = false;
global.cria_bombas = false;

//Variável de poder de cair livros
global.cair_livros = false;

//Variável de poder de criar arvores
global.cria_arvores = false;

//Variável de velocidade de crescimento das arvores
global.velocidade_crescimento = 3;

//Variável de vida do player
global.vida_player = 3;

//Variável de melhoria de distancia do ataque
global.distancia_atq = 0;

//Variável de dinheiro
global.dinheiro = 0;

//Variável de nível da distancia do poder
global.nivel_poder = 0;

//Varíavel de nível de velocidade de crescimento da arvore
global.nivel_crescimento = 0;

//Variável de nivel de criar troncos
global.nivel_troncos = 0;

//Variável de nivel de criar arvores
global.nivel_cria_arvores = 0;

//Variável de nivel de aumentar vida
global.nivel_vida = 0;

//Variável de nivel de livros
global.nivel_livros = 0;

//Variável de nivel de bombas
global.nivel_bombas = 0;

//Variavel de controle de atualização da grid
global.precisa_atualizar_grid = false;


#endregion

#region Funções

//Criando uma função para atualizar grid
function atualizar_grid()
{
    //Limpando a gride atual
    mp_grid_clear_all(global.grid);
    
    //Definindo quais objetos serão colididoss
    mp_grid_add_instances(global.grid, obj_arvore, false);
    mp_grid_add_instances(global.grid, obj_tronco_lados, false);
    mp_grid_add_instances(global.grid, obj_tronco_vertical, false);
    mp_grid_add_instances(global.grid, obj_pedra, false);
    mp_grid_add_instances(global.grid, obj_parede, false);
    mp_grid_add_instances(global.grid, obj_caixa, false);
}

//Função para checar se acabou animação
function troca_sprite(_sprite)
{
     //Definindo a sprite
    if (sprite_index != _sprite)
    {
        //troco a sprite
        sprite_index = _sprite;
        
        //zero a animação
        image_index = 0;
    } 
}

//Função para trocar sprite
function acabou_animacao()
{
    //variavel temporaria para o fps
    var _spd = sprite_get_speed(sprite_index) / FPS;
    
    //Se o image index mais a velocidade da sprite for maior ou igual
    if (image_index + _spd >= image_number)
    {
        //Ele retorna true
        return true;
    }
}


#endregion

#region Macros

//Macro para pegar os segundo conforme o fps
#macro FPS game_get_speed(gamespeed_fps) 

#endregion
