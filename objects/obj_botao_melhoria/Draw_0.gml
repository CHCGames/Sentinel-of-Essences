//Desenhando o efeito squash
desenha_squash();

//Desenhando a molduras em baixo de mim
draw_sprite(spr_moldura_pequena, image_index, x, y + 21);

//Desenhando a outline
if(outline and atingi_nivel_max == false) draw_sprite_ext(spr_icones_loja_outline, image_index, x, y, xscale, yscale, image_angle, 
    image_blend, image_alpha);

//Caso ele chegue no nível max
if(atingi_nivel_max == true) draw_sprite_ext(spr_icones_loja_mascara, image_index, x, y, xscale, yscale, image_angle,
    image_blend, 0.5);

//Caso ele chegue no nivel maximo
if(atingi_nivel_max == true)
{
    //Setando a minha fonte
    draw_set_font(ft_texto);
    
    //Arrumando o x do meu texto
    draw_set_valign(1);
    draw_set_halign(1);
    
    //Escrevo em baixo
    draw_text_ext_transformed(x, y - 4, "Max", 20, 200, 0.1, 0.1, image_angle);
    
    //Resetando tudo
    draw_set_font(-1);
    draw_set_valign(-1);
    draw_set_halign(-1);
    
}

//Setando a minha fonte
draw_set_font(ft_texto);

//Arrumando o x do meu texto
draw_set_valign(1);
draw_set_halign(1);

//Setando a cor
draw_set_colour(c_black);

//Escrevo em baixo
draw_text_ext_transformed(x, y + 19, "Nível: " + string(meu_nivel), 20, 200, 0.1, 0.1, image_angle);

//Resetando a cor
draw_set_colour(c_white);
   
//Escrevo em baixo
draw_text_ext_transformed(x, y + 18, "Nível: " + string(meu_nivel), 20, 200, 0.1, 0.1, image_angle);
   
//Resetando tudo
draw_set_font(-1);
draw_set_valign(-1);
draw_set_halign(-1);
