/// PalettePicker_Create()


var _i, _a;


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


dm_pal_edit = ds_map_create();

//PI_OFFSET = global.PI_GUI1;
PI_OFFSET = global.PI_PC1;
PAL_COUNT = p.PI_DRK1 - PI_OFFSET;
/*
PI_OFFSET  = global.PI_PC1;
PAL_COUNT  = p.PAL_PER_SET;
PAL_COUNT -= 1; // PAL BASE
PAL_COUNT -= val(global.dm_pi[?"GUI"+STR_Count],1); // MENU PAL
PAL_COUNT += p.PAL_PER_SET; // Dark pals
//COL_PER_PAL_  = global.COLORS_PER_PALETTE;
*/


// PALS1: For viewing whole palette
PALS1_SCALE = 2;
PALS1_X     = $01<<3;
PALS1_Y     = $05<<3;


// Color Grid
ColorGrid_SPR   = spr_color_grid_2c;
ColorGrid_SCALE = _SCALE1;
ColorGrid_X     = $01<<3;
ColorGrid_Y     = $01<<3;
ColorGrid_W     = sprite_get_width( ColorGrid_SPR);
ColorGrid_H     = sprite_get_height(ColorGrid_SPR);
ColorGrid_W2    = ColorGrid_W * ColorGrid_SCALE;
ColorGrid_H2    = ColorGrid_H * ColorGrid_SCALE;


// Edit mode
PALS2_SCALE = _SCALE1;
PALS2_X     = ColorGrid_X + ColorGrid_W2 + ($01<<3);
PALS2_X    -= PI_OFFSET * PALS2_SCALE;
PALS2_Y     = ColorGrid_Y;
PALS2_X2    = PALS2_X + (PI_OFFSET * PALS2_SCALE);;
PALS2_Y2    = PALS2_Y;
PALS2_w     = global.palette_image_w * PALS2_SCALE;
PALS2_H     = global.COLORS_PER_PALETTE * PALS2_SCALE;
PALS2_W2    = PAL_COUNT * PALS2_SCALE;


// Object Palettes
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


DELAY1_DUR = $10;
DELAY2_DUR = $20;
DELAY3_DUR = $40;
DELAY4_DUR = $80;
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
dl_hist_sess_MAX = $80;

// Palette history for the current rm.
dl_hist_room     = ds_list_create();
dl_hist_room_MAX = $80;
//
// A backup if session is cancelled.
pal_at_sess_start     = "";
pal_before_edit_color = "";
pal_in_editor         = ""; // Current palette affecting screen while in edit mode(STATE_PKM2)



//pal_curs_idx_DEF  = 0;
pal_curs_idx_DEF  = (global.PI_BGR1-PI_OFFSET) * global.COLORS_PER_PALETTE;
pal_curs_idx      = pal_curs_idx_DEF;
//pal_curs_idx      = 0;
pal_curs_col      = 0;
col_idx_old_col   = 0;

col_curs_idx      = 0;
col_curs_idx_prev = col_curs_idx;
col_curs_col      = 0;
col_idx_new_col   = 0;

CURSOR_COLOR      = p.C_ORG2; // $27 orange, bright



bgr_at_sess_start     = ds_list_find_index(p.dl_COLOR,background_colour);
//bgr_at_sess_start     = p.background_color_index;
bgr_before_edit_color = bgr_at_sess_start;
bgr_in_editor         = bgr_at_sess_start; // Current bgr color affecting screen while in edit mode(STATE_PKM2)




