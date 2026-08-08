//Aplicando a maquina de estados
maquina_estados();

//Caso ele possa se destruir
if(destruir)
{
    //ele se destroi
    instance_destroy(id, true);
}

//Caso algo colidir com ele
if(instance_place(x, y, obj_tronco_vertical)) instance_destroy(id, true);

//Limitando a saida da tela //Ele se destroi
if(x >= 238 or x <= 14) instance_destroy(id, true);
if(y >= 126 or y <= 16) instance_destroy(id, true);
   
//Caso eu surja e tenha um objeto em baixo de mim
if (place_meeting(xstart, ystart, obj_tronco_vertical)) estado = choose("caindo_direita", "caindo_esquerda");
   




