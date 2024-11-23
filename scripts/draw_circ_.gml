/// draw_circ_(color, x, y, radius, *alpha, *outline);


var                   _ALPHA    = 1;
if (argument_count>4) _ALPHA    = argument[4];

var                   _OUTLINE  = false;
if (argument_count>5) _OUTLINE  = argument[5];


draw_set_alpha( _ALPHA);
draw_set_colour(argument[0]);

draw_circle(    argument[1]-1,  // x
                argument[2]-1,  // y
                argument[3],    // radius
                _OUTLINE);      // outline
//
draw_set_alpha(1);




