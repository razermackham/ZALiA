/// OptionsMenu_Draw_Main(YT)


var _YT0 = argument[0];

var _i,_j, _idx, _val;
var _x,_y, _xl,_yt, _xl1,_yt1;
var _pi;
var _text,_text2, _font, _font_w,_font_h;
var _len, _pos;
var _lvl, _color;
var _skin_sprite_yb = 0;
var _DIST1 = $4;
var _DIST2 = $8;


_yt1 = _YT0;




pal_swap_set(p.palette_image, PI_MENU);
for(_i=0; _i<MainOption_COUNT; _i++)
{
    if(!OptionsMenu_option_is_avail(menu_state_MAIN,_i))
    {
        continue;//_i
    }
    
    
    _text = MainOptions_dg[#_i,0];
    _font = MainOptions_dg[#_i,1];
    _font_w = sprite_get_width( _font);
    _font_h = sprite_get_height(_font);
    
    
    
    _xl = TextArea1_xl;
    switch(_i){
    default:                     {_yt1+=_DIST1; break;} // extra pad
    case MainOption_SND_VOL:     {_yt1+=$0;     break;} // extra pad
    case MainOption_MUS_VOL:     {_yt1+=$0;     break;} // extra pad
    case MainOption_MUSIC_SET:   {_yt1+=_DIST1; break;} // extra pad
    case MainOption_PC_SPRITES:  {_yt1+=_DIST2; break;} // extra pad
    case MainOption_INPUT_CONFIG:{_yt1+=$2;     break;} // extra pad
    case MainOption_FULLSCREEN:  {_yt1+=_DIST1; break;} // extra pad
    case MainOption_CLOSE:       {_yt1+=_DIST2; break;} // extra pad
    }
    
    if (_yt1+_font_h >= MenuWindow_yb)
    {
        break;//_i
    }
    
    
    
    
    _lvl = 0;
    
    
    switch(_i)
    {   // --------------------------------------------------------------------
        default:{
        if (_i==MainOption_SND_VOL 
        ||  _i==MainOption_MUS_VOL  )
        {
            if (_i==MainOption_SND_VOL) _lvl = Audio.snd_vol;
            else                        _lvl = Audio.mus_vol;
            
            _text += string_repeat("+",    _lvl);
            _text += string_repeat(".", 10-_lvl);
            _text += string_repeat(" ",  1+_lvl<10);
            _text += string(_lvl);
            _xl = TextArea1_xl;
            _yt = _yt1;
            draw_text_(_xl,_yt, _text, _font, PI_MENU);
            
            if (_lvl)
            {
                _xl += string_length(MainOptions_dg[#_i,0])*_font_w;
                _yt = _yt1;
                repeat(_lvl)
                {
                    draw_sprite_(spr_1x1_WHT,0, _xl+1,_yt+1, -1, _font_w-2,_font_h-2);
                    _xl += _font_w;
                }
            }
        }
        else
        {
            _xl = TextArea1_xl;
            _yt = _yt1;
            draw_text_(_xl,_yt, _text, _font, PI_MENU);
        }
        break;}//default
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_MUSIC_SET:{
        _val = string_lettersdigits(string_upper(Audio.audio_set));
        _val = val(Audio.dm[?STR_Audio+STR_Set+STR_Creator+STR_Name+Audio.audio_set], _val);
        _text += ": "+_val;
        if (Audio.audio_set==dk_RandomCustom) _text += " (PRESS START)";
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_MUSIC_SET
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_PC_SPRITES:{
        var _y2;
        var _PAD1 = 1; // player skin yt,yb pad
        var _DIST3 = (g.pc.Spritesheet_H>>1) - $8;
        
        _idx = val(g.pc.dm_skins[?STR_Current+STR_Idx]);
        _text += string(_idx+1)+"/"+string(val(g.pc.dm_skins[?STR_Set+STR_Count]));
        _text += ": " + val(g.pc.dm_skins[?hex_str(_idx)+STR_Name], STR_undefined);;
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        
        _text = "BY: ";
        _xl  = TextArea1_xl + (_DIST3<<1);
        _yt  = _yt1 + _font_h;
        _yt += _DIST1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        
        _xl += _font_w*string_length(_text);
        _text2 = val(g.pc.dm_skins[?hex_str(_idx)+STR_Creator], STR_undefined);
        _val = ", ";
        _len = string_length(_val);
        _j = string_count(",",_text2) + 1;
        while (_j)
        {
            _j--;
            _pos = string_pos(_val,_text2);
            if (_pos)
            {
                _text  = string_copy(_text2, 1, _pos+(_len-1));
                _text2 = strR(_text2, _pos+_len);
            }
            else
            {
                _text  = _text2;
            }
            
            draw_text_(_xl,_yt, _text, _font, PI_MENU);
            _yt += _font_h+2;
            
            if(!_pos) break;//while (_j)
        }
        
        _x = TextArea1_xl + _DIST3;
        _y2  = _yt1 + _font_h;
        _y2 += _DIST3;
        _y = _y2;
        if (_y+(g.pc.Spritesheet_H>>1) < MenuWindow_yb)
        {
            draw_pc_skin(_x,_y, 1,1, g.pc.behavior_WALK1+PCSpriteWalk_frame, false, -1,-1, global.PI_PC1);
        }
        
        
        _skin_sprite_yb = _y2 + _DIST3; // yb of pc skin sprite area
        //_yt1 = _y2 + _DIST3; // yb of pc skin sprite area
        break;}//case MainOption_PC_SPRITES
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_FULLSCREEN:{
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        
        if (window_get_fullscreen()) _text = "FULLSCREEN";
        else                         _text = "WINDOWED";
        _xl  = TextArea2_xr;
        _xl -= string_length(_text)*_font_w;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_FULLSCREEN
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_APP_SCALE:{
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        
        if(!window_get_fullscreen())
        {
            _text  = "x"+string(window_get_scale());
            _text += " ";
            _text += "("+string(window_get_width())+"x"+string(window_get_height())+")";
            _xl  = TextArea2_xr;
            _xl -= string_length(_text)*_font_w;
            _yt = _yt1;
            draw_text_(_xl,_yt, _text, _font, PI_MENU);
        }
        break;}//case MainOption_APP_SCALE
        
        
        
        
        /*
        // --------------------------------------------------------------------
        case MainOption_FLASHING:{
        _xl  = drawX+MenuWindow_w; // window xr
        _xl -= 8; // window border
        _xl -= 4; // pad
        _xl -= BackgroundFlash_W;
        
        _yt  = _yt1;       // text yt
        _yt += _font_h>>1; // text yc
        _yt -= BackgroundFlash_H>>1; // color box yt
        
        if(!p.BackgroundFlash_setting) _color = p.dg_color_seq[#0,g.counter0&$3];
        else                           _color = p.dl_BackgroundFlash_COLORS[|p.BackgroundFlash_setting];
        draw_sprite_(spr_1x1_WHT,0, _xl,_yt, -1, BackgroundFlash_W,BackgroundFlash_H, _color);
        
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_FLASHING
        */
        
        
        
        
        /*
        // --------------------------------------------------------------------
        case MainOption_DIALOGUE_SPEED:{
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        
        _text = string(g.mod_DLG_SPEED+1);
        _xl  = TextArea2_xr;
        _xl -= string_length(_text)*_font_w;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_DIALOGUE_SPEED
        */
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_RANDO_OPTIONS:{
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_RANDO_OPTIONS
        
        
        
        
        // --------------------------------------------------------------------
        case MainOption_PAL_EDITOR:{
        _xl = TextArea1_xl;
        _yt = _yt1;
        draw_text_(_xl,_yt, _text, _font, PI_MENU);
        break;}//case MainOption_RANDO_OPTIONS
    }//switch(_i)
    
    
    
    
    if (_i==MainOption)
    {
        _x = Cursor_xl + (Cursor_W>>1);
        _y = _yt1 + (_font_h>>1); // text yc
        draw_sprite_(Cursor_SPRITE,0, _x,_y);
    }
    
    
    if (_i==MainOption_PC_SPRITES) _yt1 = _skin_sprite_yb;
    else                           _yt1 += _font_h;
}
pal_swap_reset();




