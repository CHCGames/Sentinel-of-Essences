//Zerando o meu alpha
image_alpha = 0;

//Variável de controle de desenhar hud
desenha_hud = false;

//Método para criar o hud de level
cria_hud = function()
{
    //Caso ele morra
    if(global.game_pause)
    {
        //Avisando que posso desenhar o hud
        desenha_hud = true;
        
        //Fazendo efeito de escurecer
        image_alpha = lerp(image_alpha, 0.7, 0.1);
        
        //Criando o Botão de reiniciar
        instance_create_layer(room_width/2, 100, "botoes", obj_botao_voltar);
        
    }
}


//Função para ganhar
ganhar = function()
{
    //Caso não exista nenhum inimigo
    if(!instance_exists(obj_mago_tapete))
    {
        //aviso que ganhei
        global.ganhei = true;
        
        //Fazendo efeito de escurecer
        image_alpha = lerp(image_alpha, 0.7, 0.1);
        
        //restando a vida do player
        global.vida_player = global.moldura_vida;
        
        //Criando o Botão de reiniciar
        instance_create_layer(room_width/2, 100, "botoes", obj_botao_avancar);
        
    }
}