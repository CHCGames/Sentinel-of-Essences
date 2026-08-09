if (instance_place(x, y, obj_player)) 
{
	global.dinheiro += valor;
    
    instance_destroy(id, false);
}
