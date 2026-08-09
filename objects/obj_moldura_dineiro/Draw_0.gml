//Me desenhando 
draw_self();

//Setando a minha fonte
draw_set_font(ft_texto);

//Arrumando o x do meu texto
draw_set_valign(1);
draw_set_halign(1);

//Setando a cor
draw_set_colour(c_black);

//Escrevo em baixo
draw_text_ext_transformed(x + 1, y - 3, string(global.dinheiro), 20, 200, 0.13, 0.13, image_angle);

//Resetando a cor
draw_set_colour(c_white);
   
//Escrevo em baixo
draw_text_ext_transformed(x + 1, y - 4, string(global.dinheiro), 20, 200, 0.13, 0.13, image_angle);
   
//Resetando tudo
draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);