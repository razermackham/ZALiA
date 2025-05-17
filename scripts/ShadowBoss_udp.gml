/// ShadowBoss_udp()


if (g.mod_ShadowBoss_DrawWithFairy 
|| !pc_is_fairy() )
{
    can_draw_self = true;
    /// 9A77
    // ShadowBoss uses same code as PC, but I modded it because of 
    // various unneccessary stuff and ShadowBoss won't draw if PC 
    // is fairy.
    
    // 9A7F: JSR EC02
    draw_xoff = 0;
    draw_yoff = 0;
    
    // EC1E, EC40
    update_draw_xy();
    
    
    GO_set_sprite(id,PC_PLACEMENT_SPR);
    //GO_set_sprite(id,g.pc.dl_ShadowBoss_SPRITES[|behavior]);
    behavior_at_udp = behavior;
    
    if ((g.boss_stun_timer>>1)&$1) palidx = global.PI_MOB_BLU; // stun flash
    else                           palidx = palidx_def;
    
    GO_update_cam_vars(); // MOD
    
    // EC7F
    PC_update_SwordHB_xy();
}




