


//p_Draw_1();
// On 1st frame after app start: Initialize pal_spr, falling scene sprites, and etc... ----------------------------------------------------
if(!global.App_frame_count) p_Draw_1();



/*
if (global.palette_image_IS_SURFACE 
&& !surface_exists(global.palette_image) )
{
    global.palette_image = surface_create(string_length(pal_rm_def) div global.PAL_CHAR_PER_PAL, global.COLORS_PER_PALETTE);
    surface_set_target(global.palette_image);
    draw_clear(C_BLK1);
    surface_reset_target();
}
*/



// Change the Room's Palette Colors
// -----------------------------------------------------------------------
palSpr_changeColors();



// Color Room Tiles
// -----------------------------------------------------------------------
//color_tiles(); // 2025/05/15. Moved to `Surface_Step()`

/*
if (DEV)
{
    dev_tile_highlighting();
}
else
{
    tile_layer_hide(DEPTH_SOLIDS);
    tile_layer_hide(DEPTH_UNIQUE);
}
*/


// Changing rooms
// -----------------------------------------------------------------------




// -----------------------------------------------------------------------




// first_frame = false;

/*
if (g.canDrawPalette)
{
    var _i,_j,_k, _idx, _val, _count;
    var _palette, _color;
    var _SIZE = $4;
    var _X1 = viewXL()+$10;
    var _xl = _X1;
    var _y1 = viewYB()-$80;
    var _yt = _y1;
    
    for(_i=0; _i<2; _i++)
    {
        if (_i==0)   _count = ds_list_size(dl_various_pals1);
        else         _count = ds_list_size(dl_various_pals2);
        for(_j=0; _j<_count; _j++) // each palette
        {
            _xl = _X1 + (_j*_SIZE);
            if (_i==0) _palette = dl_various_pals1[|_j];
            else       _palette = dl_various_pals2[|_j];
            for(_k=0; _k<COL_PER_PAL; _k++) // each color
            {
                _yt = _y1 + (_k*_SIZE);
                _val = string_copy(_palette, (_k<<1)+1, 2);
                _idx = str_hex(_val);
                _color = dl_COLOR[|_idx];
                draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, _SIZE,_SIZE, _color);
            }
        }
        
        _y1 += _SIZE*COL_PER_PAL;
        _y1 += _SIZE<<1; // pad
    }
}
*/




/* // Keep this code to automate populating `global.dl_COLOR01` in case you change the colors later.
if (keyboard_check_pressed(vk_f7))
{
    var _i,_j, _color, _output, _str;
    var _STR1 = "//                                                                      //";
    var _TS_W = background_get_width( ts_SolidColors01_8x8);
    var _TS_H = background_get_height(ts_SolidColors01_8x8);
    var _CLMS = _TS_W>>3;
    var _ROWS = _TS_H>>3;
    var _ColorGrid_clms = 0;
    var _ColorGrid_rows = 0;
    _surf = surface_create(_TS_W,_TS_H);
    surface_set_target(_surf);
    draw_clear_alpha(c_black,0);
    draw_background(ts_SolidColors01_8x8,0,0);
    sdm("");
    for(_i=0; _i<_ROWS; _i++)
    {
        _str = "ROW $"+hex_str(_i);
        sdm(strReplaceAt(_STR1, 4, string_length(_str), _str));
        for(_j=0; _j<_CLMS; _j++)
        {
            _color = draw_getpixel_ext(_j<<3,_i<<3);
            if!((_color>>$18)&$FF) continue;//_j. if not full alpha
            //if ((_color>>$18)&$FF<$FF) continue;//_j. if not full alpha
            _color &= $FFFFFF; // don't need the 4th byte which is the alpha value ($FF000000)
            if (isVal(_color,C_WHT0,C_RED0,C_BLU0,C_GRN0,C_YLW0,C_MGN0,C_BLK0,C_CYN0)) break;//_j. not in color grid anymore
            if (_j+1>_ColorGrid_clms) _ColorGrid_clms = _j+1;
            if (_i+1>_ColorGrid_rows) _ColorGrid_rows = _i+1;
            _output  = "ds_list_add(global.dl_COLOR01,$"+color_str(_color)+");";
            _output += " // Hue-$";
            _output += hex_str(colour_get_hue(_color));
            _output += ",  Sat-$"+hex_str(colour_get_saturation(_color));
            _output += ",  Bright-$"+hex_str(get_color_brightness(_color));
            sdm(_output);
        }
    }
    sdm(_STR1);
    sdm("ColorGrid_CLMS = $"+hex_str(_ColorGrid_clms)+";");
    sdm("ColorGrid_ROWS = $"+hex_str(_ColorGrid_rows)+";");
    sdm("");
    surface_reset_target();
    surface_free(_surf);
}
*/




