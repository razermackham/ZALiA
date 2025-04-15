/// build_pal(WHT, *RED, *BLU, *GRN, *YLW, *MGN, *BLK, *CYN)


var                                                            _i=0;
var                                          _C_WHT = p.C_WHT0;
if (argument_count>_i && argument[_i++]!=-1) _C_WHT = argument[_i-1];

var                                          _C_RED = p.C_RED0;
if (argument_count>_i && argument[_i++]!=-1) _C_RED = argument[_i-1];

var                                          _C_BLU = p.C_BLU0;
if (argument_count>_i && argument[_i++]!=-1) _C_BLU = argument[_i-1];

var                                          _C_GRN = p.C_GRN0;
if (argument_count>_i && argument[_i++]!=-1) _C_GRN = argument[_i-1];

var                                          _C_YLW = p.C_YLW0;
if (argument_count>_i && argument[_i++]!=-1) _C_YLW = argument[_i-1];

var                                          _C_MGN = p.C_MGN0;
if (argument_count>_i && argument[_i++]!=-1) _C_MGN = argument[_i-1];

var                                          _C_BLK = p.C_BLK0;
if (argument_count>_i && argument[_i++]!=-1) _C_BLK = argument[_i-1];

var                                          _C_CYN = p.C_CYN0;
if (argument_count>_i && argument[_i++]!=-1) _C_CYN = argument[_i-1];


var _base_color_char, _color;
var _return = "";

var          _COUNT1 = string_length( global.PAL_BASE_COLOR_ORDER);
for(_i=0; _i<_COUNT1; _i++)
{
    _base_color_char = string_char_at(global.PAL_BASE_COLOR_ORDER,_i+1);
    
    switch(_base_color_char){
    default: {_color=color_str(p.C_BLK1); break;}
    case "W":{_color=color_str(_C_WHT); break;}
    case "R":{_color=color_str(_C_RED); break;}
    case "B":{_color=color_str(_C_BLU); break;}
    case "G":{_color=color_str(_C_GRN); break;}
    case "Y":{_color=color_str(_C_YLW); break;}
    case "M":{_color=color_str(_C_MGN); break;}
    case "K":{_color=color_str(_C_BLK); break;}
    case "C":{_color=color_str(_C_CYN); break;}
    }
    
    
    if (1)
    {
        if ((_base_color_char=="Y" && _C_YLW==p.C_YLW0 && _C_WHT!=p.C_WHT0) 
        ||  (_base_color_char=="M" && _C_MGN==p.C_MGN0 && _C_RED!=p.C_RED0) 
        ||  (_base_color_char=="K" && _C_BLK==p.C_BLK0 && _C_BLU!=p.C_BLU0) )
        {
            switch(_base_color_char){
            case "Y":{_color=color_str(_C_WHT); break;}
            case "M":{_color=color_str(_C_RED); break;}
            case "K":{_color=color_str(_C_BLU); break;}
            }
        }
    }
    
    
    _return += _color;
}


return _return;




