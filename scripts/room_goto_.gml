/// room_goto_(room, *width, *height)


var                                  _view_w = g.VIEW_W;
if (argument_count>1 && argument[1]) _view_w = clamp(argument[1], 256, 1024);

var                                  _view_h = g.VIEW_H;
if (argument_count>2 && argument[2]) _view_h = clamp(argument[2], 256, 1024);

sdm("room_goto_(). "+room_get_name(argument[0]));
global.room_switcher_next_room = argument[0];
global.room_switcher_next_width = _view_w;
global.room_switcher_next_height = _view_h;
room_goto(rm_Switcher);




