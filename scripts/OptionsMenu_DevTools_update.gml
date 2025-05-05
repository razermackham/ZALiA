/// OptionsMenu_DevTools_update()


var _i, _val;

var _InputConfirm_pressed  = a_button_pressed || start_button_pressed; // GP_Face1_pressed: xbox A
var _InputConfirm_pressed2 = _InputConfirm_pressed || Input.pressedH;

var _SOUND1 = CURSOR_SOUND1;
var _SOUND2 = CONFIRM_SOUND1;


// -------------------------------------------------------------------------------
if(!timer)
{
    if (Backout_requested 
    ||  (DevTools_cursor==DevTools_BACK && _InputConfirm_pressed) )
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_MAIN;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}





// -------------------------------------------------------------------------------
if(!timer2)
{
    if (select_button_pressed 
    ||  Input.pressedV )
    {
        var _DIR = sign_(select_button_pressed || Input.Down_pressed);
        for(_i=0; _i<DevTools_COUNT; _i++)
        {
            DevTools_cursor += _DIR;
            //DevTools_cursor += _DIR*(Input.GP_Shoulder2R_held*4);
            DevTools_cursor += DevTools_COUNT;
            DevTools_cursor  = DevTools_cursor mod DevTools_COUNT;
            if (OptionsMenu_option_is_avail(menu_state_DEV_TOOLS,DevTools_cursor))
            {
                aud_play_sound(_SOUND1);
                break;//_i
            }
        }
        
        timer2 = DURATION2;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}








// -------------------------------------------------------------------------------
switch(DevTools_cursor)
{
    // -------------------------------------------------
    case DevTools_DEV_TOOLS_STATE:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        g.DevTools_state = !g.DevTools_state;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_SET_DEFAULT:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        g.DevTools_state          = false;
        
        g.can_show_debug_overlay  = false;
        show_debug_overlay(g.can_show_debug_overlay);
        
        g.can_draw_hb             = false;
        g.can_draw_cs             = false;
        g.canDraw_ogXY            = false;
        g.can_draw_ocs            = false;
        g.can_draw_og_cam_outline = false;
        g.can_draw_hp             = false;
        g.canDrawSprOutline       = 0;
        
        global.App_frame_count_can_draw          = false;
        global.App_frame_count_unpaused_can_draw = false;
        global.Room_frame_count_can_draw         = false;
        
        g.all_bg_black_only = false;
        
        g.can_draw_Exit_hb  = false;
        g.can_show_t_solid  = false;
        g.can_show_t_unique = false;
        
        g.dev_DungeonMapShowAll = false;
        if (g.dungeon_num) DungeonMapVisible_refresh(g.dungeon_num);
        
        g.use_StabToCheat  = false;
        g.DoubleJump_state = false;
        //f.items           &= ~ITM_FTHR;
        g.DevDash_state    = 0; // 0: Off, 1: On, 2: On and dash input held
        g.dev_invState     = 0;
        
        save_game_pref();
        aud_play_sound(_SOUND2);
        aud_play_sound(get_audio_theme_track(dk_BlockBreak));
        timer = DURATION1;
    }
    break;}
    
    
    // -------------------------------------------------
    case DevTools_APP_PERFORMANCE:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_show_debug_overlay = !g.can_show_debug_overlay;
        save_game_pref();
        show_debug_overlay(g.can_show_debug_overlay);
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_HITBOXES:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_hb = !g.can_draw_hb;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_SCP:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_cs = !g.can_draw_cs;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_XY:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.canDraw_ogXY = !g.canDraw_ogXY;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    /*
    // -------------------------------------------------
    case DevTools_OCS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_ocs = !g.can_draw_ocs;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    // -------------------------------------------------
    case DevTools_OG_CAM:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_og_cam_outline = !g.can_draw_og_cam_outline;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_HP:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_hp = !g.can_draw_hp;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_SPRITE_OUTLINE:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = sign_(Input.Right_pressed || _InputConfirm_pressed);
        var _COUNT=3; // Sequences 0, 1, 2
        g.canDrawSprOutline += _DIR;
        g.canDrawSprOutline += _COUNT;
        g.canDrawSprOutline  = g.canDrawSprOutline mod _COUNT;
        //g.canDrawSprOutline = (g.canDrawSprOutline+1) mod 3; // Sequences 0, 1, 2
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_FRAME_COUNT:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        global.App_frame_count_can_draw          = !global.App_frame_count_can_draw;
        global.App_frame_count_unpaused_can_draw = !global.App_frame_count_unpaused_can_draw;
        global.Room_frame_count_can_draw         = !global.Room_frame_count_can_draw;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    /*
    // -------------------------------------------------
    case DevTools_BGR_BLACK:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.all_bg_black_only = !g.all_bg_black_only;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    // -------------------------------------------------
    case DevTools_EXITS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_draw_Exit_hb = !g.can_draw_Exit_hb;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_SOLID_TILES:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_show_t_solid = !g.can_show_t_solid;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_UNIQUE_TILES:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.can_show_t_unique = !g.can_show_t_unique;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_DUNGEON_MAP:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.dev_DungeonMapShowAll = !g.dev_DungeonMapShowAll;
        if (g.dungeon_num) DungeonMapVisible_refresh(g.dungeon_num);
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    
    // -------------------------------------------------
    case DevTools_ADD_ITEMS:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.use_StabToCheat = !g.use_StabToCheat;
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    /*
    // -------------------------------------------------
    case DevTools_DOUBLE_JUMP:{
    if (timer) break;
    
    if (_InputConfirm_pressed2 
    &&  f.items&ITM_FTHR )
    {
        g.DoubleJump_state = !g.DoubleJump_state;
        //if (f.items&ITM_FTHR) f.items &= ~ITM_FTHR;
        //else                  f.items |=  ITM_FTHR;
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    // -------------------------------------------------
    case DevTools_PC_DASH:{
    if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        g.DevDash_state = !sign(g.DevDash_state); // 0: Off, 1: On, 2: On and dash input held
        save_game_pref();
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    /*
    // -------------------------------------------------
    case DevTools_INVULNERABILITY:{
    //if (timer) break;
    
    if (_InputConfirm_pressed2)
    {
        var _DIR = sign_(Input.Right_pressed || _InputConfirm_pressed);
        var _COUNT=3;
        g.dev_invState &= $F;       // remove display timer bits
        g.dev_invState += _DIR;
        g.dev_invState += _COUNT;
        g.dev_invState  = g.dev_invState mod _COUNT;
        g.dev_invState |= $800;     // include display timer bit
        // Display timer bit starts at $800 and shifts right once every 
        // 8 frames until bit $008, which signals the end of the display
        aud_play_sound(_SOUND2);
        timer = DURATION1;
    }
    break;}
    */
    
    
    // -------------------------------------------------
    case DevTools_BACK:{
    if (timer) break;
    
    if (_InputConfirm_pressed)
    {
        aud_play_sound(BACK_SOUND1);
        timer = DURATION1;
        menu_state = menu_state_MAIN;
    }
    break;}
}




