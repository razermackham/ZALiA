/// PaletteEditor_udp()


gui_xl = viewXL() + gui_XLOFF;
gui_yt = viewYT() + gui_YTOFF;




if (global.palette_image_IS_SURFACE)
{    if(!surface_exists(p.palette_image)) PalView_enabled = false;  }
else if(!sprite_exists( p.palette_image)) PalView_enabled = false;


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
        PalEdit_xl = gui_xl - PalEdit_Outline_W;
        PalEdit_yt = gui_yt - PalEdit_Outline_W;
    }
    
    
    
    
    if (state==state_EDIT1B 
    ||  state==state_BGR_COLOR )
    {
        ColorGrid_xl  = gui_xl;
        ColorGrid_xl += PalEdit_PALS_W;
        //ColorGrid_xl += val(PalEdit_dm[?STR_Palette+STR_Width]);
        ColorGrid_xl += $10; // pad
        ColorGrid_xl -= ColorGrid_Outline_W;
        
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
        var _i,_j, _pi, _color, _dk;
        
        for(_i=0; _i<PalEdit_PAL_COUNT; _i++)
        {
            _pi = val(PalEdit_dm[?STR_Palette+hex_str(_i+1)+STR_Palette+STR_Index]);
            for(_j=0; _j<global.COLORS_PER_PALETTE; _j++)
            {
                _dk = STR_Palette+hex_str(_i+1)+STR_Color+hex_str(_j+1);
                
                _color = get_pal_color(p.pal_rm_new, _pi, string_char_at(global.PAL_BASE_COLOR_ORDER,_j+1));
                PalEdit_dm[?_dk] = _color;
                
                _color = merge_colour(_color,c_black, .7);
                PalEdit_dm[?_dk+"_Tinted"] = _color;
                
                PalEdit_dm[?_dk+"_UseTinted"] = state==state_EDIT1B && (PalEdit_Cursor_clm!=_i || PalEdit_Cursor_row!=_j);
                PalEdit_dm[?_dk+"_Editing"]   = state==state_EDIT1B &&  PalEdit_Cursor_clm==_i && PalEdit_Cursor_row==_j;
            }
        }
    }
}




