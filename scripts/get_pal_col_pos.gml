/// get_pal_col_pos(palette index, color order char)


var _pos  = string_pos(string(argument1),global.PAL_BASE_COLOR_ORDER) - 1;
    _pos *= global.PAL_CHAR_PER_COLOR;
return get_pal_pos(argument0) + _pos;




