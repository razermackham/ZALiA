/// PalettePicker_Draw()


//if(!room_is_type("A"))        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
if (global.palette_image_IS_SURFACE)
{    if(!surface_exists(p.palette_image)) exit;  } // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
else if(!sprite_exists( p.palette_image)) exit;    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


var _x,_y, _w,_h;

var _X = viewXL();
var _Y = viewYT();


if (g.canDrawPalette)
{
    var _i, _pal, _color;
    
    var _PC_PAL_COUNT  = val(global.dm_pi[?"PC"+STR_Count]);
        _PC_PAL_COUNT += 1; // disguise
        _PC_PAL_COUNT += val(global.dm_pi[?"SPELL_PC"+STR_Count]);
    //
    var _CUCCO_PAL_COUNT  = val(global.dm_pi[?"CUCCO"+STR_Count]);
        _CUCCO_PAL_COUNT += 1; // disguise
        _CUCCO_PAL_COUNT += val(global.dm_pi[?"CUCCO_SPELL"+STR_Count]);
    //
    var _SCALE1 = PALS1_SCALE;
    var _SCALE2 = PALS1_SCALE<<1;
    var _PI1 = p.PI_LAST_LIT+1;
    var _pi0 = global.PI_PC1; // right after PI Menu
    
    var _h0  = 0;
    var _H1  = global.COLORS_PER_PALETTE;
    var _H2  = (_H1+2) * _SCALE1;
    var _H3  = (_H1+2) * _SCALE2;
    
    var _w0  = 0;
    var _W1  = p.PI_LAST_LIT+1;
    var _W2  = p.PAL_PER_SET * PI_PERMUTATIONS;
    var _W3  = global.PI_PC1; // PI Base and PI Menu
    
    var _X0  = _X + PALS1_X;
    var _x0  = _W3;
    
    var _Y0  = _Y + PALS1_Y;
    var _Y1  = _Y0 + _H2;
    var _Y2  = _Y1 + _H2;
    var _Y3  = _Y2 + _H2;
    var _Y4  = _Y3 + _H2;
    
    var _PAD = $02*_SCALE1;
    var _COLOR1 = c_black;
    var _COLOR2 = c_white;
    //var _COLOR1 = p.C_GRN0;
    //var _COLOR2 = c_black;
    
    
    
    // ----------------------------------------------------------------
    // Full palette
    _x = _X0;
    _y = _Y0;
    if (global.palette_image_IS_SURFACE)
    {
        _w0 = surface_get_width( p.palette_image);
        _h0 = surface_get_height(p.palette_image);
        draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE1)+2, (_h0*_SCALE1)+2);
        draw_surface_ext(p.palette_image, _x,_y, _SCALE1,_SCALE1, 0, c_white,1);
    }
    else
    {
        _w0 = sprite_get_width( p.palette_image);
        _h0 = sprite_get_height(p.palette_image);
        draw_rect(_COLOR2, _x-2,_y-2, (_w0*_SCALE1)+4, (_h0*_SCALE1)+4);
        draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE1)+2, (_h0*_SCALE1)+2);
        draw_sprite_(p.palette_image,0, _x,_y, -1, _SCALE1,_SCALE1);
    }
    
    
    // ----------------------------------------------------------------
    // Lonk
    _x   = _X0;
    _y  += _H2;
    _x0  = global.PI_PC1;
    _w0  = _PC_PAL_COUNT;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    // Cucco
    _x  += _w0*_SCALE2;
    _x  += _PAD;
    _x0  = global.PI_CUCCO1;
    _w0  = _CUCCO_PAL_COUNT;
    //_w0  = val(global.dm_pi[?"CUCCO"+STR_Count]);
    //_w0++; // cucco disguise pi
    //_w0  = _PC_PAL_COUNT;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    // Lonk (dark room)
    _x  += _w0*_SCALE2;
    _x  += _PAD<<1;
    _x0  = global.PI_PC1+p.PAL_PER_SET;
    _w0  = _PC_PAL_COUNT;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    // Cucco (dark room)
    _x  += _w0*_SCALE2;
    _x  += _PAD;
    _x0  = global.PI_CUCCO1+p.PAL_PER_SET;
    _w0  = _CUCCO_PAL_COUNT;
    //_w0  = val(global.dm_pi[?"CUCCO"+STR_Count]);
    //_w0++; // cucco disguise pi
    //_w0  = _PC_PAL_COUNT;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    
    
    // ----------------------------------------------------------------
    // Mobs
    _x   = _X0;
    _y  += _H3;
    _x0  = global.PI_MOB_ORG;
    _w0  = val(global.dm_pi[?"MOB"+STR_Count]);
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    // Mobs (dark room)
    _x  += _w0*_SCALE2;
    _x  += _PAD<<1;
    _x0  = global.PI_MOB_ORG+p.PAL_PER_SET;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    
    
    
    // ----------------------------------------------------------------
    // Background
    _x   = _X0;
    _y  += _H3;
    _x0  = global.PI_BGR1;
    _w0  = val(global.dm_pi[?"BGR"+STR_Count]);
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    // Background (dark room)
    _x  += _w0*_SCALE2;
    _x  += _PAD<<1;
    _x0  = global.PI_BGR1+p.PAL_PER_SET;
    draw_rect(_COLOR1, _x-1,_y-1, (_w0*_SCALE2)+2, (_H1*_SCALE2)+2);
    if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    else                                 draw_sprite_part_ext( p.palette_image,0, _x0,0, _w0,_H1, _x,_y, _SCALE2,_SCALE2, c_white,1);
    
    
    
    
    /*
    // Mobs and background(lit room)
    _y  += _H2;
    _x0  = PI_PC_1;
    _w   = (p.PI_LAST_LIT+1) - _x0;
    draw_sprite_part_ext(p.palette_image,0, _x0,0, _w,_H1, _X0,_Y1, PALS1_SCALE,PALS1_SCALE, c_white,1);
    // Mobs and background(lit room) - permutations
    _y  += _H2;
    _x0 += _W1;
    _w   = _W1;
    draw_sprite_part_ext(p.palette_image,0, _x0,0, _w,_H1, _X0,_Y3, PALS1_SCALE,PALS1_SCALE, c_white,1);
    
    // Mobs and background(dark room)
    _y  += _H2;
    _x0 += _W1;
    _w   = _W2;
    draw_sprite_part_ext(p.palette_image,0, _x0,0, _w,_H1, _X0,_Y2, PALS1_SCALE,PALS1_SCALE, c_white,1);
    // Mobs and background(dark room) - permutations
    _y  += _H2;
    _x0 += _W2;
    _w   = _W2;
    draw_sprite_part_ext(p.palette_image,0, _x0,0, _w,_H1, _X0,_Y4, PALS1_SCALE,PALS1_SCALE, c_white,1)
    */
    
    if(!surface_exists(ObjPal_surf))
    {
        ObjPal_surf = surface_create(ObjPal_surf_W,ObjPal_surf_H);
        surface_set_target(ObjPal_surf);
        draw_clear_alpha(c_white,1);
        //draw_clear_alpha(c_black,0);
        //draw_sprite_(spr_1x1_WHT,0, 0,0, -1, surface_get_width(ObjPal_surf),surface_get_height(ObjPal_surf), c_white);
        draw_sprite_(spr_1x1_WHT,0, (ObjPal_surf_W>>1)-(ObjPalBgr1_W>>1),(ObjPal_surf_H>>1)-(ObjPalBgr1_H>>1), -1, ObjPalBgr1_W,ObjPalBgr1_H, c_black);
        surface_reset_target();
    }
    
    if(!is_undefined(p.pal_rm_curr) 
    &&  g.room_type=="A" )
    {
        with(GameObject)
        {
            if (variable_instance_exists(id,"palidx"))
            {
                if(!variable_instance_exists(id,"state") 
                ||  state )
                {
                    _x  = x - (other.ObjPal_surf_W>>1);
                    _y  = yt - other.ObjPal_YT_OFFSET;
                    if (surface_exists(other.ObjPal_surf)) draw_surface(other.ObjPal_surf, _x, _y);
                    
                    _x  = x - (other.ObjPal_COL_SIZE>>1);
                    _y  = yt - other.ObjPal_YT_OFFSET;
                    _y += other.ObjPalOutline_W<<1;
                    _pal = string_copy(p.pal_rm_curr,get_pal_pos(palidx),global.PAL_CHAR_PER_PAL);
                    for(_i=0; _i<global.COLORS_PER_PALETTE; _i++)
                    {
                        _color = string_copy(_pal,(global.PAL_CHAR_PER_COLOR*_i)+1,global.PAL_CHAR_PER_COLOR);
                        _color = str_hex(_color);
                        draw_sprite_(spr_1x1_WHT,0, _x,_y+(other.ObjPal_DIST1*_i), -1, other.ObjPal_COL_SIZE,other.ObjPal_COL_SIZE, _color);
                    }
                    
                    // draw this object's current palette index
                    _x  = x - (other.ObjPal_FONT_W>>1);
                    _y  = yt - other.ObjPal_YT_OFFSET;
                    _y -= 1; // pad
                    _y -= other.ObjPal_FONT_H;
                    draw_text_(_x,_y, string_char_at(hex_str(palidx),2), other.ObjPal_FONT);
                    _y -= 1; // pad
                    _y -= other.ObjPal_FONT_H;
                    draw_text_(_x,_y, string_char_at(hex_str(palidx),1), other.ObjPal_FONT);
                }
            }
        }
    }
}
/*
ObjPal_COL_SIZE = 4;
ObjPalOutline_W = 1;
ObjPal_DIST1  = ObjPal_COL_SIZE +  ObjPalOutline_W;
ObjPalBgr1_W  = ObjPal_COL_SIZE + (ObjPalOutline_W<<1);
ObjPalBgr1_H  = ObjPal_COL_SIZE *  global.COLORS_PER_PALETTE;
ObjPalBgr1_H += ObjPalOutline_W * (global.COLORS_PER_PALETTE+1);
ObjPalBgr2_W  = ObjPalBgr1_W + (ObjPalOutline_W<<1);
ObjPalBgr2_H  = ObjPalBgr1_H + (ObjPalOutline_W<<1);
ObjPal_YT_OFFSET  = ObjPalBgr2_H;
ObjPal_YT_OFFSET += 2; // obj sprite pad
ObjPal_surf_W = ObjPalBgr2_W;
ObjPal_surf_H = ObjPalBgr2_H;
ObjPal_surf = surface_create(ObjPal_surf_W,ObjPal_surf_H);
*/



