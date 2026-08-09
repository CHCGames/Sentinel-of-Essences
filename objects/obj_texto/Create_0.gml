//Variável de controle de esscrever
escrever = false;

//Dando tempo do alarme
alarm[0] = FPS/3;

//Pegando a largura da minha view
var _larg_view = camera_get_view_width(view_camera[0]);

//Pegando o altura da minha view
var _alt_view = camera_get_view_height(view_camera[0])

//dando o tamanho da minha gui
display_set_gui_size(_larg_view, _alt_view);