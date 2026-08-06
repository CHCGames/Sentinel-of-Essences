#region Variáveis do shake

//Variavel de potencia do shake
global.shake = 0;

#endregion

#region Funções do shake

//Função para tremer a tela
treme_tela = function()
{
	//Se o global shake for maior que 0
	if (global.shake > 0.1)
	{	
		//Variáveis para fazer ele tremer alternado entre valores positivos e negativos
		var _x = random_range(-global.shake, global.shake);
		var _y = random_range(-global.shake, global.shake);
		
		//Mechendo o view port
		view_set_xport(view_current, _x);
		view_set_yport(view_current, _y);
		
	}
	else //Caso ele não seja maior que zero
	{
		//Zerando o valor do shake
		global.shake = 0;
		
		//Garantindo que a posição da minha view é zerada também
		view_set_xport(view_current, 0);
		view_set_yport(view_current, 0);
		
	}
	
	//Fazendo ele parar de tremer aos poucos
	global.shake = lerp(global.shake, 0, 0.1);
}

#endregion
