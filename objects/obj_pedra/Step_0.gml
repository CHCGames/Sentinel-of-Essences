//Aplicando a maquina de estados
maquina_estados();

//Caso destruir for true
if(destruir)
{
   //Ele se destroi
    instance_destroy(id, true); 
}

//Limitando a saida da tela //Ele se destroi
if(x >= 242 or x <= 14) instance_destroy(id, true);
if(y >= 132 or y <= 16) instance_destroy(id, true);