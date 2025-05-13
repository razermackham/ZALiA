/// PauseMenu_Draw()


if(!canDrawSections)
{
    canDrawSections = 0;
    canDrawItems    = 0;
    canDrawSpells   = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}








// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
//var _xl,_yt, _xl1, _w;




// ----------------------------------------------------------------------------------
// Draw bg color of menu
if (WindowBackground_can_draw)
{
    draw_sprite_(spr_1x1_WHT,0, WindowBackground_xl,WindowBackground_yt, -1, WindowBackground_w,WindowBackground_h, WindowBackground_color,WindowBackground_alpha);
}




// ----------------------------------------------------------------------------------
// Draw GUI Window Frame
PauseMenu_Draw_1(); // create surfaces

pal_swap_set(p.palette_image, PI_MENU1);
switch(Window_draw_data_state){
case state_SPELL:{draw_surface_part(MenuFrame_srf_SPELL, MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
case state_ITEM: {draw_surface_part(MenuFrame_srf_ITEM,  MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
case state_MAP:  {draw_surface_part(MenuFrame_srf_MAP,   MenuFrameMain_srf_xl,0, MenuFrameMain_w,Window_h, MenuFrameMain_xl,MenuFrameMain_yt); break;}
}

if (Window_extra_draw_clms)
{   // For clms extending left beyond spell/item window
    draw_surface_part(MenuFrame_srf_MAP, 0,0, Window_extra_draw_clms_w,Window_h, drawX,MenuFrameMain_yt);
}

if (MenuFrameSeparator1_can_draw)
{   // draw map area-name/menu-nav separator
    draw_surface_part(MenuFrame_srf_MAP, MenuFrameSeparator1_SURF_XL,0, MenuFrameSeparator1_W,Window_h, Window_xl0,MenuFrameMain_yt);
}
pal_swap_reset();








// SPELL MENU  ----------------------------------------------------------------------
if (canDrawSpells)          PauseMenu_draw_spell_menu();
// INVENTORY  -----------------------------------------------------------------------
if (canDrawItems)           PauseMenu_draw_inventory();
// MAP  -----------------------------------------------------------------------------
if (Window_extra_draw_clms) PauseMenu_draw_map();








// ----------------------------------------------------------------------------------
//  MENU NAVIGATION  -------------------------------------------------------------  
pal_swap_set(p.palette_image, PI_MENU1);
if (MenuNav_can_draw)
{
    if (MenuNavL_text_can_draw) draw_text_(MenuNavL_text_xl, MenuNavL_text_yt, MenuNavL_text); // left   $20
    if (MenuNavR_text_can_draw) draw_text_(MenuNavR_text_xl, MenuNavR_text_yt, MenuNavR_text); // right  $50
    draw_sprite_(MenuNavL_sprite,0, MenuNavL_sprite_x, MenuNavL_sprite_y);
    draw_sprite_(MenuNavR_sprite,0, MenuNavR_sprite_x, MenuNavR_sprite_y);
}




// ----------------------------------------------------------------------------------
//  AREA NAME  -------------------------------------------------------------------
if (AreaName_can_draw) draw_text_(AreaName_xl,AreaName_yt, AreaName_text);
pal_swap_reset();








// ----------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------
canDrawSections = 0;
canDrawItems    = 0;
canDrawSpells   = 0;







/*
var _i,_j,_k;
var _x,_y, _xl,_yt, _xl1,_yt1, _w,_w0;
var _tsrc, _ts_x,_ts_y;
var _data1,_data2;

_xl1 = drawX;
for(_i=0; _i<Window_vertical_draw_section_count; _i++) // Each vertical section
{
    _yt1 = drawY + (_i<<4);
    
    for(_j=0; _j<dg_tdata_H; _j++) // (Window_w x 8). Each row of this section
    {
        switch(Window_draw_data_state){
        default:        {_data1=dg_win_tdata_spl[#_i,_j]; break;}
        case state_ITEM:{_data1=dg_win_tdata_itm[#_i,_j]; break;}
        case state_MAP: {_data1=dg_win_tdata_map[#_i,_j]; break;}
        }
        
        if (_data1!=0)
        {
            if (Window_extra_draw_clms) // map
            {
                _data2  = string_copy(   dg_win_tdata_map[#_i,_j],1,2); // First 2 8x8 clms from left edge
                _data2 += string_repeat(string_char_at(_data2,2), Window_filler_clms);
                _data2 += string_char_at(dg_win_tdata_map[#_i,_j],3);
                _w = string_length(_data1) - (CLMS_WIN_DEF-1);
                _data1 = _data2 + strR(_data1, _w+1);
            }
            
            for(_k=string_length(_data1)-1; _k>=0; _k--) // 8x8. each column of the row
            {
                    _tsrc = string_char_at(_data1,_k+1);
                if (_tsrc=="0" 
                ||  _tsrc=="1" 
                ||  _tsrc=="2" )
                {
                    _tsrc = g.dl_MenuFrame_TSRC[|real(_tsrc)];
                    _ts_x = ((_tsrc>>0)&$F)<<3;
                    _ts_y = ((_tsrc>>4)&$F)<<3;
                    _x    = _xl1 + (_k<<3);
                    _y    = _yt1 + (_j<<3);
                    draw_background_part(g.TS_MENU, _ts_x,_ts_y, 8,8, _x,_y);
                }
            }//for(_k
        }
    }//for(_j
}//for(_i
*/


/*
// Draw sectional bar for inventory
if (Window_draw_data_state==state_ITEM)
{
    if (Items_Bar1_can_draw)
    {   // Main & Quest items separator
        draw_sprite_(spr_1x1_WHT,0, Items_Bar1_x,Items_Bar1_y+0, -1, Items_Bar_W,4, Items_Bar_COLOR1);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar1_x,Items_Bar1_y+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    }
    
    if (Items_Bar2_can_draw)
    {   // Crystals top bar
        draw_sprite_(spr_1x1_WHT,0, Items_Bar2_x,Items_Bar2_y+0, -1, Items_Bar_W,1, Items_Bar_COLOR1);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar2_x,Items_Bar2_y+1, -1, Items_Bar_W,2, Items_Bar_COLOR2);
    }
    
    if (Items_Bar3_can_draw)
    {   // Crystals bottom bar
        draw_sprite_(spr_1x1_WHT,0, Items_Bar3_x,Items_Bar3_y+0, -1, Items_Bar_W,2, Items_Bar_COLOR2);
        draw_sprite_(spr_1x1_WHT,0, Items_Bar3_x,Items_Bar3_y+2, -1, Items_Bar_W,1, Items_Bar_COLOR1);
    }
}
*/
