/// OptionsMenu_Create()


var _i,_j, _a, _idx, _val, _count,_count0,_count1,_count2, _len;
var _x,_y, _w,_h;
var _dk,_dk0,_dk1,_dk2,_dk3;
var _first;
var _text, _font, _size;
var _theme;


dm_options = ds_map_create();




timer2 = 0;


DURATION0 = $4; // input delay 1
DURATION1 = $8; // input delay 2
DURATION2 = $2; // input delay 3


//RandoOptionsMenu_IS_LIVE      = false;
//RandoOptionsMenu_is_available = false;
can_play_boss_music_at_open_RandomCustom = false;


Font1 = spr_Font1;
Font1_CHAR_SIZE = sprite_get_width(Font1);

Font2 = spr_Font2_1;
//Font2 = spr_Font2;
Font2_CHAR_SIZE = sprite_get_width(Font2);


MenuWindow_w  = 0;
MenuWindow_h  = 0;
MenuWindow_yb = 0;


TextArea1_xl = 0;
TextArea1_xr = 0;
TextArea2_xl = 0;
TextArea2_xr = 0;


Cursor_xl = 0;
Cursor_SPRITE = spr_menu_bottle_icon;
Cursor_W      = sprite_get_width( Cursor_SPRITE);
Cursor_H      = sprite_get_height(Cursor_SPRITE);


CONFIRM_SOUND1 = get_audio_theme_track(dk_ChooseChar);
//CONFIRM_SOUND2 = get_audio_theme_track(dk_ItemDrop);
BACK_SOUND1    = get_audio_theme_track(STR_Stab);
//BACK_SOUND1    = get_audio_theme_track(dk_StrikeEnemy);
CURSOR_SOUND1  = get_audio_theme_track(dk_CursorSpellMenu);


PI_MENU  = global.PI_GUI1;
PI_DARK1 = add_pi_permut(global.PI_GUI2, "WBRGYKMC", "OptionsMenu dark text 1");
PI_DARK2 = add_pi_permut(global.PI_GUI2, "RWBGMKYC", "OptionsMenu dark text 2");
//PI_DARK2 = add_pi_permut(global.PI_GUI2, "RBWGMKYC", "OptionsMenu dark text 2");


PCSpriteWalk_DURATION = 4;
PCSpriteWalk_timer    = PCSpriteWalk_DURATION;
PCSpriteWalk_frame    = 0;


OpenClose_Key_KEY = ord("O");
OpenClose_Key_pressed = false;

//Backout_BUTTON = 0;
Backout_requested = false;

start_button_pressed  = false;
select_button_pressed = false;
a_button_pressed      = false; // equivilent to NES-A and xbox-A
b_button_pressed      = false; // equivilent to NES-B and xbox-B
right_input_pressed   = false;
left_input_pressed    = false;
down_input_pressed    = false;
up_input_pressed      = false;




gui_state_backup = 0;




_first=1;                _a=_first;
//state_oc         = 0; // oc: Open Close
sub_state_IDLE_CLOSED  = _a++;
sub_state_OPENING1     = _a++;
sub_state_OPENING2     = _a++;
sub_state_OPENING_ANIM = _a++;
sub_state_OPEN1        = _a++;
sub_state_CLOSING1     = _a++;
sub_state_CLOSING2     = _a++;
sub_state_CLOSING_ANIM = _a++;
sub_state_CLOSING3     = _a++;
sub_state              = _first;




_first=1;                  _a=_first;
menu_state_MAIN          = _a++;
menu_state_INPUT_CONFIG  = _a++;
menu_state_DEV_TOOLS     = _a++;
menu_state_AUDIO_CUSTOM  = _a++;
menu_state_RANDO_OPTIONS = _a++;
menu_state_OTHER         = _a++;
menu_state               = _first;








// --------------------------------------------------------
MainOptions_dg = ds_grid_create(0,2);
//                                                                          //
MainOption_SND_VOL           = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "SOUND ";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font1;
//                                                                          //
MainOption_MUS_VOL           = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "MUSIC ";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font1;
//                                                                          //
MainOption_MUSIC_SET         = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "AUDIO SET";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_PC_SPRITES        = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "PLAYER SKIN ";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_INPUT_CONFIG      = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "EDIT CONTROLS";
//MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "CONTROLS";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_FULLSCREEN        = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "FULLSCREEN STATE";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_APP_SCALE         = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "APP SCALE";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //

