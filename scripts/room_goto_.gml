/// room_goto_(room, *width, *height)


var                                  _view_w = g.VIEW_W;
if (argument_count>1 && argument[1]) _view_w = clamp(argument[1], 256, 1024);

var                                  _view_h = g.VIEW_H;
if (argument_count>2 && argument[2]) _view_h = clamp(argument[2], 256, 1024);


global.room_switcher_next_room = argument[0];
global.room_switcher_next_width = _view_w;
global.room_switcher_next_height = _view_h;
room_goto(rm_Switcher);




/*
/// room_goto_(room, *width, *height)


var                   _W = g.VIEW_W;
if (argument_count>1) _W = argument[1];
//
var                   _H = g.VIEW_H;
if (argument_count>2) _H = argument[2];
//
room_set_view_(argument[0], _W,_H);
room_goto(     argument[0]);
*/




