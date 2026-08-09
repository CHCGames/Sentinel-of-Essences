//Função para iniciar o efeito squash
function inicia_efeito_squash(_tam_x = 1, _tam_y = 1)
{
	//variavel para desenhar minha escala
	xscale = _tam_x;
	yscale = _tam_y;
}

//Função para definir os valores do efeito squash
function efeito_squash(_xscale = 1, _yscale = 1)
{
	//Mudando o tamanho do player
	xscale = _xscale;
	yscale = _yscale;
}

//Função que reseta os valores das escalas
function retorna_squash(_tam_x = 1, _tam_y = 1)
{
	//Usando o lerp para voltar ao valor original
	xscale = lerp(xscale, _tam_x, 0.4);
	yscale = lerp(yscale, _tam_y, 0.4);
}

//Função para desenhar o efeito squash
function desenha_squash()
{
	//Desenhando o player
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}