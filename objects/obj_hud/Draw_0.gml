//Pegando o meu x
var _x_1 = 8;
var _x_2 = 8

//Pegando meu y
var _y = 136


//Repteindo 3 vezes
repeat(global.moldura_vida) 
{
    //Criando minha moldura
    draw_sprite(spr_moldura_vida, image_index, _x_2, _y);
       
    //Aumentando minha posição
    _x_2 += 15
}

//Repetindo conforme o número de vidas
repeat (global.vida_player) 
{
	//Criando minha vida
    draw_sprite(spr_vida, image_index, _x_1, _y);
    
    //Aumentando minha posição
    _x_1 += 15
}