if (isVal(state, STATE_PKM1,STATE_PKM2,STATE_BGR_COLOR))
{
    var _CURSOR_BLINK = g.counter0&$8;
    
    var _PAL2_CURS_X = _X + PALS2_X2 + ((pal_curs_idx mod PAL_CNT) * PALS2_SCALE);
    var _PAL2_CURS_Y = _Y + PALS2_Y2 + ((pal_curs_idx div PAL_CNT) * PALS2_SCALE);
    
    
    _x  = _X + PALS2_X;
    _y  = _Y + PALS2_Y;
    // draw_sprite_(p.palette_image,0, _x,_y, -1, PALS2_SCALE,PALS2_SCALE);
    _x += PI_OFFSET * PALS2_SCALE;
    // var _A = PI_OFFSET;
    if (isVal(state, STATE_PKM1,STATE_PKM2))
    {
        if (global.palette_image_IS_SURFACE) draw_surface_part_ext(p.palette_image,   PI_OFFSET,0, PAL_CNT,global.COLORS_PER_PALETTE, _x,_y, PALS2_SCALE,PALS2_SCALE, c_white,1);
        else                                 draw_sprite_part_ext( p.palette_image,0, PI_OFFSET,0, PAL_CNT,global.COLORS_PER_PALETTE, _x,_y, PALS2_SCALE,PALS2_SCALE, c_white,1);
        //draw_sprite_part_ext(p.palette_image,0, PI_OFFSET,0, PAL_CNT,COL_PER_PAL, _x,_y, PALS2_SCALE,PALS2_SCALE, c_white,1);
    }
    
    
    _x = _X + PALS2_X;
    _y = _Y + COLOR_GRID_Y + COLOR_GRID_H2 + ($03<<3);
        draw_text_(_x,_y,          "OLD COLOR  "+hex_str(col_idx_old_col));
    if (isVal(state, STATE_PKM2,STATE_BGR_COLOR))
    //if (state == STATE_PKM2)
    {   draw_text_(_x,_y+($02<<3), "NEW COLOR  "+hex_str(col_idx_new_col));  }
}



