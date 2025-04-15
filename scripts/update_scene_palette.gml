/// update_scene_palette()


// *** pal_rm_new is the current palette WITHIN the current frame of code. pal_rm_curr is what colors the palette_image currently has as it's not updated until the draw event later
var p.pal_rm_new = string_copy(p.pal_rm_new, 1,global.PAL_CHAR_PER_SCENE);

if (g.rm_brightness==1)
{   // When a scene is semi-lit, you can only see the bright colors of enemies. Make sure the palettes they use have the same color from the lit version as this color can depend on the particular scene.
    p.pal_rm_new = strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_ORG+p.PI_DRK1,"W"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(p.pal_rm_new,global.PI_MOB_ORG,"R")));
    p.pal_rm_new = strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_RED+p.PI_DRK1,"W"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(p.pal_rm_new,global.PI_MOB_RED,"R")));
    p.pal_rm_new = strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_BLU+p.PI_DRK1,"W"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(p.pal_rm_new,global.PI_MOB_BLU,"R")));
    p.pal_rm_new = strReplaceAt(p.pal_rm_new, get_pal_col_pos(global.PI_MOB_PUR+p.PI_DRK1,"W"), global.PAL_CHAR_PER_COLOR, color_str(get_pal_color(p.pal_rm_new,global.PI_MOB_PUR,"R")));
}




var _COUNT1 = val(global.dm_pi[?STR_Permutation+STR_Count]);
if (_COUNT1)
{
    var _i,_j;
    var _palette, _char, _pos;
    var _pi, _parent_pi,_parent_pal_pos, _order;
    for(_i=0; _i<_COUNT1; _i++) // each pi permut
    {
        _pi        = val(global.dm_pi[?STR_Permutation+hex_str(_i+1)+STR_Palette+STR_Index]);
        _parent_pi = val(global.dm_pi[?hex_str(_pi)+"_Parent"+STR_Palette+STR_Index]);
        _order     = val(global.dm_pi[?hex_str(_pi)+STR_Color+STR_Order]);
        _parent_pal_pos = get_pal_pos(_parent_pi);
        _palette = "";
        for(_j=0; _j<global.COLORS_PER_PALETTE; _j++) // each color
        {
            _char = string_char_at(_order, _j+1);
            _pos  = string_pos(_char, global.PAL_BASE_COLOR_ORDER);
            _pos  = max(0,_pos-1);
            _pos *= global.PAL_CHAR_PER_COLOR;
            _pos  = _parent_pal_pos + _pos;
            _palette += string_copy(p.pal_rm_new, _pos, global.PAL_CHAR_PER_COLOR);
        }
        
        p.pal_rm_new += _palette;
    }
}


return p.pal_rm_new;




/*
var _COUNT1 = ds_grid_width(global.dg_pi_permuts);
for(_i=0; _i<_COUNT1; _i++) // each pi permut
{
    _palette = "";
    for(_j=0; _j<global.COLORS_PER_PALETTE; _j++) // each color
    {
        _char = string_char_at(global.dg_pi_permuts[#_i,2], _j+1); // 2: color order
        _pos  = string_pos(_char, global.PAL_BASE_COLOR_ORDER);
        _pos  = max(0,_pos-1);
        _pos *= global.PAL_CHAR_PER_COLOR;
        _pos  = get_pal_pos(global.dg_pi_permuts[#_i,1]) + _pos; // 1: parent pi
        _palette += string_copy(p.pal_rm_new, _pos, global.PAL_CHAR_PER_COLOR);
    }
    
    p.pal_rm_new += _palette;
}
*/




