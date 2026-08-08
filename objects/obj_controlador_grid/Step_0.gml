//Checando se a grid precisa ser atualizada
if(global.precisa_atualizar_grid)
{
    //Uso a função de atualizar a grid
    atualizar_grid();
    
    //Reseto a variavel de controle
    global.precisa_atualizar_grid = false;
}
