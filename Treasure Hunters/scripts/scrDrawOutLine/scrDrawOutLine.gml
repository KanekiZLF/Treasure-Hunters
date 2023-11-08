// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Desenha uma linha envolta do texto
function scrDrawOutLine() {
    //Created by Andrew McCluskey http://nalgames.com/
 
    ///@param x
    ///@param y
    ///@param str
    ///@param outwidth
    ///@param outcol
    ///@param outfidelity
    ///@param separation
    ///@param width
	///@param xscale
	///@param yscale
    ///@param angle 

    //2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
    var dto_dcol = draw_get_color();
 
    draw_set_color(argument4);
    for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
    {
      //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
      //draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
	  draw_text_ext_transformed (
	  argument0+lengthdir_x(argument3,dto_i),
	  argument1+lengthdir_y(argument3,dto_i),
	  argument2,
	  argument6,
	  argument7, 
	  argument8, 
	  argument9, 
	  argument10
	  );
    }
 
    draw_set_color(dto_dcol);
 
    //draw_text_ext(argument0,argument1,argument2,argument6,argument7);
	draw_text_ext_transformed (
	argument0, 
	argument1, 
	argument2, 
	argument6, 
	argument7, 
	argument8, 
	argument9, 
	argument10
	);
}