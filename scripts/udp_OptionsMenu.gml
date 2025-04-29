/// udp_OptionsMenu()


switch(menu_state){
default:                       {draw_clms_count=Main_CLMS;        break;}
case   menu_state_INPUT_CONFIG:{draw_clms_count=InputConfig_CLMS; break;}
}

switch(menu_state){
default:                       {draw_rows_max=Main_ROWS;        break;}
case   menu_state_INPUT_CONFIG:{draw_rows_max=InputConfig_ROWS; break;}
}

if (anim_frame==ANIM_FRAMES_DEF) draw_rows_count = draw_rows_max;
else                             draw_rows_count = anim_frame<<1;


drawX = ((g.view_xl_og+$28)>>4)<<4;
drawX = clamp(drawX, ((viewXL()>>3)<<3)+($4<<3), (((viewXR()>>3)<<3)-($4<<3)) - (draw_clms_count<<3));

drawY = viewYT() + viewYT_OFF;




MenuWindow_w  = draw_clms_count<<3;
MenuWindow_h  = draw_rows_count<<3;
MenuWindow_yb = drawY + MenuWindow_h;


Cursor_xl  = drawX;
Cursor_xl += $8; // window border
Cursor_xl += $4; // pad
Cursor_xl -= $2; // micro adjustment


TextArea1_xl  = Cursor_xl;
TextArea1_xl += $8; // bottle sprite width
TextArea1_xl += $2; // pad

//TextArea1_xr  = TextArea1_xl;
//TextArea1_xr += 0;

TextArea2_xr  = drawX + MenuWindow_w;
TextArea2_xr -= $8; // window border
TextArea2_xr -= $4; // pad

//TextArea2_xl  = TextArea2_xr;
//TextArea2_xl -= Font2_CHAR_SIZE * 4; // dist of 4 chars