switch(state)
{
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case STATE_IDLE:{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    break;}
    
    
    
    
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case STATE_PKM1:{
    if (_CURSOR_BLINK)
    {
        _x = _PAL2_CURS_X;
        _y = _PAL2_CURS_Y;
        PalettePicker_draw_cursor(CURSOR_COLOR, _x,_y, PALS2_SCALE,PALS2_SCALE);
    }
    break;}
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case STATE_PKM2:{
    _x = _X + PALS2_X2;
    _y = _Y + PALS2_Y;
    // _x = _X + PALS2_X;
    // _y = _Y + PALS2_Y;
    draw_rect_(c_black, _x,_y, PALS2_W2,PALS2_H, .7);
    // draw_rect_(c_black, _x,_y, PALS2_W,PALS2_H, .5);
    _x = _PAL2_CURS_X;
    _y = _PAL2_CURS_Y;
    draw_rect(pal_curs_col, _x,_y, PALS2_SCALE,PALS2_SCALE);
    
    
    _x = _X + COLOR_GRID_X;
    _y = _Y + COLOR_GRID_Y;
    draw_sprite_(COLOR_GRID_SPR,0, _x,_y, -1, COLOR_GRID_SCALE,COLOR_GRID_SCALE);
    
    if (_CURSOR_BLINK)
    {
        _x = _X + COLOR_GRID_X + ((col_curs_idx mod COLOR_GRID_W) * COLOR_GRID_SCALE);
        _y = _Y + COLOR_GRID_Y + ((col_curs_idx div COLOR_GRID_W) * COLOR_GRID_SCALE);
        PalettePicker_draw_cursor(CURSOR_COLOR, _x,_y, COLOR_GRID_SCALE,COLOR_GRID_SCALE);
    }
    break;}
    
    
    
    // ---------------------------------------------------------------------
    // ---------------------------------------------------------------------
    case STATE_BGR_COLOR:{
    _x = _X + COLOR_GRID_X;
    _y = _Y + COLOR_GRID_Y;
    draw_sprite_(COLOR_GRID_SPR,0, _x,_y, -1, COLOR_GRID_SCALE,COLOR_GRID_SCALE);
    
    if (_CURSOR_BLINK)
    {
        _x = _X + COLOR_GRID_X + ((col_curs_idx mod COLOR_GRID_W) * COLOR_GRID_SCALE);
        _y = _Y + COLOR_GRID_Y + ((col_curs_idx div COLOR_GRID_W) * COLOR_GRID_SCALE);
        PalettePicker_draw_cursor(CURSOR_COLOR, _x,_y, COLOR_GRID_SCALE,COLOR_GRID_SCALE);
    }
    break;}
}