/*
MainOption_FLASHING          = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "BACKGROUND FLASHING";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
*/

/*
MainOption_DIALOGUE_SPEED    = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "DIALOGUE SPEED";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
*/

MainOption_DEV_TOOLS         = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "DEV TOOLS";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_OTHER             = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "OTHER";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_RANDO_OPTIONS     = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "RANDO OPTIONS";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_PAL_EDITOR        = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "OPEN PALETTE EDITOR";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_FORCE_GAMEOVER    = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "FORCE GAMEOVER";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption_CLOSE             = ds_grid_width(MainOptions_dg);
ds_grid_resize(MainOptions_dg, ds_grid_width(MainOptions_dg)+1,ds_grid_height(MainOptions_dg));
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,0] = "CLOSE";
MainOptions_dg[#ds_grid_width(MainOptions_dg)-1,1] = Font2;
//                                                                          //
MainOption = 0;


MainOption_COUNT = ds_grid_width(MainOptions_dg);


TEXT_LENGTH1 = 1;
for(_i=0; _i<MainOption_COUNT; _i++)
{
    _len = string_length(MainOptions_dg[#_i,0]);
    if (_len>TEXT_LENGTH1) TEXT_LENGTH1 = _len;
}

TEXT_LENGTH2 = TEXT_LENGTH1-2;
TEXT_LENGTH3 = TEXT_LENGTH1+6;








// --------------------------------------------------------
_first=1;                  _a=_first;
InputConfigState_MAIN    = _a++;
InputConfigState_EDITING = _a++;
InputConfigState         = _first;


_first=0;                   _a=_first;
InputConfigOption_RIGHT   = _a++;
InputConfigOption_LEFT    = _a++;
InputConfigOption_DOWN    = _a++;
InputConfigOption_UP      = _a++;
InputConfigOption_MAGIC   = _a++; // NES SELECT
InputConfigOption_PAUSE   = _a++; // NES START
InputConfigOption_ATTACK  = _a++; // NES B
InputConfigOption_JUMP    = _a++; // NES A
InputConfigOption_DEFAULT = _a++;
InputConfigOption_BACK    = _a++;
InputConfigOption         = _first;

InputConfigOption_COUNT   = _a;



_font = Font2;
_size = sprite_get_width(_font);

dg_InputConfigOptions = ds_grid_create(InputConfigOption_COUNT,8);
//                                                                          //
//ds_grid_resize(dg_InputConfigOptions, ds_grid_width(dg_InputConfigOptions)+1, ds_grid_height(dg_InputConfigOptions));
_a=0;                  _i=InputConfigOption_RIGHT;
dg_InputConfigOptions[#_i,0] = "RIGHT";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_LEFT;
dg_InputConfigOptions[#_i,0] = "LEFT";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_DOWN;
dg_InputConfigOptions[#_i,0] = "DOWN";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_UP;
dg_InputConfigOptions[#_i,0] = "UP";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_MAGIC;
dg_InputConfigOptions[#_i,0] = "MAGIC";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_PAUSE;
dg_InputConfigOptions[#_i,0] = "PAUSE";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_ATTACK;
dg_InputConfigOptions[#_i,0] = "ATTACK";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_JUMP;
dg_InputConfigOptions[#_i,0] = "JUMP";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=3;                 _i=InputConfigOption_DEFAULT;
dg_InputConfigOptions[#_i,0] = "SET DEFAULTS";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //
_a+=2;                 _i=InputConfigOption_BACK;
dg_InputConfigOptions[#_i,0] = "BACK";
dg_InputConfigOptions[#_i,1] = _font;
//                                                                          //


InputConfigOption_COUNT = ds_grid_width(dg_InputConfigOptions);








// --------------------------------------------------------
_first=1;               _a=_first;
DevToolsState_MAIN    = _a++;
//DevToolsState_EDITING = _a++;
DevToolsState         = _first;


_first=0;                  _a=_first;
DevTools_DEV_TOOLS_STATE = _a++;
DevTools_SET_DEFAULT     = _a++; // Turn all options off
DevTools_APP_PERFORMANCE = _a++; // App Performance. show_debug_overlay()
DevTools_HITBOXES        = _a++; // Show hitboxes
DevTools_SCP             = _a++; // Solid Collision Points
DevTools_XY              = _a++; // Show xy points
DevTools_OCS             = _a++; // Off Camera State
DevTools_OG_CAM          = _a++; // Original Game Camera outline
DevTools_HP              = _a++; // Show HP
DevTools_SPRITE_OUTLINE  = _a++; // Show sprite outlines
DevTools_FRAME_COUNT     = _a++; // App frame count
DevTools_BGR_BLACK       = _a++; // All rm background color black
DevTools_EXITS           = _a++; // Show exits
DevTools_SOLID_TILES     = _a++; // Highlight solid tiles
DevTools_UNIQUE_TILES    = _a++; // Highlight unique tiles
DevTools_DUNGEON_MAP     = _a++; // Full dungeon map
DevTools_ADD_ITEMS       = _a++; // Add items by stabbing them
DevTools_DOUBLE_JUMP     = _a++; // Gives player FEATHER item (Double Jump)
DevTools_PC_DASH         = _a++; // Toggle ability to move faster
DevTools_INVULNERABILITY = _a++; // Invulnerability state
DevTools_BACK            = _a++;
DevTools_cursor          = _first;

DevTools_COUNT = _a;




_font = Font2;
_size = sprite_get_width(_font);

dg_DevTools = ds_grid_create(DevTools_COUNT,8);
//                                                                          //
_a=0;        _i=DevTools_DEV_TOOLS_STATE;
dg_DevTools[#_i,0] = "DEV TOOLS STATE";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_SET_DEFAULT;
dg_DevTools[#_i,0] = "SET ALL TO DEFAULT";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_APP_PERFORMANCE;
dg_DevTools[#_i,0] = "APP PERFORMANCE";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_HITBOXES;
dg_DevTools[#_i,0] = "HITBOXES";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_SCP;
dg_DevTools[#_i,0] = "SOLID COLLISION POINTS";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_XY;
dg_DevTools[#_i,0] = "XY POINTS";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_OCS;
dg_DevTools[#_i,0] = "OFF-CAMERA LINES";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_OG_CAM;
//dg_DevTools[#_i,0] = "OG CAMERA OUTLINE";
dg_DevTools[#_i,0] = "ORIGINAL GAME CAMERA OUTLINE";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_HP;
dg_DevTools[#_i,0] = "HP";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_SPRITE_OUTLINE;
dg_DevTools[#_i,0] = "SPRITE OUTLINES";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_FRAME_COUNT;
dg_DevTools[#_i,0] = "APP FRAME COUNT";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_BGR_BLACK;
dg_DevTools[#_i,0] = "ROOM BACKGROUNDS BLACK ONLY";
//dg_DevTools[#_i,0] = "ALL ROOM BGR BLACK";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_EXITS;
dg_DevTools[#_i,0] = "EXITS";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_SOLID_TILES;
dg_DevTools[#_i,0] = "HIGHLIGHT SOLID TILES";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_UNIQUE_TILES;
dg_DevTools[#_i,0] = "HIGHLIGHT UNIQUE TILES";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_DUNGEON_MAP;
dg_DevTools[#_i,0] = "COMPLETE DUNGEON MAPS";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_ADD_ITEMS;
dg_DevTools[#_i,0] = "ADD ITEMS CHEAT";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_DOUBLE_JUMP;
dg_DevTools[#_i,0] = "DOUBLE JUMP";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_PC_DASH;
dg_DevTools[#_i,0] = "FASTER PC HSPD";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_INVULNERABILITY;
dg_DevTools[#_i,0] = "INVULNERABILITY STATE";
dg_DevTools[#_i,1] = _font;
//                                                                          //
_a+=2;       _i=DevTools_BACK;
dg_DevTools[#_i,0] = "BACK";
dg_DevTools[#_i,1] = _font;
//                                                                          //








// -------------------------------------------------------------
// -------------------------------------------------------------
// -------------------------------------------------------------
_first=1;               _a=_first;
AudioCustomState_MAIN = _a++;
AudioCustomState      = _first;


_first=0;                _a=_first;
AudioCustom_BACK       = _a++;
AudioCustom_TOGGLE_ALL = _a++;
AudioCustom_TOGGLE_SET = _a++;
AudioCustom_Themes_IDX = _a;
AudioCustom_cursor     = _first;

//AudioCustom_COUNT = _a + val(Audio.dm[?STR_Theme+STR_Count+STR_Music]);
//AudioCustom_COUNT = _a;


dm_AudioCustom = ds_map_create();

// 0: all off, 1: at least 1 on, 2: all on
OptionsMenu_AudioCustom_refresh_indicator_states();

_font = Font2;
_size = sprite_get_width(_font);
var _dg_w = 0;
var _dg_H = 5;
dg_AudioCustom = ds_grid_create( _dg_w,_dg_H);
//                                                                          //
ds_grid_resize(dg_AudioCustom, ++_dg_w,_dg_H);
dg_AudioCustom[#_dg_w-1,0] = "BACK";
dg_AudioCustom[#_dg_w-1,1] = _font;
dg_AudioCustom[#_dg_w-1,4] = dg_AudioCustom[#_dg_w-1,0];
//                                                                          //
ds_grid_resize(dg_AudioCustom, ++_dg_w,_dg_H);
dg_AudioCustom[#_dg_w-1,0] = "TOGGLE ALL";
dg_AudioCustom[#_dg_w-1,1] = _font;
dg_AudioCustom[#_dg_w-1,3] = 3; // 3: state indicator
dg_AudioCustom[#_dg_w-1,4] = dg_AudioCustom[#_dg_w-1,0];
//                                                                          //
ds_grid_resize(dg_AudioCustom, ++_dg_w,_dg_H);
dg_AudioCustom[#_dg_w-1,0] = "TOGGLE SETS";
dg_AudioCustom[#_dg_w-1,1] = _font;
dg_AudioCustom[#_dg_w-1,2] = false; // 2: open state
dg_AudioCustom[#_dg_w-1,4] = dg_AudioCustom[#_dg_w-1,0];
//                                                                          //
//ds_grid_resize(dg_AudioCustom, ++_dg_w,_dg_H); // divider
//dg_AudioCustom[#_dg_w-1,0] = "DIVIDER";
//                                                                          //
_count = val(Audio.dm[?STR_Theme+STR_Count+STR_Music]);
//sdm(STR_Theme+STR_Count+STR_Music+": $"+hex_str(_count));
for(_i=1; _i<=_count; _i++)
{
    _theme = Audio.dm[?STR_Theme+STR_Music+hex_str(_i)];
    if(!is_undefined(_theme))
    {
        ds_grid_resize(dg_AudioCustom, ++_dg_w,_dg_H);
        dg_AudioCustom[#_dg_w-1,0] = _theme;
        dg_AudioCustom[#_dg_w-1,1] = _font;
        dg_AudioCustom[#_dg_w-1,2] = false; // 2: open state
        dg_AudioCustom[#_dg_w-1,3] = 3; // 3: state indicator
        
        _text = val(Audio.dm[?_theme+STR_Description], _theme);
        dg_AudioCustom[#_dg_w-1,4] = _text;
    }
}
//                                                                          //

AudioCustom_COUNT = _dg_w;


AudioCustom_cursor2 = 0;
AudioCustom_track_inst = 0;

AudioCustom_Scroll_Cursor_y = 0;


AudioCustom_PLAY_KEY = vk_space;
//AudioCustom_PLAY_KEY = ord("Y");


//StateIndicator_SIZE = $6;








// -------------------------------------------------------------
// -------------------------------------------------------------
// -------------------------------------------------------------
_first=1;                 _a=_first;
RandoOptions_state_MAIN = _a++;
RandoOptions_state      = _first;


_font = Font2;
_size = sprite_get_width(_font);

dg_RandoOptions = ds_grid_create(0,8);
//                                                                          //
RandoOptions_MARK_ACQUIRED    = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "MARK ACQUIRED ITEM";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_HINTS            = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "ITEM LOCATION HINTS";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_MAPS_SHOW_KEYS   = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "KEYSANITY - MAPS SHOW KEYS";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_RANDO_ENEMY      = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "ENEMY RANDO       ";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_DUNGEON_TILESETS = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "RANDO DUNGEON TILSETS";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_RANDO_OW_TILES   = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "RANDO OW TILES    ";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_SCENES           = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "RANDO ROOMS";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_RANDO_PALETTE    = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "PALETTE RANDO     ";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
/*
RandoOptions_MARK_HIDDEN_EXIT = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "MARK HIDDEN OVERWORLD EXITS";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
*/
RandoOptions_BACK             = ds_grid_width(dg_RandoOptions);
ds_grid_resize(dg_RandoOptions, ds_grid_width(dg_RandoOptions)+1,ds_grid_height(dg_RandoOptions));
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,0] = "BACK";
dg_RandoOptions[#ds_grid_width(dg_RandoOptions)-1,1] = _font;
//                                                                          //
RandoOptions_cursor = 0;
RandoOptions_COUNT = ds_grid_width(dg_RandoOptions);








// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
_first=1;          _i=_first;
Other_state_MAIN = _i++;
Other_state      = _first;


_i = -1;
_dk0 = "Other";


_j = 0;
Other_FLASHING = ++_i;
_dk1 = _dk0+"_BackgroundFlashing";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "BACKGROUND FLASHING";
dm_options[?_dk2+STR_Description]                  = "THE COLOR THE BACKGROUND DURING EVENTS LIKE; SPELLS, BOSS EXPLOSIONS, ETC...";
//                                                                          //
_j = 0;
Other_DIALOGUE_SPEED = ++_i;
_dk1 = _dk0+"_DialogueSpeed";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "DIALOGUE SPEED";
dm_options[?_dk2+STR_Description]                  = "1 IS THE ORIGINAL GAME SPEED";
//                                                                          //
_j = 0;
Other_HIDDEN_OW_EXITS = ++_i;
_dk1 = _dk0+"_HiddenOverworldExits";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "HIDDEN OVERWORLD EXITS";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "HIDE";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "MARK";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": NORMAL";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": OVERWORLD TILES WITH A HIDDEN EXIT WILL BE MARKED WITH A SPARKLE ANIMATION";
//                                                                          //
_j = 0;
Other_HUD = ++_i;
_dk1 = _dk0+"_HUD";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "HUD STATE";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "HIDE";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "MINIMAL";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "FULL";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": HUD INCLUDES EXTRA INFORMATION THAN WHAT THE ORIGINAL GAME DOES";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": HUD ONLY DISPLAYS INFORMATION FROM THE ORIGINAL GAME";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"02"+STR_Text]))+": HIDE THE HUD";
//                                                                          //
_j = 0;
Other_TORCH_LIGHTING = ++_i;
_dk1 = _dk0+"_TorchLighting";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "TORCH LIGHTING";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "STAB";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "AUTO";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": TOUCHING A TORCH WILL LIGHT IT";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": STABBING A TORCH TO LIGHT IT";
//                                                                          //
/*
//global.RenderFrameDelay_state!=-1 // -1: App will not include this option
_j = 0;
Other_RENDER_DELAY = ++_i;
_dk1 = _dk0+"_RenderDelay";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "RENDER DELAY";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "OFF";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "ON";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": NO RENDER DELAY";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": RENDER IS DELAYED BY 1 FRAME LIKE THE ORIGINAL GAME";
//                                                                          //
*/
_j = 0;
Other_SCREEN_SHAKE = ++_i;
_dk1 = _dk0+"_ScreenShake";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "SCREEN SHAKE";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "OFF";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "ON";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": CERTAIN ACTIONS CAUSE THE SCREEN TO SHAKE";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": NO SCREEN SHAKE";
//                                                                          //
_j = 0;
Other_STAB_FRENZY = ++_i;
_dk1 = _dk0+"_StabFrenzy";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "STAB FRENZY";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "OFF";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "ON";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": NO ACTION";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": HOLD ATTACK TO DO A FRENZY OF STABS";
//                                                                          //
_j = 0;
Other_ANARKHYA_OW = ++_i;
_dk1 = _dk0+"_AnarkhyaOverworld";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "OVERWORLD GRAPHICS BY: ANARKHYA, WYNG";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "OFF";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "ON";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": NORMAL OVERWORLD GRAPHICS";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": OVERWORLD WILL USE GRAPHICS BY ANARKHYA AND WYNG";
//                                                                          //
_j = 0;
Other_HALLOWEEN1 = ++_i;
_dk1 = _dk0+"_Halloween1";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "IT'S HALLOWEEN?";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "NO";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "YES";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": NORMAL";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": IT'S HALLOWEEN!";
//                                                                          //
/*
_j = 0;
Other_SHOW_ACTIVE_SPELLS = ++_i;
_dk1 = _dk0+"_ShowActiveSpells";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "SHOW ACTIVE SPELLS";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "NO";
dm_options[?_dk2+STR_State+hex_str(_j++)+STR_Text] = "YES";
dm_options[?_dk2+STR_Description]                  =                  string(val(dm_options[?_dk2+STR_State+"00"+STR_Text]))+": ACTIVE SPELLS WILL SHOW AS RED";
dm_options[?_dk2+STR_Description]                 += g.CHAR_END_LINE1+string(val(dm_options[?_dk2+STR_State+"01"+STR_Text]))+": ACTIVE SPELLS WILL BE THEIR NORMAL COLOR";
//                                                                          //
*/
_j = 0;
Other_BACK = ++_i;
_dk1 = _dk0+"_Back";
_dk2 = _dk0+hex_str(_i);
dm_options[?_dk2+STR_Datakey]                      = _dk1;
dm_options[?_dk2+STR_Option+STR_Text]              = "BACK";
dm_options[?_dk2+STR_Description]                  = "RETURN TO MAIN MENU";
//                                                                          //

_count0 = _i+1;
dm_options[?_dk0+STR_Count] = _count0;


for(_i=0; _i<_count0; _i++)
{
    _dk2 = _dk0+hex_str(_i);
    _dk1 = dm_options[?_dk2+STR_Datakey];
    if(!is_undefined(_dk1))
    {
        dm_options[?_dk1+STR_Option+STR_Num]  = _i;
        dm_options[?_dk1+STR_Option+STR_Text] = val(dm_options[?_dk2+STR_Option+STR_Text]);
        dm_options[?_dk2+STR_Option+STR_Font] = Font2;
        dm_options[?_dk1+STR_Option+STR_Font] = val(dm_options[?_dk2+STR_Option+STR_Font]);
        dm_options[?_dk1+STR_Description]     = val(dm_options[?_dk2+STR_Description]);
        dm_options[?_dk2+STR_State]           = 0;
        dm_options[?_dk1+STR_State]           = val(dm_options[?_dk2+STR_State]);
        _j = 0;
        while (true)
        {
            _text = dm_options[?_dk2+STR_State+hex_str(_j)+STR_Text];
            if (is_undefined(_text)) break;//while (true)
            dm_options[?_dk1+STR_State+hex_str(_j)+STR_Text] = _text;
            dm_options[?_dk2+STR_State+STR_Count] = ++_j;
            dm_options[?_dk1+STR_State+STR_Count] =   _j;
        }
    }
}


Other_cursor = 0;








// -------------------------------------------------------------
// -------------------------------------------------------------
// -------------------------------------------------------------
YOFF_HEAD = 1;
YOFF_OPTN = YOFF_HEAD + 3; // 1st option y


// CURS: CURSor
XOFF_CURS = 1; // tile units
//XOFF_CURS = 2; // tile units
XOFF_TEXT  = XOFF_CURS + 1; // tile units
XOFF_TEXT1 = $10; // tile units




var _option_text_len_max   = 1;
var _option_text_width_max = 1;
for(_i=0; _i<MainOption_COUNT; _i++)
{
        _len = string_length(MainOptions_dg[#_i,0]);
    if (_len>_option_text_len_max) _option_text_len_max = _len;
    _font = MainOptions_dg[#_i,0];
    _w = sprite_get_width(_font) * _len;
    if (_w>_option_text_width_max) _option_text_width_max = _w;
}

for(_i=0; _i<InputConfigOption_COUNT; _i++)
{
        _len = string_length(dg_InputConfigOptions[#_i,0]);
    if (_len>_option_text_len_max) _option_text_len_max = _len;
    _font = dg_InputConfigOptions[#_i,0];
    _w = sprite_get_width(_font) * _len;
    if (_w>_option_text_width_max) _option_text_width_max = _w;
}

for(_i=0; _i<DevTools_COUNT; _i++)
{
        _len = string_length(dg_DevTools[#_i,0]);
    if (_len>_option_text_len_max) _option_text_len_max = _len;
    _font = dg_DevTools[#_i,0];
    _w = sprite_get_width(_font) * _len;
    if (_w>_option_text_width_max) _option_text_width_max = _w;
}

for(_i=ds_grid_width(dg_RandoOptions)-1; _i>=0; _i--)
{
        _len = string_length(dg_RandoOptions[#_i,0]);
    if (_len>_option_text_len_max) _option_text_len_max = _len;
    _font = dg_RandoOptions[#_i,0];
    _w = sprite_get_width(_font) * _len;
    if (_w>_option_text_width_max) _option_text_width_max = _w;
}

for(_i=val(dm_options[?"Other"+STR_Count])-1; _i>=0; _i--)
{
        _len = string_length(val(dm_options[?"Other"+hex_str(_i)+STR_Option+STR_Text],"0"));
    if (_len>_option_text_len_max) _option_text_len_max = _len;
    _font = val(dm_options[?"Other"+hex_str(_i)+STR_Option+STR_Font], Font2);
    _w = sprite_get_width(_font) * _len;
    if (_w>_option_text_width_max) _option_text_width_max = _w;
}

//OPTION_STATE_TEXT_XOFF = (_option_text_len_max+1) * _size;
OPTION_TEXT_WIDTH_MAX  =  _option_text_width_max;








// ------------------------------------------------------------
Window_W  = (g.GUI_WIN_CLMS2+2)<<3; // g.GUI_WIN_CLMS2 = 24
//Window_W  = g.GUI_WIN_CLMS2<<3; // g.GUI_WIN_CLMS2 = 24
Window_H  = viewH();
//Window_H -= $1<<3;
//Window_H  = viewH() - ($1<<3) - viewYT_OFF;
Window_H  = (Window_H>>3)<<3;

CLMS = Window_W>>3;
ROWS = Window_H>>3;
// 8 pixel width/height
//CLMS = g.GUI_WIN_CLMS2; // g.GUI_WIN_CLMS2 = 24
//ROWS = g.PAUSE_MENU.ROWS_WIN_DEF; // 8p tall

viewYT_OFF = ((viewH()>>3)<<3) - Window_H;
//viewYT_OFF = (viewH()-($1<<3)) - Window_H;




Main_CLMS        = OPTION_TEXT_WIDTH_MAX>>3;
Main_CLMS       += $A; // padding between option text and option state text
Main_CLMS        = max(CLMS+$A, Main_CLMS);
InputConfig_CLMS = CLMS+$3;
//draw_clms_COUNT  = Main_CLMS;
//draw_clms_COUNT  = CLMS+$3;
//draw_clms_max    = draw_clms_COUNT;
draw_clms_count  = Main_CLMS;
//draw_clms_count  = draw_clms_COUNT;

Main_ROWS = ROWS;
/*
if (viewYT_OFF+(Main_ROWS<<3) >= viewH())
{
    _val  = viewH()-$8;
    _val += viewYT_OFF&$7;
    _val -= viewYT_OFF;
    Main_ROWS = _val>>3;
    Main_ROWS++;
}
*/

//Main_ROWS =  MainOption_COUNT<<1;
//Main_ROWS = (MainOption_COUNT<<1) + $05;


InputConfig_ROWS = (InputConfigOption_COUNT<<1) + $06;
if (viewYT_OFF+(InputConfig_ROWS<<3) >= viewH())
{
    _val  = viewH() - $8;
    _val += viewYT_OFF&$7;
    _val -= viewYT_OFF;
    InputConfig_ROWS = _val>>3;
    InputConfig_ROWS++;
}


draw_rows_count = 0;
draw_rows_max   = 0;


var _PAD = $8;
ScrollArea_Y_MIN  = $8; // frame
ScrollArea_Y_MIN += Font1_CHAR_SIZE; // menu title
ScrollArea_Y_MIN += _PAD; // title padding

ScrollArea_Y_MAX  = Window_H;
ScrollArea_Y_MAX -= $8; // frame
ScrollArea_Y_MAX -= _PAD; // frame padding

ScrollArea_H = ScrollArea_Y_MAX-ScrollArea_Y_MIN;


ANIM_FRAMES_DEF = g.PAUSE_MENU.ROWS_WIN_DEF>>1; // 11
anim_frame      = 0;




BackgroundFlash_W = $18;
BackgroundFlash_H = $08;




