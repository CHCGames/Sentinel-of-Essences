//Criando o efeito de explosao
instance_create_layer(x, y, "Efeitos", obj_efeito_explosao);

//Chance de dropar vida
var _chance = irandom_range(0, 100);

//ele tem 10 porcento de chance
if(_chance < 95)
{
    //Criando a vida
    instance_create_layer(x, y, "Player", obj_dinheiro);
}
//ele tem 10 porcento de chance
else if (_chance > 95)
{
    //Criando a vida
    instance_create_layer(x, y, "Player", obj_vida);
}



//Destruindo o path
path_delete(meu_path);