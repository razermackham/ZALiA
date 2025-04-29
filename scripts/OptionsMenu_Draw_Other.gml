/// OptionsMenu_Draw_Other(YT)


var _YT0 = argument[0];

var _i, _x,_y, _xl,_yt, _yt1;
var _DIST1 = $6; // line spacing
var _dk, _pi;
var _text, _font, _font_w,_font_h;
var _STR_UNDEFINED = "UNDEFINED";


_yt1  = _YT0;
_yt1 += _DIST1; // line spacing

_font   = Font2;
_font_w = sprite_get_width( _font);
_font_h = sprite_get_height(_font);




var          _COUNT0 = val(dm_options[?"Other"+STR_Count]);
for(_i=0; _i<_COUNT0; _i++)
{
    if(!OptionsMenu_option_is_avail(menu_state_OTHER,_i))
    {
        continue;//_i
    }
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    _text = val(dm_options[?"Other"+hex_str(_i)+STR_Option+STR_Text]);
    _xl = TextArea1_xl;
    _yt = _yt1;
    draw_text_(_xl,_yt, _text, _font, PI_MENU);
    
    
    _pi = PI_MENU;
    _text = 0;
    _dk = "Other"+hex_str(_i)+STR_State;
    switch(_i)
    {   // --------------------------------------------------------------------
        case Other_FLASHING:{
        _xl  = drawX + MenuWindow_w; // window xr
        _xl -= 8; // window border
        _xl -= 4; // pad
        _xl -= BackgroundFlash_W;
        
        _yt  = _yt1;       // text yt
        _yt += _font_h>>1; // text yc
        _yt -= BackgroundFlash_H>>1; // color box yt
        
        if(!p.BackgroundFlash_setting) _color = p.dg_color_seq[#0,g.counter0&$3];
        else                           _color = p.dl_BackgroundFlash_COLORS[|p.BackgroundFlash_setting];
        draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, BackgroundFlash_W,BackgroundFlash_H, _color);
        break;}//case Other_FLASHING
        
        // --------------------------------------------------------------------
        case Other_DIALOGUE_SPEED:{
        _text = string(g.mod_DLG_SPEED+1);
        break;}//case Other_DIALOGUE_SPEED
        
        // --------------------------------------------------------------------
        case Other_HIDDEN_OW_EXITS:{
        _text = val(dm_options[?_dk+hex_str(g.hidden_item_exits_help)     +STR_Text],_STR_UNDEFINED);
        if(!g.hidden_item_exits_help) _pi = PI_DARK1;
        break;}
        
        // --------------------------------------------------------------------
        case Other_HUD:{
        _text = val(dm_options[?_dk+hex_str(global.HUD_state)             +STR_Text],_STR_UNDEFINED);
        break;}
        
        // --------------------------------------------------------------------
        case Other_TORCH_LIGHTING:{
        _text = val(dm_options[?_dk+hex_str(g.torch_lighting_method)      +STR_Text],_STR_UNDEFINED);
        break;}
        
        /*
        // --------------------------------------------------------------------
        case Other_RENDER_DELAY:{
        _text = val(dm_options[?_dk+hex_str(global.RenderFrameDelay_state)+STR_Text],_STR_UNDEFINED);
        if(!global.RenderFrameDelay_state) _pi = PI_DARK1;
        break;}
        */
        
        // --------------------------------------------------------------------
        case Other_SCREEN_SHAKE:{
        _text = val(dm_options[?_dk+hex_str(g.ScreenShake_user_pref)      +STR_Text],_STR_UNDEFINED);
        if(!g.ScreenShake_user_pref) _pi = PI_DARK1;
        break;}
        
        // --------------------------------------------------------------------
        case Other_STAB_FRENZY:{
        _text = val(dm_options[?_dk+hex_str(g.mod_StabFrenzy)             +STR_Text],_STR_UNDEFINED);
        if(!g.mod_StabFrenzy) _pi = PI_DARK1;
        break;}
        
        // --------------------------------------------------------------------
        case Other_ANARKHYA_OW:{
        _text = val(dm_options[?_dk+hex_str(g.anarkhyaOverworld_enabled)  +STR_Text],_STR_UNDEFINED);
        if(!g.anarkhyaOverworld_enabled) _pi = PI_DARK1;
        break;}
        
        // --------------------------------------------------------------------
        case Other_HALLOWEEN1:{
        _text = val(dm_options[?_dk+hex_str(global.Halloween1_enabled)    +STR_Text],_STR_UNDEFINED);
        if(!global.Halloween1_enabled) _pi = PI_DARK1;
        break;}
        
        /*
        // --------------------------------------------------------------------
        case Other_SHOW_ACTIVE_SPELLS:{
        _text = val(dm_options[?_dk+hex_str(g.mod_IndicateSpellActive)    +STR_Text],_STR_UNDEFINED);
        if(!g.mod_IndicateSpellActive) _pi = PI_DARK1;
        break;}
        */
    }//switch(_i)
    
    if (_text!=0)
    {
        _xl  = TextArea2_xr;
        _xl -= string_length(_text)*_font_w;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, _pi);
    }
    
    
    if (_i==Other_cursor)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y, PI_MENU);
    }
    
    
    _yt1 += _font_h; // text yb
    _yt1 += _DIST1;  // line spacing
}




