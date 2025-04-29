/// PaletteEditor_Create()


var _i, _a, _count,_count1;
var _x,_y, _xl,_yt;
var _dk,_dk1,_dk2;


depth = DEPTH_HUD;
//depth = DEPTH_HUD-8;


                  _i=0;
state_IDLE      = _i++; // IDLE
state_EDIT1A    = _i++; // pick a color in a palette to change
state_EDIT1B    = _i++; // picking a new color from a color grid
state_BGR_COLOR = _i++; // Pick background color
state           = state_IDLE;



var _SCALE1 = 6;

// -1 Upper left, 0 Center left, 1 Bottom left
gui_alignment = -1;
gui_state_at_sess_start = 0;
gui_XLOFF = $01<<3; // camera pad
gui_YTOFF = $01<<3; // camera pad
gui_xl    = 0;
gui_yt    = 0;


// TODO: Need text says what input to confirm changes, and cancel
Font1_sprite = spr_Font2_1;
//Font1_sprite = spr_Font1;
Font1_W = sprite_get_width( Font1_sprite);
Font1_H = sprite_get_height(Font1_sprite);
color_old = 0;
color_new = 0;


ColorOutline1_surf   = 0;
ColorOutline1_COLOR1 = c_black;
ColorOutline1_COLOR2 = c_white;
ColorOutline1_Outline_W = 2;
ColorOutline1_W  = _SCALE1 + (ColorOutline1_Outline_W<<1);
ColorOutline1_H  = ColorOutline1_W;


// PalView: For viewing whole palette
PalView_enabled = false;
PalView_SCALE1  = 2;
PalView_SCALE2  = PalView_SCALE1<<1;
PalView_Outline_W = 2;
PalView_PAD1    = $02 * PalView_SCALE1;
PalView_w       = (global.palette_image_w*PalView_SCALE1) + PalView_Outline_W;
PalView_h       = (global.palette_image_h*PalView_SCALE1) + PalView_Outline_W;
PalView_XL      = $01<<3;
PalView_xl      = PalView_XL;
PalView_YT      = $05<<3;
PalView_yt      = PalView_YT;
PalView_PAL_COUNT_PC     = val(global.dm_pi[?"PC"+STR_Count]);
PalView_PAL_COUNT_PC    += 1; // disguise
PalView_PAL_COUNT_PC    += val(global.dm_pi[?"SPELL_PC"+STR_Count]);
PalView_PAL_COUNT_CUCCO  = val(global.dm_pi[?"CUCCO"+STR_Count]);
PalView_PAL_COUNT_CUCCO += 1; // disguise
PalView_PAL_COUNT_CUCCO += val(global.dm_pi[?"CUCCO_SPELL"+STR_Count]);
PalView_Outline_COLOR1   = c_black;
PalView_Outline_COLOR2   = c_white;


// Color Grid
ColorGrid_surf  = 0;
//ColorGrid_SCALE = 4;
ColorGrid_SCALE = _SCALE1;
ColorGrid_CLMS  = $10;
ColorGrid_ROWS  = $04;
ColorGrid_Outline_W = 2;
ColorGrid_W     = (ColorGrid_CLMS*ColorGrid_SCALE) + (ColorGrid_Outline_W<<1);
ColorGrid_H     = (ColorGrid_ROWS*ColorGrid_SCALE) + (ColorGrid_Outline_W<<1);;
ColorGrid_xl    = 0;
ColorGrid_yt    = 0;
ColorGrid_Cursor_clm = 0;
ColorGrid_Cursor_row = 0;
ColorGrid_dl_colors = ds_list_create();
_count1 = ColorGrid_CLMS*ColorGrid_ROWS;
for(_i=0; _i<_count1; _i++) ds_list_add(ColorGrid_dl_colors,p.dl_COLOR[|_i]);
//ColorGrid_Cursor_color = 0;


// GameObject Palettes
ObjPal_COL_SIZE   = 4;
ObjPalOutline_W   = 1;
ObjPal_DIST1      = ObjPal_COL_SIZE +  ObjPalOutline_W;
ObjPalBgr1_W      = ObjPal_COL_SIZE + (ObjPalOutline_W<<1);
ObjPalBgr1_H      = ObjPal_COL_SIZE *  global.COLORS_PER_PALETTE;
ObjPalBgr1_H     += ObjPalOutline_W * (global.COLORS_PER_PALETTE+1);
ObjPalBgr2_W      = ObjPalBgr1_W + (ObjPalOutline_W<<1);
ObjPalBgr2_H      = ObjPalBgr1_H + (ObjPalOutline_W<<1);
ObjPal_YT_OFFSET  = ObjPalBgr2_H;
ObjPal_YT_OFFSET += 2; // obj sprite pad
ObjPal_surf_W     = ObjPalBgr2_W;
ObjPal_surf_H     = ObjPalBgr2_H;
ObjPal_surf       = surface_create(ObjPal_surf_W,ObjPal_surf_H);
ObjPal_FONT       = spr_Font2_1;
ObjPal_FONT_W     = sprite_get_width( ObjPal_FONT);
ObjPal_FONT_H     = sprite_get_height(ObjPal_FONT);


