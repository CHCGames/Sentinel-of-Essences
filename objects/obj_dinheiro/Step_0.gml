if (instance_place(x, y, obj_player)) 
{
    if(global.level_atual >= 2)  valor = 10;
    if(global.level_atual >= 4)  valor = 15;
        
    
	global.dinheiro += valor;
    
    instance_destroy(id, false);
}
