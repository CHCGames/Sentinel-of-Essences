//Caso ele não possa desenhar 
if (desenha_hud)
{
    //desenhando a tela preta
    draw_sprite_ext(spr_fundo_preto, image_index, 0, 0, 2, 2, image_angle,
      image_blend, image_alpha); 
    
    //Setando a minha fonte
    draw_set_font(ft_texto);
    
    //Arrumando o x do meu texto
    draw_set_valign(1);
    draw_set_halign(1);
    
    //Setando a cor
    draw_set_colour(c_black);
    
    //escrevendo que perdeu
    draw_text_ext_transformed(room_width/2, 41, "VOCÊ PERDEU! CLIQUE NO BOTÃO PARA REINICIAR!", 60, 600,
     0.3, 0.3, image_angle)
    
    //Resetando a cor
    draw_set_colour(c_white);
       
   //escrevendo que perdeu
    draw_text_ext_transformed(room_width/2, 40, "VOCÊ PERDEU! CLIQUE NO BOTÃO PARA REINICIAR!", 60, 600,
     0.3, 0.3, image_angle)   
    
    
    //Resetando tudo
    draw_set_font(-1);
    draw_set_valign(-1);
    draw_set_halign(-1);
}

//Caso ele não possa desenhar 
if (global.ganhei)
{
    //desenhando a tela preta
    draw_sprite_ext(spr_fundo_preto, image_index, 0, 0, 2, 2, image_angle,
      image_blend, image_alpha); 
    
    //Setando a minha fonte
    draw_set_font(ft_texto);
    
    //Arrumando o x do meu texto
    draw_set_valign(1);
    draw_set_halign(1);
    
    //Setando a cor
    draw_set_colour(c_black);
    
    //escrevendo que perdeu
    draw_text_ext_transformed(room_width/2, 41, "VOCÊ VENCEU! CLIQUE NO BOTÃO PARA CONTINUAR!", 60, 600,
     0.3, 0.3, image_angle)
    
    //Resetando a cor
    draw_set_colour(c_white);
       
   //escrevendo que perdeu
    draw_text_ext_transformed(room_width/2, 40, "VOCÊ VENCEU! CLIQUE NO BOTÃO PARA CONTINUAR!", 60, 600,
     0.3, 0.3, image_angle)   
    
    
    //Resetando tudo
    draw_set_font(-1);
    draw_set_valign(-1);
    draw_set_halign(-1);
}
    

