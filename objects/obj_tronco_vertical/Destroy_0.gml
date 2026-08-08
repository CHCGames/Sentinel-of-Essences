//Criando o efeito de explosao
instance_create_layer(x, y, "Efeitos", obj_efeito_explosao);

//Avisando que precisa atualizar a grid
global.precisa_atualizar_grid = true;