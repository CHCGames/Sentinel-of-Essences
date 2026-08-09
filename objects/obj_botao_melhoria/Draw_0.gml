//Desenhando o efeito squash
desenha_squash();

//Desenhando a outline
if(outline and atingi_nivel_max == false) draw_sprite_ext(spr_icones_loja_masca, image_index, x, y, xscale, yscale, image_angle, 
    image_blend, image_alpha);

//Caso ele chegue no nível max
if(atingi_nivel_max == true) draw_sprite_ext(spr_icones_loja_mascara, image_index, x, y, xscale, yscale, image_angle,
    image_blend, 0.5);
