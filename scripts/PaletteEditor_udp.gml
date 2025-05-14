/// PaletteEditor_udp()


var _i,_j, _xl,_yt, _pi, _color, _dk;
var _XL0 = viewXL();
var _YT0 = viewYT();


gui_xl = _XL0 + gui_XLOFF;
gui_yt = _YT0 + gui_YTOFF;




if (global.palette_image_IS_SURFACE)
{    if(!surface_exists(global.palette_image)) PalView_enabled = false;  }
else if(!sprite_exists( global.palette_image)) PalView_enabled = false;


if (PalView_enabled)
{
    PalView_w = global.palette_image_w * PalView_SCALE1;
    PalView_h = global.palette_image_h * PalView_SCALE1;
    PalView_xl = gui_xl;
    PalView_yt = gui_yt;
}




if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    if (state==state_EDIT1A 
    ||  state==state_EDIT1B )
    {
        PalEdit_xl = _XL0   + PalEdit_X_BASE;
        PalEdit_yt = gui_yt - PalEdit_Outline_W;
    }
    
    
    
    
    if (state==state_EDIT1B 
    ||  state==state_BGR_COLOR )
    {
        ColorGrid_xl  = _XL0 + ColorGrid_X_BASE;
        ColorGrid_yt  = gui_yt;
        ColorGrid_yt -= ColorGrid_Outline_W;
        
        
        // cursor is only on the color grid in these states
        Cursor_xl  = ColorGrid_xl;
        Cursor_xl += ColorGrid_Outline_W;
        Cursor_xl += ColorGrid_Cursor_clm * ColorGrid_SCALE;
        Cursor_xl += ColorGrid_SCALE>>1;
        Cursor_xl -= Cursor_W>>1;
        
        Cursor_yt  = ColorGrid_yt;
        Cursor_yt += ColorGrid_Outline_W;
        Cursor_yt += ColorGrid_Cursor_row * ColorGrid_SCALE;
        Cursor_yt += ColorGrid_SCALE>>1;
        Cursor_yt -= Cursor_H>>1;
    }
    else if (state==state_EDIT1A)
    {
        Cursor_xl  = gui_xl;
        Cursor_xl += val(PalEdit_dm[?STR_Palette+hex_str(PalEdit_Cursor_clm+1)+"_XL"]);
        Cursor_xl += PalEdit_SCALE>>1;
        Cursor_xl -= Cursor_W>>1;
        
        Cursor_yt  = gui_yt;
        Cursor_yt += PalEdit_Cursor_row * PalEdit_SCALE;
        Cursor_yt += PalEdit_SCALE>>1;
        Cursor_yt -= Cursor_H>>1;
    }
    
    
    if (state==state_EDIT1A 
    ||  state==state_EDIT1B 
    ||  state==state_BGR_COLOR )
    {
        Cursor_can_draw = g.counter0&$8;
    }
    
    
    
    
    
    if (state==state_EDIT1A 
    ||  state==state_EDIT1B )
    {
        for(_i=0; _i<PalEdit_PAL_COUNT; _i++)
        {
            _pi = val(PalEdit_dm[?STR_Palette+hex_str(_i+1)+STR_Palette+STR_Index]);
            for(_j=0; _j<global.COLORS_PER_PALETTE; _j++)
            {
                _dk = STR_Palette+hex_str(_i+1)+STR_Color+hex_str(_j+1);
                
                _color = get_pal_color(p.pal_rm_new, _pi, string_char_at(global.PAL_BASE_COLOR_ORDER,_j+1));
                PalEdit_dm[?_dk] = _color;
                
                _color = merge_colour(_color,c_black, 0.7);
                PalEdit_dm[?_dk+"_Tinted"] = _color;
                
                PalEdit_dm[?_dk+"_UseTinted"] = state==state_EDIT1B && (PalEdit_Cursor_clm!=_i || PalEdit_Cursor_row!=_j);
                PalEdit_dm[?_dk+"_Editing"]   = state==state_EDIT1B &&  PalEdit_Cursor_clm==_i && PalEdit_Cursor_row==_j;
            }
        }
    }
}








Info1_can_draw = false;
if (state==state_EDIT1A 
||  state==state_EDIT1B 
||  state==state_BGR_COLOR )
{
    Info1Area_xl = _XL0 + Info1Area_X_BASE;
    Info1Area_yt = _YT0 + Info1Area_Y_BASE;
    _xl = Info1Area_xl + Info1_PAD2;
    _yt = Info1Area_yt + Info1_PAD2;
    for(_i=ds_grid_width(Info1_dg)-1; _i>=0; _i--)
    {
        Info1_dg[#_i,5] = string_pos(string(state), string(Info1_dg[#_i,4])); // 4: draw condition data
        if (Info1_dg[#_i,5]) // 5: can draw
        {
            Info1_can_draw = true;
            Info1_dg[#_i,2] = _xl; // 2: xl
            Info1_dg[#_i,3] = _yt; // 3: yt
            _yt += Info1_DIST1; // yt of next text line
        }
    }
    
    if (Info1_can_draw)
    {
        Info1Area_h  = _yt - Info1Area_yt;
        //Info1Area_h += Info1_PAD2; // background padding
    }
}




