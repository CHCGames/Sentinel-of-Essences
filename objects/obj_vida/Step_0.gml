if (instance_place(x, y, obj_player) and global.vida_player < global.moldura_vida) 
{
	audio_play_sound(snd_item, 1, false);
    
    global.vida_player += 1;
    
    instance_destroy(id, false);
}
