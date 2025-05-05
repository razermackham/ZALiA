/// Overworld_udp()


var _val;


if (false)
{
    // adjusts an unintended 1 pixel offset while pc is moving
    draw_move_offset_x = -sign(move_x);
    draw_move_offset_y = -sign(move_y);
}
else
{
    draw_move_offset_x = 0;
    draw_move_offset_y = 0;
}


Pause_xl = viewXC() - (Pause_TEXT_W>>1);
Pause_yt = viewYC() - 4;


PC_draw_x_base = ow_pc_xy(0); // pc view x
PC_draw_y_base = ow_pc_xy(1); // pc view y


MEAT_draw_x  = PC_draw_x_base + (MEAT_ow_x-pc_ow_x);
MEAT_draw_x += draw_move_offset_x;

MEAT_draw_y  = PC_draw_y_base + (MEAT_ow_y-pc_ow_y);
MEAT_draw_y += draw_move_offset_y;




if (g.counter1&$10) TreasureMaps_Kakusu_sprite = spr_Slime_Small_1a_1;
else                TreasureMaps_Kakusu_sprite = spr_Slime_Small_1b_1;

               _val = $28; // timing for beating heart anim
if (g.counter0&_val==_val) TreasureMaps_Heart_sprite = spr_Heart_1a;
else                       TreasureMaps_Heart_sprite = spr_Heart_1b;

TreasureMaps_Magic_sprite0 = spr_Bottle_6a; // empty bottle
switch(get_bottle_bubbling_frame()){
case 0:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1a; break;}
case 1:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1b; break;}
case 2:{TreasureMaps_Magic_sprite1=spr_Bottle_6a_Liquid_1c; break;}
}

if (g.counter1&$10) TreasureMaps_1up_sprite = spr_Item_LifeDoll_1a;
else                TreasureMaps_1up_sprite = spr_Item_LifeDoll_1b;

TreasureMaps_Key_sprite = val(g.dm_ITEM[?STR_KEY+STR_Sprite], spr_0);




