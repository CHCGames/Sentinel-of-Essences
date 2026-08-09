if (instance_place(x, y, obj_player) or global.ganhei == true) 
{
    audio_play_sound(snd_item, 1, false);
    
    if(global.level_atual >= 2)  valor = 5;
    if(global.level_atual >= 4)  valor = 10;
        
    
	global.dinheiro += valor;
    
    instance_destroy(id, false);
}

if(instance_place(x, y, obj_buraco)) x += 16