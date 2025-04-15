/// build_pal(bg pal 1, bg pal 2, bg pal 3, bg pal 4, fg pal 1, fg pal 2, fg pal 3, fg pal 4, *alt menu pal, *alt pc pal)

// Give this (BGR_PAL_COUNT + MOB_PAL_COUNT) palettes and 
// it will build and return a rm palette.
// The string_length of each argument must be (COL_PER_PAL<<1) 
// argument example 'FF30160D'


with(p)
{
    var _i;
    var _return = PAL_BASE;
    
    var _CI0 = hex_str(CI_GRN0);
    var _CI1 = 'FF';
    var _COUNT1 = BGR_PAL_COUNT + MOB_PAL_COUNT; // 
    var _COUNT2 = COL_PER_PAL<<1; // num of string chars in 1 palette
    var _count  = 0;
    
    
    
    if (argument_count>_COUNT1 
    &&  argument[      _COUNT1] != -1 )
    {   // alt menu pal
        argument[      _COUNT1]  = string(argument[_COUNT1]);
         _return +=           string_copy(argument[_COUNT1],1,_COUNT2);
    }
    else _return += PAL_MENU;
    
    
    var _len = string_length(_return);
    if (_len&1) {_len--; _return = string_copy(_return,1,_len);}
    
    
    _count   = _len div _COUNT2;
    _return  = string_copy(_return,1,_count);
    _len     = string_length(_return);
    _count   = _len div _COUNT2;
    _count   = PI_PC_1 - _count;
    for(_i=0; _i<_count; _i++) // Each missing pal
    {
        _return += string_repeat(_CI0, COL_PER_PAL);
    }
    
    
    
    _return += PAL_SET_PC_A; // PAL_SET_PC_A: PC & CUCCO. rm LIT
    for(_i=0; _i<max(_COUNT1,argument_count); _i++)
    {
        _return += string(argument[_i]);
    }
    
    
    return _return;
}




