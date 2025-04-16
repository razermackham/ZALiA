/// draw_falling_scene()


with(p)
{
    var _x,_y;
    
    //fall_scene_pal_set=g.area_name==Area_MazIs; // testing
    //fs_pal_state += g.tmr_change_room&$1; // OG
    if(!fall_scene_counter)
    {
        var _DIR = sign_(fall_scene_type & (g.FallScene_BIT_RIGHT|g.FallScene_BIT_DOWN)); // 1 or -1
        fall_scene_pal_state = ((fall_scene_pal_state+FallScene_CLM_COUNT)+_DIR) mod FallScene_CLM_COUNT;
    }
    
    // I added fall_scene_counter to control timing of stripe color change to every 3 frames.
    // OG is every 2 frames but looks too fast and every 4 frames looks too slow.
    fall_scene_counter = (fall_scene_counter+1) mod 3;
    
    // Draw stripes -----------------------------------------------
    _x = viewXC() - (sprite_get_width( fall_scene_spr)>>1);
    _y = viewYC() - (sprite_get_height(fall_scene_spr)>>1);
    draw_sprite_(fall_scene_spr,0, _x,_y, dg_FallScene_PI[#fall_scene_pal_set,fall_scene_pal_state]);
    
    
    
    // Draw PC and PC-Shadow ----------------------------------------------
    if ((fall_scene_type&g.FallScene_BIT_RIGHT && fall_scene_x>viewXL()+FallScene_X_BASE) 
    ||  (fall_scene_type&g.FallScene_BIT_LEFT  && fall_scene_x<viewXR()-FallScene_X_BASE) 
    ||  (fall_scene_type&g.FallScene_BIT_DOWN  && fall_scene_y>viewYT()+FallScene_Y_BASE) 
    ||  (fall_scene_type&g.FallScene_BIT_UP    && fall_scene_y<viewYB()-FallScene_Y_BASE) )
    {
        var _x_scale = g.pc.xScale;
        
        if (fall_scene_type & (g.FallScene_BIT_RIGHT|g.FallScene_BIT_LEFT))
        {
            _x = fall_scene_x;
            _y = viewYC();
            _x_scale = -sign_(fall_scene_fall_spd);
        }
        else if (fall_scene_type & (g.FallScene_BIT_DOWN|g.FallScene_BIT_UP))
        {
            _x = viewXC();
            _y = fall_scene_y;
            if (g.room_type=="A")
            {    _x_scale = g.pc.xScale;  }
            else _x_scale = 1;
        }
        
        var _pi = global.PI_PC1;
        if (pc_is_cucco())
        {
            _y += $08;
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x+4,_y-5, -1, _x_scale,1, C_BLK1); // shadow
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x+4,_y-5, -1, _x_scale,1, C_BLK1); // shadow
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x+4,_y-5, -1, _x_scale,1, C_BLK1); // shadow
            
            switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
            default:{_pi=global.PI_CUCCO1; break;}
            case  1:{_pi=global.PI_CUCCO2; break;}
            case  2:{_pi=global.PI_CUCCO3; break;}
            }
            pal_swap_set(palette_image, _pi);
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_BODY,0, _x,  _y,   -1, _x_scale); // 
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_LEGS,0, _x,  _y,   -1, _x_scale); // 
            draw_sprite_(g.pc.CuccoFallScene_SPRITE_WING,0, _x,  _y,   -1, _x_scale); // 
            pal_swap_reset();
            
            _x += ((2*_x_scale) - !_x_scale);
            _y -= 5;
            draw_sprite_(spr_1x1_WHT,0, _x,_y, -1, 1,1, g.pc.Cucco_eye_color);
            // For whatever reason, draw_point_colour() isn't drawing here or doesn't scale the point with the app's scale
            //draw_point_colour(_x,_y, g.pc.Cucco_eye_color);
        }
        else
        {
            switch(sign(g.spells_active&SPL_PRTC)+sign(f.items&ITM_RING)){
            default:{_pi=global.PI_PC1; break;}
            case  1:{_pi=global.PI_PC2; break;}
            case  2:{_pi=global.PI_PC3; break;}
            }
            draw_pc_skin(_x+8,_y-9, _x_scale,1, g.pc.behavior_DAMAGE, -1, -1,-1,  -1, C_BLK1);
            draw_pc_skin(_x,  _y,   _x_scale,1, g.pc.behavior_DAMAGE, -1, -1,-1, _pi);
        }
    }
    
    if (fall_scene_type & (g.FallScene_BIT_RIGHT|g.FallScene_BIT_LEFT)) fall_scene_x += fall_scene_fall_spd;
    if (fall_scene_type & (g.FallScene_BIT_DOWN |g.FallScene_BIT_UP))   fall_scene_y += fall_scene_fall_spd;
}




