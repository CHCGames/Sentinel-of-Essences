#region Varíaveis globais

//Variável de desbloqueio de poder arvores agora geram troncos
global.gerar_troncos = true;

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
