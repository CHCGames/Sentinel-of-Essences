#region Varíaveis

//criando um path
meu_path = path_add();

//Variavel de estados
estado = "parado";

//Variavel de posição
posicao = 1;

//Variável de proxima posição
next_x = x;
next_y = y;

//Variavel de controle de movimento
move = false;

//Variável de tempo de andar
tempo_andar = FPS * irandom_range(1, 2);

//Variável de delei de andar
delei_andar = tempo_andar;

//Fazendo o array de colisoes
colisoes = [obj_dano, obj_tronco_lados, obj_tronco_vertical, obj_pedra, obj_caixa];


#endregion

#region Métodos

//Fazendo Método de colisão
colisao = function()
{
    //Se ele colidir com qualquer item do array
    if(instance_place(x, y + 1, colisoes))
    {
        //Ele se destroi
        instance_destroy(id, true);
    }
    //Se ele colidir com qualquer item do array
    if(instance_place(x, y - 1, colisoes))
    {
        //Ele se destroi
        instance_destroy(id, true);
    }
    //Se ele colidir com qualquer item do array
    if(instance_place(x - 1, y, colisoes))
    {
        //Ele se destroi
        instance_destroy(id, true);
    }
    //Se ele colidir com qualquer item do array
    if(instance_place(x + 1, y, colisoes))
    {
        //Ele se destroi
        instance_destroy(id, true);
    }
}

//Criando o método de movimento
movimento = function()
{ 
    //Dando uma distancia para perseguir
    var _distancia = point_distance(x, y, obj_player.x, obj_player.y)
    
    //Caso a distancia dele do player seja menor que 50
    if(_distancia < 250)
    {
          //Estou usando um path para ele seguir o player
          if(mp_grid_path(global.grid, meu_path, x, y, obj_player.x, obj_player.y, false))
          {
              //Passando minha posição
              posicao = 1;
              
              //avisando que posso me mover
              move = true;
          }
          
          //Caso ele esteja se movendo
          if(move)
          {
              //Diminuindo o delei de andar
              delei_andar--;
              
              //Caso o delei acabe
              if (delei_andar <= 0) 
              {
                    //Caso minha posição for menor do que a que tenho que ir
                    if(posicao < path_get_number(meu_path)) 
                    {
                        //Pegando a posições x e y
                        var _x = path_get_point_x(meu_path, posicao);
                        var _y = path_get_point_y(meu_path, posicao);
                        
                        //Passando para a minha proxima posicao os valores do x e y
                        next_x = _x;
                        next_y = _y;
                        
                        //Variável temporaria de controle
                        var _andar = true;
                           
                        //Fazendo ele não entrar no quadadrado do player
                        if(place_meeting(next_x, next_y, obj_mago_tapete))
                        {
                            //Falando que ele não pode andar
                            _andar = false;
                            
                        }
                        else if(_andar) //Ao contrario
                        {
                            //Trocando as sprites
                            if(y < _y) troca_sprite(spr_mago_tp_parado_baixo);
                            if(y > _y) troca_sprite(spr_mago_tp_parado_cima);
                            if(x > _x) troca_sprite(spr_mago_tp_parado_esquerda);
                            if(x < _x) troca_sprite(spr_mago_tp_parado_direita);
                            
                            //Passando a posição do meu path para meu x e y
                            x = _x;
                            y = _y;
                        }
                        
                        //Aumentando o valor da minha posição
                        posicao++;
                               
                        //Resetando meu delei
                        delei_andar = tempo_andar;
                    }
                    else //Ao contrario
                    {
                        //Eu não me movo
                        move = false;
                    }
              }
          } 
    }
}


#endregion