//Criando uma grid
global.grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);

//Definindo quais objetos serão colididoss
mp_grid_add_instances(global.grid, obj_arvore, false);
mp_grid_add_instances(global.grid, obj_tronco_lados, false);
mp_grid_add_instances(global.grid, obj_tronco_vertical, false);
mp_grid_add_instances(global.grid, obj_pedra, false);
mp_grid_add_instances(global.grid, obj_parede, false);
mp_grid_add_instances(global.grid, obj_caixa, false);
mp_grid_add_instances(global.grid, obj_totem, false);
mp_grid_add_instances(global.grid, obj_lava, false);
mp_grid_add_instances(global.grid, obj_cuba, false);
