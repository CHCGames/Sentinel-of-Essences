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
draw_text_ext_transformed(x, y + 19, string(global.dinheiro), 20, 200, 0.1, 0.1, image_angle);

//Resetando a cor
draw_set_colour(c_white);
   
//Escrevo em baixo
draw_text_ext_transformed(x, y + 18, string(global.dinheiro), 20, 200, 0.1, 0.1, image_angle);
   
//Resetando tudo
draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);