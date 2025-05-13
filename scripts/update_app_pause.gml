/// update_app_pause()


with(Input)
{
    g.app_adv_frame = g.app_paused && GP_Other4_pressed; // if app paused && Bumper RGT pressed
    //
    if (GP_Other4_released    // bump R  released
    || !GP_Other4_held )      // bump R  NOT held
    {        g.adv_frame_held_counter = 0;  }
    
    if (GP_Other4_held)       // bump R held
    {
        if ( g.adv_frame_held_counter<$18)
        {    g.adv_frame_held_counter++; }
        else g.app_adv_frame = true;
        
        if ( g.app_paused) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    }
    
    
    if (g.app_paused 
    && !GP_Other4_held )       // bump R NOT held
    {
        if (GP_Other3_pressed  // bump L pressed
        ||  keyboard_check_pressed(vk_escape) )
        {
            g.app_paused = false;
        }
    }
    
    if(!g.app_paused 
    &&  GP_Other5_held      // trig L held
    &&  GP_Other6_held      // trig R held
    &&  GP_Other4_held      // bump R held
    &&  GP_Other3_pressed ) // bump L pressed
    {
        g.app_paused = true;
    }
}




