/// PC_update_horizontal()


// 93CD
var _C0 = g.mod_StabFrenzy 
       && StabFrenzy_charge_counter>$80 
       && Input.Attack_held;
//
if (ogr               // NOT on ground
|| !attack_phase      // NOT attacking
||  g.control1_timer  // stab does NOT inhibit hspd
||  _C0 )             // is frenzy stabbing
{
    var _C1 = is_cucco 
           && abs8b(hspd)<=hspd_max  // cucco slow walk while crouching
           && Input.dHeld;           // down is held
    // 93DC
    if(!(g.pc_lock&PC_LOCK_HSPD)   // horizontal control NOT locked
    &&   Input.hHeld               // left or right held
    && (!Input.dHeld || _C1)       // down NOT held || cucco crawl
    && (!_C0 || attack_phase==2) ) // NOT frenzy stabbing OR in stab phase of attack
    {   // 93FD. left or right held AND down is NOT held
        var      _HSPD_MAX =  hspd_max;
        if (_C0) _HSPD_MAX = _HSPD_MAX>>1;
        
        var _HELD_DIR  =  bit_dir(Input.hHeld); // 1,-1
        if (_HELD_DIR !=  hspd_dir)
        {   _HELD_DIR += _HELD_DIR;  } // 2,-2
        
        hspd  = byte_to_int(hspd);
        hspd += _HELD_DIR;
        hspd  = clamp(hspd, -_HSPD_MAX,_HSPD_MAX);
        hspd &= $FF;
        hspd_impel = sign(_HELD_DIR);
    }
    else
    {   // 93E6. left and right NOT held || down held
        if(!ogr    // is on ground
        &&  hspd )
        {
            hspd -= hspd_dir;
            hspd &= $FF;
        }
    }
    
    
    
    // 943A: JSR 9610
    if!(cs&$3) PC_update_1b(); // updateX()
    
    PC_update_walk();
    
    
    
    // 9420
    if (Input.dHeld  // down held
    && !ogr          // is on ground
    &&  cs&$4 )      // bottom colliding with solid
    {
        PC_set_behavior(behavior_CROUCH);
    }
}




