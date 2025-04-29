/// GraphicsEffectsEditor_update_backout(cursor is Back, *new menu_state)


if (pressed_backout 
||  (argument[0] && pressed_confirm1) )
{
    GraphicsEffectsEditor_reset_cursors(-1);
    
    aud_play_sound(SOUND_BACK, -1,-1, SOUND_VOLUME);
    timer = DURATION1;
    if (menu_state==menu_focus_Main) state = state_CLOSED;
    if (argument_count>1) menu_state = argument[1];
    else                  menu_state = menu_focus_Main;
    
    return true;
}

return false;




