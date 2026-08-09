//Setando a minha fonte
draw_set_font(ft_texto);

//Definindo a posição do texto
draw_set_valign(1);
draw_set_halign(1);

//Defindo minha cor
draw_set_colour(c_black);

//Desenhando meu texto
draw_text_ext_transformed(92, 26, "Use as SETINHAS para se mover!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(92, 63, "Use o ESPAÇO para Atacar! E caso algo der errado aperte (R) para reinicar a fase", 60, 480, 0.09, 0.09, 0);
draw_text_ext_transformed(79, 96, "Este é o ícone da loja! Clique e Teste!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(79, 127, "Este é o ícone de Voltar! Clique e Teste!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(184, 128, "Seu objetivo é matar todos inimigos para passar de fase! Mas o seu ataque não tem efeito contra seus inimigos. Quem sabe você possa usar o cenário ao seu favor? Pegue Essências Azuis para comprar melhorias na Loja!", 60, 1300, 0.08, 0.08, 0);
//Resetando minha cor
draw_set_colour(c_white);

//Desenhando meu texto
draw_text_ext_transformed(92, 25, "Use as SETINHAS para se mover!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(92, 62, "Use o ESPAÇO para Atacar! E caso algo der errado aperte (R) para reinicar a fase", 60, 480, 0.09, 0.09, 0);
draw_text_ext_transformed(79, 95, "Este é o ícone da loja! Clique e Teste!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(79, 126, "Este é o ícone de Voltar! Clique e Teste!", 60, 450, 0.1, 0.1, 0);
draw_text_ext_transformed(184, 127, "Seu objetivo é matar todos inimigos para passar de fase! Mas o seu ataque não tem efeito contra seus inimigos. Quem sabe você possa usar o cenário ao seu favor? Pegue Essências Azuis para comprar melhorias na Loja!", 60, 1300, 0.08, 0.08, 0);


//Resetando minha fonte
draw_set_font(-1);

//Resetando minhas posições
draw_set_valign(-1);
draw_set_halign(-1);