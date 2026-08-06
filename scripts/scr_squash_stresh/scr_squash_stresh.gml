//Função para iniciar o efeito squash
function inicia_efeito_squash()
{
	//variavel para desenhar minha escala
	xscale = 1;
	yscale = 1;
}

//Função para definir os valores do efeito squash
function efeito_squash(_xscale = 1, _yscale = 1)
{
	//Mudando o tamanho do player
	xscale = _xscale;
	yscale = _yscale;
}

//Função que reseta os valores das escalas
function retorna_squash()
{
	//Usando o lerp para voltar ao valor original
	xscale = lerp(xscale, 1, 0.4);
	yscale = lerp(yscale, 1, 0.4);
}

//Função para desenhar o efeito squash
function desenha_squash()
{
	//Desenhando o player
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}