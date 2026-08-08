//Aplicando a maquina de estados
maquina_estados();

//Caso destruir for true
if(destruir)
{
   //Ele se destroi
    instance_destroy(id, true); 
}

//Caso colidir com a parede se destroi
if(instance_place(x, y, obj_parede)) instance_destroy(id, true);
    
//Limitando a saida da tela //Ele se destroi
if(x >= 242 or x <= 14) instance_destroy(id, true);
if(y >= 132 or y <= 16) instance_destroy(id, true);