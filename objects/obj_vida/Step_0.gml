if (instance_place(x, y, obj_player) and global.vida_player < global.moldura_vida) 
{
	global.vida_player += 1;
    
    instance_destroy(id, false);
}
