/// Blooby_update()


if (ReactionAnim_timer) ReactionAnim_timer--;


updateX();
updateY();

GO_update_cs();

if (hspd){
    if (csRgt1X>=XC_MAX+ww_) cs|=$1;
    if (csLft1X< XC_MIN-ww_) cs|=$2;
}
if (vspd){
    if (csBtm1Y>=YC_MAX+ww_) cs|=$4;
    if (csTop1Y< YC_MIN-ww_) cs|=$8;
}
/*
if (hspd 
&& !(cs&$3) ){
    if (csRgt1X>=XC_MAX+ww_) cs|=$1;
    if (csLft1X< XC_MIN-ww_) cs|=$2;
}
if (vspd 
&& !(cs&$C) ){
    if (csBtm1Y>=YC_MAX+ww_) cs|=$4;
    if (csTop1Y< YC_MIN-ww_) cs|=$8;
}
*/

if (cs&$3 
&&  hspd 
&&  hspd_dir==sign_(cs&$1) )
{
    hspd_dir    = -hspd_dir;
    hspd        = (abs8b(hspd)*hspd_dir) &$FF;
    facingDir   = hspd_dir;
}

if (cs&$C 
&&  vspd 
&&  vspd_dir==sign_(cs&$4) )
{
    vspd_dir = -vspd_dir;
    vspd     = (abs8b(vspd)*vspd_dir) &$FF;
}





var _PC_VSPD = g.pc.vspd;



if(!hspd 
&& !(g.counter1&$3F) )
{
    facingDir = dir_to_pc_(id);
}

GO_update_cam_vars();
update_EF11();


update_body_hb_1a();
PC_update_sword_hb();

if (g.pc.SwordHB_collidable 
&&  collide_pc_sword(BodyHB_x,BodyHB_y, BodyHB_w,BodyHB_h, BodyHB_r) )
{
    cs |= CS_SW1;
}


if (cs&CS_SW1)
{
    var _REACTED = false;
    
    if (g.pc.behavior==g.pc.behavior_STAB_DOWN)
    {
        if (_PC_VSPD 
        &&  _PC_VSPD<$80 )
        {
            BounceVelocity  = round(abs8b(_PC_VSPD) * BounceVelocity_BASE);
            if (pc_is_cucco()) BounceVelocity += $3;
            BounceVelocity  = -max(BounceVelocity_MIN, BounceVelocity);
            BounceVelocity &= $FF;
            g.pc.vspd = BounceVelocity;
            
            _REACTED = true;
        }
    }
    else if (g.pc.behavior==g.pc.behavior_STAB_UP)
    {
        //g.pc.vspd = 0;
        //_REACTED = true;
    }
    else if (isVal(g.pc.behavior, g.pc.behavior_STAB_STAND,g.pc.behavior_STAB_CROUCH))
    {
        g.control1_timer = g.pc.Pushback_DURATION; // PC atk will NOT affect PC.hspd
        pushback_pc(x, hspd_PUSHBACK);
        _REACTED = true;
    }
    
    if (_REACTED)
    {
        ReactionAnim_timer = ReactionAnim_DUR1;
        //aud_play_sound(Audio.SND_STRK_ENM1, 0,false, .5);
        aud_play_sound(get_audio_theme_track(dk_ElevatorMove));
        aud_play_sound(get_audio_theme_track(STR_Stab));
        aud_play_sound(Audio.SND_STEP_1A);
        //aud_play_sound(Audio.SND_BOOMERANG);
        //aud_play_combo1(9);
    }
}

/*
if (ReactionAnim_timer & ReactionAnim_TIMING 
//&&  ReactionAnim_timer > ReactionAnim_DUR1-(ReactionAnim_TIMING<<3) 
&& (ReactionAnim_timer &(ReactionAnim_TIMING-1) == (ReactionAnim_TIMING-1)) )
{
    aud_play_sound(Audio.SND_WLK_WTR1A, 0,false, .3);
    aud_play_sound(Audio.SND_ELEV_MVE1, 0,false, .4);
    //aud_play_combo1(9);
}
*/

cs &= ~CS_SW1;
BounceVelocity  = 0;

//if (cs&CS_BD1) enemy_collide_pc_body();





/*
switch(sub_state)
{
    // ======================================================
    // ----------------------------------------------
    case sub_state_IDLE:{
    if (timer) break;
    break;}
    
    
    
    
    
    
    
    // ======================================================
    // ----------------------------------------------
    case sub_state_BOUNCE:{
    if (timer) break;
    break;}
}
*/




