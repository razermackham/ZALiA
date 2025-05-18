/// Tyell_update()


GO_update_cs();


if (isVal(sub_state, SUB_STATE_IDLE1,SUB_STATE_LAUNCH_COUNTDOWN))
{
    if (ds_grid_get_compat(g.dg_RmTile_Break, xl>>3, yt>>3)&$FF != UNIQUE)
    {   // PC broke block before attack.
        timer = 0;
        sub_state = SUB_STATE_DONE1;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
}
else if (isVal(sub_state, SUB_STATE_ATK1,SUB_STATE_ATK2))
{
    GOB_update_2();
    
    if (state!=state_NORMAL 
    || !rectInRect(xl,yt,ww,hh, cam_xl_min(),cam_yt_min(),cam_x_range(),cam_y_range()) )
    {
        sub_state = SUB_STATE_DONE1;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else if (cs & (CS_BD1|CS_SW1|CS_PR1))
    {
         if (cs &  CS_BD1) enemy_collide_pc_body();
        //
        stun_timer = 0; // prevent stun flash
        
        
        audio_stop_sound(get_audio_theme_track(dk_StrikeEnemy));
        aud_play_sound(get_audio_theme_track(dk_BlockBreak));
        
        anim_frame = 0;
        timer = dg_anim[#anim_frame,0];
        sub_state = SUB_STATE_BREAK;
        exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    else if (sub_state==SUB_STATE_ATK2)
    {
        var _i, _x,_y;
        var _CLMS = ds_grid_width( g.dg_RmTile_solid);
        var _ROWS = ds_grid_height(g.dg_RmTile_solid);
        // 9 points. 3 TOP, 3 MID, 3 BTM
        //  .   .   .
        //  
        //  .   .   .
        //  
        //  .   .   .
        for(_i=0; _i<9; _i++)
        {
                _x  = _i mod 3;
                _y  = _i div 3;
                _x  = xl + (_x<<3) - (_x==2);
                _y  = yt + (_y<<3) - (_y==2);
                _x  = _x>>3;
                _y  = _y>>3;
            if(!_x 
            ||  _x>=_CLMS 
            || !_y 
            ||  _y>=_ROWS )
            {
                continue;
            }
            
            if (g.dg_RmTile_solid[#_x,_y] 
            && !g.dg_RmTile_Break[#_x,_y] )
            {
                aud_play_sound(get_audio_theme_track(dk_BlockBreak));
                
                anim_frame = 0;
                timer = dg_anim[#anim_frame,0];
                sub_state = SUB_STATE_BREAK;
                exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
        }
    }
}
else if (sub_state==SUB_STATE_BREAK)
{
    update_EF11();
}

















// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------


switch(sub_state)
{
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_IDLE1:{
    if (timer) break;
    
    // TyellManager will activate.
    break;}
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_LAUNCH_COUNTDOWN:{ // 
    if (timer) break;
    //if!(g.timer0&$FF) sdm("point_distance(x,y,g.pc.x,g.pc.y): "+hex_str(round(point_distance(x,y,g.pc.x,g.pc.y))));
    //if!(g.timer0&$FF) sdm("AGRO_DIST: $"+hex_str(AGRO_DIST));
    if (point_distance(x,y,g.pc.x,g.pc.y)>AGRO_DIST) break;
    if (LaunchCountdown_timer)
    {
        LaunchCountdown_timer--;
        break;
    }
    
    
    // ------------------------------------------------
            hspd = 0;
            vspd = 0;
    switch(ver){
    case 1:{vspd = (AIM_SPD * -sign_(y-g.pc.y)) &$FF; break;}
    case 2:{hspd = (AIM_SPD * -sign_(x-g.pc.x)) &$FF; break;}
    case 3:{vspd = (AIM_SPD * -sign_(y-g.pc.y)) &$FF; break;
            hspd = (AIM_SPD * -sign_(x-g.pc.x)) &$FF; break;}
    } // switch(ver)
    
    
    
    
    
    // Remove tile's solid, unique, hidden
    Tyell_update_1();
    
    
    can_draw_self = true;
    
    timer = AGRO_DUR;
    sub_state = SUB_STATE_ATK1;
    break;}
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_ATK1:{ // Aim
    if (timer) break;
    
    
    if (hspd)
    {
        updateX();
        if!((g.pc.x-x) * sign8b(hspd))
        {
            set_xy(id, g.pc.x, y);
            hspd = 0;
            vspd = (ATCK_SPD * -sign_(y-g.pc.y)) &$FF;
            timer     = ATK_DELAY1_DUR;
            sub_state = SUB_STATE_ATK2;
        }
    }
    else if (vspd)
    {
        var            _PC_Y  = g.pc.y-8;
        if (ATK_LEVEL) _PC_Y += $10;
        
        if!((_PC_Y-y) * sign8b(vspd))
        {
            hspd = (ATCK_SPD * -sign_(x-g.pc.x)) &$FF;
            vspd = 0;
            timer     = ATK_DELAY1_DUR;
            sub_state = SUB_STATE_ATK2;
        }
        else
        {
            updateY();
        }
    }
    break;}
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_ATK2:{ // 
    if (timer) break;
    
    
    if (hspd) updateX();
    if (vspd) updateY();
    break;}
    
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_BREAK:{ // 
    if (timer) break;
    
        anim_frame++;
    if (anim_frame>=ds_grid_width(dg_anim))
    {
        timer = $20; // Delays opening door (if one is waiting)
        sub_state = SUB_STATE_DONE1;
    }
    else
    {
        timer = dg_anim[#anim_frame, 0];
    }
    break;}
    
    
    
    
    
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_DONE1:{ // 
    if (timer) break;
    
    
    can_draw_self = false;
    GOB_update_data_defeated(id);
    
    sub_state = SUB_STATE_DONE;
    break;}
    
    
    
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    // ------------------------------------------------------------------
    case SUB_STATE_DONE:{ // 
    if (timer) break;
    
    
    can_draw_self = false;
    
    // Remove tile's solid, unique, hidden
    Tyell_update_1();
    
    state = 0;
    if (g.mod_destroy_go_on_death) GO_destroy_1a();
    break;}
}




