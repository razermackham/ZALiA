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


var _val, _base_color_char, _color;
var _return = "";

for(_i=0; _i<global.COLORS_PER_PALETTE; _i++)
{
    _base_color_char = string_char_at(global.PAL_BASE_COLOR_ORDER,_i+1);
    
    switch(_base_color_char){
    default: {_color=p.C_BLK1; break;}
    case "W":{_color=_C_WHT; break;}
    case "R":{_color=_C_RED; break;}
    case "B":{_color=_C_BLU; break;}
    case "G":{_color=_C_GRN; break;}
    case "Y":{_color=_C_YLW; break;}
    case "M":{_color=_C_MGN; break;}
    case "K":{_color=_C_BLK; break;}
    case "C":{_color=_C_CYN; break;}
    }
    
    if (_color==-2)
    {
        switch(_base_color_char){
        case "W":{_color=p.C_WHT0; break;}
        case "R":{_color=p.C_RED0; break;}
        case "B":{_color=p.C_BLU0; break;}
        case "G":{_color=p.C_GRN0; break;}
        case "Y":{_color=_C_WHT; break;}
        case "M":{_color=_C_RED; break;}
        case "K":{_color=_C_BLU; break;}
        case "C":{_color=_C_GRN; break;}
        /*
        case "Y":{_color=max(0,_C_WHT); break;}
        case "M":{_color=max(0,_C_RED); break;}
        case "K":{_color=max(0,_C_BLU); break;}
        case "C":{_color=max(0,_C_GRN); break;}
        */
        }
    }
    /*
    if ((_base_color_char=="Y" && _C_YLW==p.C_YLW0 && _C_WHT!=p.C_WHT0) 
    ||  (_base_color_char=="M" && _C_MGN==p.C_MGN0 && _C_RED!=p.C_RED0) 
    ||  (_base_color_char=="K" && _C_BLK==p.C_BLK0 && _C_BLU!=p.C_BLU0) )
    {
        switch(_base_color_char){
        case "Y":{_color=_C_WHT; break;}
        case "M":{_color=_C_RED; break;}
        case "K":{_color=_C_BLU; break;}
        }
    }
    */
    
    
    _return += color_str(_color);
}


return _return;




/*
/// build_pal(WHT, *RED, *BLU, *GRN, *YLW, *MGN, *BLK, *CYN)


var                                      _i=0;
var                    _C_WHT = p.C_WHT0;
if (argument_count>_i) _C_WHT = argument[_i++];

var                    _C_RED = p.C_RED0;
if (argument_count>_i) _C_RED = argument[_i++];

var                    _C_BLU = p.C_BLU0;
if (argument_count>_i) _C_BLU = argument[_i++];

var                    _C_GRN = p.C_GRN0;
if (argument_count>_i) _C_GRN = argument[_i++];

var                    _C_YLW = p.C_YLW0;
if (argument_count>_i) _C_YLW = argument[_i++];

var                    _C_MGN = p.C_MGN0;
if (argument_count>_i) _C_MGN = argument[_i++];

var                    _C_BLK = p.C_BLK0;
if (argument_count>_i) _C_BLK = argument[_i++];

var                    _C_CYN = p.C_CYN0;
if (argument_count>_i) _C_CYN = argument[_i++];


var _val, _base_color_char, _color;
var _return = "";

for(_i=0; _i<global.COLORS_PER_PALETTE; _i++)
{
    _base_color_char = string_char_at(global.PAL_BASE_COLOR_ORDER,_i+1);
    
    switch(_base_color_char){
    default: {_val=p.C_BLK1; break;}
    case "W":{_val=_C_WHT; break;}
    case "R":{_val=_C_RED; break;}
    case "B":{_val=_C_BLU; break;}
    case "G":{_val=_C_GRN; break;}
    case "Y":{_val=_C_YLW; break;}
    case "M":{_val=_C_MGN; break;}
    case "K":{_val=_C_BLK; break;}
    case "C":{_val=_C_CYN; break;}
    }
    
    if (_val==-1) // _val==-1: use base color
    {
        switch(_base_color_char){
        default: {_val=p.C_BLK1; break;}
        case "W":{_val=p.C_WHT0; break;}
        case "R":{_val=p.C_RED0; break;}
        case "B":{_val=p.C_BLU0; break;}
        case "G":{_val=p.C_GRN0; break;}
        case "Y":{_val=p.C_YLW0; break;}
        case "M":{_val=p.C_MGN0; break;}
        case "K":{_val=p.C_BLK0; break;}
        case "C":{_val=p.C_CYN0; break;}
        }
    }
    else
    {
        switch(_base_color_char){ // _val==-2: use for YMKC only, indicates to use color tone equivilant color
        case "W":{if (_C_WHT<0){_val=p.C_WHT0;} break;}
        case "R":{if (_C_RED<0){_val=p.C_RED0;} break;}
        case "B":{if (_C_BLU<0){_val=p.C_BLU0;} break;}
        case "G":{if (_C_GRN<0){_val=p.C_GRN0;} break;}
        case "Y":{if (_C_WHT>=0 && _C_WHT!=p.C_WHT0 && (_C_YLW==p.C_YLW0 || _C_YLW==-2)){_val=_C_WHT;} break;}
        case "M":{if (_C_RED>=0 && _C_RED!=p.C_RED0 && (_C_MGN==p.C_MGN0 || _C_MGN==-2)){_val=_C_RED;} break;}
        case "K":{if (_C_BLU>=0 && _C_BLU!=p.C_BLU0 && (_C_BLK==p.C_BLK0 || _C_BLK==-2)){_val=_C_BLU;} break;}
        case "C":{if (_C_GRN>=0 && _C_GRN!=p.C_GRN0 && (_C_CYN==p.C_CYN0 || _C_CYN==-2)){_val=_C_GRN;} break;}
        }
    }
    
    
    _return += color_str(max(0,_val));
}


return _return;
*/
