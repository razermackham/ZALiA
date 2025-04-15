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




/*
var _return = "";
var          _COUNT1 = string_length(global.PAL_BASE_COLOR_ORDER);
for(_i=0; _i<_COUNT1; _i++)
{
    if (argument_count>_i 
    &&  argument[_i]!=-1 )
    {
        _return += color_str(argument[_i]);
    }
    else
    {
        switch(string_char_at(global.PAL_BASE_COLOR_ORDER,_i+1)){
        default: {_return+=color_str(p.C_BLK0); break;}
        case "W":{_return+=color_str(p.C_WHT0); break;}
        case "R":{_return+=color_str(p.C_RED0); break;}
        case "B":{_return+=color_str(p.C_BLU0); break;}
        case "G":{_return+=color_str(p.C_GRN0); break;}
        case "Y":{_return+=color_str(p.C_YLW0); break;}
        case "M":{_return+=color_str(p.C_MGN0); break;}
        case "K":{_return+=color_str(p.C_BLK0); break;}
        case "C":{_return+=color_str(p.C_CYN0); break;}
        }
    }
}


return _return;
*/




/*/// build_pal(bg pal 1, bg pal 2, bg pal 3, bg pal 4, fg pal 1, fg pal 2, fg pal 3, fg pal 4, *alt menu pal, *alt pc pal)

// Give this (BGR_PAL_COUNT + MOB_PAL_COUNT) palettes and 
// it will build and return a rm palette.
// The string_length of each argument must be (COL_PER_PAL<<1) 
// argument example 'FF30160D'


with(p)
{
    var _return = PAL_BASE;
    
    var _CI0 = hex_str(CI_GRN0);
    var _CI1 = 'FF';
    var _COUNT1 = val(global.dm_pi[?"BGR"+STR_Count]) + val(global.dm_pi[?"MOB"+STR_Count]); // 
    var _count  = 0;
    
    
    
    if (argument_count>_COUNT1 
    &&  argument[      _COUNT1] != -1 )
    {   // alt menu pal
        argument[      _COUNT1]  = string(argument[_COUNT1]);
         _return +=           string_copy(argument[_COUNT1],1,global.PAL_CHAR_PER_PAL);
    }
    else _return += PAL_GUI1+PAL_GUI2+PAL_GUI3+PAL_GUI4;
    
    
    var _len = string_length(_return);
    if (_len&1) {_len--; _return = string_copy(_return,1,_len);}
    
    
    _count   = _len div global.PAL_CHAR_PER_PAL;
    _return  = string_copy(_return,1,_count);
    _len     = string_length(_return);
    _count   = _len div global.PAL_CHAR_PER_PAL;
    _count   = global.PI_PC1 - _count;
    for(_i=0; _i<_count; _i++) // Each missing pal
    {
        _return += string_repeat(_CI0, global.COLORS_PER_PALETTE);
    }
    
    
    _return += PAL_SET_PC_1 + PAL_SET_PC_0 + PAL_SET_CUC1;
    //_return += PAL_SET_PC_A; // PAL_SET_PC_A: PC & CUCCO. rm LIT
    for(var i=0; i<_COUNT1; i++)
    {
        _return += string(argument[i]);
    }
    
    
    return _return;
}



*/




