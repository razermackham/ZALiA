/// Blooby_udp()


can_draw_self = true;

var                     _spr = 0;
if (ReactionAnim_timer&ReactionAnim_TIMING)
{                       _spr = Blooby_SPR_B1;  } // puffed up
else if (g.counter1&$8) _spr = Blooby_SPR_A1; // 
else                    _spr = Blooby_SPR_A2; // 
GO_set_sprite(id, _spr)




