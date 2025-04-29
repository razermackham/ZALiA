/// OptionsMenu_Draw_RandoOptions(YT)


var _YT0 = argument[0];

var _i, _x,_y, _xl,_yt, _xl1,_yt1;
var _DIST1 = $6; // line spacing
var _text,_text2, _font, _font_w,_font_h;
var _pi;
var _option_is_avail = false;

var _dg_state_text = ds_grid_create(2,2);
    _dg_state_text[#0,0] = "OFF";
    _dg_state_text[#0,1] = "ON";
//                                      //
    _dg_state_text[#1,0] = "NO";
    _dg_state_text[#1,1] = "YES";
//                                      //


_yt1  = _YT0;
_yt1 += _DIST1; // line spacing




for(_i=0; _i<RandoOptions_COUNT; _i++)
{
    _text = dg_RandoOptions[#_i,0];
    _font = dg_RandoOptions[#_i,1];
    _font_w = sprite_get_width( _font);
    _font_h = sprite_get_height(_font);
    
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    
    _option_is_avail = OptionsMenu_option_is_avail(menu_state_RANDO_OPTIONS,_i);
    
    
    if (_option_is_avail) _pi = PI_MENU;
    else                  _pi = PI_DARK2;
    draw_text_(TextArea1_xl,_yt1, _text, _font, _pi);
    
    
    _text2 = 0;
    if (_option_is_avail)
    {
        switch(_i){
        case RandoOptions_MARK_ACQUIRED:   {_text2=_dg_state_text[#1,sign(g.can_mark_acquired_item_locations)];  break;}
        case RandoOptions_HINTS:           {_text2=_dg_state_text[#0,sign(global.RandoHints_enabled)];           break;}
        case RandoOptions_MAPS_SHOW_KEYS:  {_text2=_dg_state_text[#0,sign(g.RandoKeys_MAP_items_show_keys)];     break;}
        case RandoOptions_RANDO_ENEMY:     {_text2=_dg_state_text[#0,sign(g.Rando_enemy)];                       break;}
        case RandoOptions_DUNGEON_TILESETS:{_text2=_dg_state_text[#0,sign(global.RandoDungeonTilesets_enabled)]; break;}
        case RandoOptions_RANDO_OW_TILES:  {_text2=_dg_state_text[#0,sign(global.can_rando_ow_tsrc)];            break;}
        case RandoOptions_SCENES:          {_text2=_dg_state_text[#0,sign(global.SceneRando_enabled)];           break;}
        case RandoOptions_RANDO_PALETTE:   {_text2=string(g.RandoPalette_state);                                 break;}
        }//switch(_i)
    }
    
    if (_text2!=0)
    {
             if(!_option_is_avail)                                        _pi = PI_DARK2;
        else if (isVal(_text2,_dg_state_text[#0,0],_dg_state_text[#1,0])) _pi = PI_DARK1;
        else                                                              _pi = PI_MENU;
        _xl  = TextArea2_xr;
        _xl -= string_length(_text2)*_font_w;
        draw_text_(_xl,_yt1, _text2, _font, _pi);
    }
    
    
    
    
    if (_i==RandoOptions_cursor)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU);
    }
    
    
    _yt1 += _font_h; // text yb
    _yt1 += _DIST1;  // line spacing
}




ds_grid_destroy(_dg_state_text); _dg_state_text=undefined;




