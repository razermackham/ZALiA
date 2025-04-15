/// change_pal(new pal)


with(p)
{
    pal_rm_new = argument0;
    // re-build all the permut pi's in case they've changed in the middle of the frame
    update_scene_palette();
    
    return pal_rm_new;
}




/*
    var _count = COL_PER_SCENE * PAL_CHAR_PER_COLOR;
    var _PAL_NEW =string_copy(argument0,  1,_count);
    
    if (_PAL_NEW==string_copy(pal_rm_curr,1,_count))
    {
        return argument0;
    }
    
    
    var _i;
    var _pos;
    var _h, _m, _s; // Highlight, Mid-tone, Shadow
    if (p.PAL_SYS_VER==4) var _COLOR1 = hex_str(C_BLK1); // 
    else                  var _COLOR1 = CI_BLK1_; // CI_BLK1_="0D"
    
    pal_rm_new = _PAL_NEW;
    var _LEN = string_length(pal_rm_new);
    
    // Truncate last character if there's an odd number of characters
    if (_LEN&$1)
    {
        _LEN--;
        pal_rm_new = string_copy(pal_rm_new,1,_LEN);
    }
    
    
    _count = COL_PER_SCENE * PAL_CHAR_PER_COLOR;
    if (_LEN<_count)
    {
        if (p.PAL_SYS_VER==4) var _val = hex_str(C_ERR0);
        else                  var _val = CI_ERR0_;
        pal_rm_new += string_repeat(_val, (_count-_LEN) div PAL_CHAR_PER_COLOR);
    }
    
    pal_rm_new = string_copy(pal_rm_new,1,_count);
    
    
    // Add permutations
                 _count = PAL_PER_SCENE;
    for(_i=0; _i<_count; _i++)
    {
        _pos = (_i*global.COLORS_PER_PALETTE) * PAL_CHAR_PER_COLOR;
        _pos++; // ++ because string
        
        _h = string_copy(pal_rm_new, _pos+(PAL_CHAR_PER_COLOR*1), PAL_CHAR_PER_COLOR); // _h: Highlight
        _m = string_copy(pal_rm_new, _pos+(PAL_CHAR_PER_COLOR*2), PAL_CHAR_PER_COLOR); // _m: Mid-tone
        _s = string_copy(pal_rm_new, _pos+(PAL_CHAR_PER_COLOR*3), PAL_CHAR_PER_COLOR); // _s: Shadow
        
        // 1st one is copy of base permutation
        pal_rm_new += _COLOR1 + _h + _m + _s; // HMS
        pal_rm_new += _COLOR1 + _h + _s + _m; // HSM
        
        pal_rm_new += _COLOR1 + _m + _h + _s; // MHS
        pal_rm_new += _COLOR1 + _m + _s + _h; // MSH
        
        pal_rm_new += _COLOR1 + _s + _h + _m; // SHM
        pal_rm_new += _COLOR1 + _s + _m + _h; // SMH
    }
*/