// 
Cursor_can_draw = false;
Cursor_COLOR = c_orange;
//Cursor_COLOR = $00A0FF;
Cursor_W     = _SCALE1 + 4;
Cursor_H     = Cursor_W;
Cursor_xl    = 0;
Cursor_yt    = 0;
Cursor_surf  = 0;








// Edit mode
PalEdit_SCALE = _SCALE1;
PalEdit_xl    = 0;
PalEdit_yt    = 0;
PalEdit_Outline_W = 2;
PalEdit_Outline_surf = 0;
PalEdit_color_before_edit = 0;


PalEdit_dm = ds_map_create();
var _GROUP_SPACING  = PalEdit_SCALE;
    _GROUP_SPACING += 4; // extra spacing
_count1 = 0;
PalEdit_group_count = 0;
_xl = 0;
_yt = 0;

PalEdit_dm[?STR_Palette+"_XL"] = _xl;


// PC ----------------------------------------------------------
PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+"_XL"] = _xl;

if (val(global.dm_pi[?"PC"+STR_Count])>0)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.1";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC1;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"PC"+STR_Count])>1)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.2";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC2;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"PC"+STR_Count])>2)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "PLAYER ARMOR LVL.3";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_PC3;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

_dk1 = STR_Palette+hex_str(++_count1);
PalEdit_dm[?_dk1+STR_Name] = "PLAYER DISGUISE";
PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_DISGUISE_PC;
PalEdit_dm[?_dk1+"_XL"] = _xl;
_xl += PalEdit_SCALE;

PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+"_XL"]);




// CUCCO ----------------------------------------------------------
_xl += _GROUP_SPACING; // palette group padding
PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+"_XL"] = _xl;

if (val(global.dm_pi[?"CUCCO"+STR_Count])>0)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.1";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO1;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"CUCCO"+STR_Count])>1)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.2";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO2;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"CUCCO"+STR_Count])>2)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "CUCCO ARMOR LVL.3";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_CUCCO3;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

_dk1 = STR_Palette+hex_str(++_count1);
PalEdit_dm[?_dk1+STR_Name] = "CUCCO DISGUISE";
PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_DISGUISE_CUCCO;
PalEdit_dm[?_dk1+"_XL"] = _xl;
_xl += PalEdit_SCALE;

PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+"_XL"]);




// BGR ----------------------------------------------------------
_xl += _GROUP_SPACING; // palette group padding
PalEdit_dm[?STR_Group+hex_str(++PalEdit_group_count)+"_XL"] = _xl;

if (val(global.dm_pi[?"BGR"+STR_Count])>0)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "BGR 1";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR1;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"BGR"+STR_Count])>1)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "BGR 2";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR2;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"BGR"+STR_Count])>2)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "BGR 3";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR3;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"BGR"+STR_Count])>3)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "BGR 4";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR4;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

if (val(global.dm_pi[?"BGR"+STR_Count])>4)
{
    _dk1 = STR_Palette+hex_str(++_count1);
    PalEdit_dm[?_dk1+STR_Name] = "BGR 5";
    PalEdit_dm[?_dk1+STR_Palette+STR_Index] = global.PI_BGR5;
    PalEdit_dm[?_dk1+"_XL"] = _xl;
    _xl += PalEdit_SCALE;
}

PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+STR_Width] = _xl - val(PalEdit_dm[?STR_Group+hex_str(PalEdit_group_count)+"_XL"]);


PalEdit_PALS_W = _xl - val(PalEdit_dm[?STR_Palette+"_XL"]);
PalEdit_PALS_H = global.COLORS_PER_PALETTE * PalEdit_SCALE;
PalEdit_PAL_COUNT = _count1;
PalEdit_Cursor_clm = 0;
PalEdit_Cursor_row = 0;
//PalEdit_Cursor_color = 0; // the palette color under the cursor








DELAY1_DUR = $10;
DELAY2_DUR = $20;
DELAY3_DUR = $40;
DELAY4_DUR = $40;
DELAY5_DUR = $FF;
timer      = DELAY4_DUR;


PP   = 0; // 'P' key Pressed
PP0  = 0; // 'P' is ONLY key Pressed
PH   = 0; // 'P' key Held
PH0  = 0; // 'P' is ONLY key Held

CTL  = 0;
SHF  = 0;
ALT  = 0;
CTL0 = 0; // ONLY CTL held
SHF0 = 0; // ONLY SHF held
ALT0 = 0; // ONLY ALT held


EditRequested_Pal_counter = 0;
EditRequested_Bgr_counter = 0;


// Palette history for the current palette editing session.
dl_hist_sess     = ds_list_create();
//dl_hist_sess_MAX = $80;

// Palette history for the current rm.
dl_hist_room     = ds_list_create();
//dl_hist_room_MAX = $80;
//
// A backup if session is cancelled.
pal_before_edit_sess  = "";
pal_before_edit_color = "";
pal_during_edit       = ""; // Current palette affecting screen while in edit mode(STATE_PKM2)


BgrColor_before_edit = global.BackgroundColor_scene;
BgrColor_during_edit = BgrColor_before_edit;




