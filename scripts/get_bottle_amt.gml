/// get_bottle_amt(stat type str)


if (argument0==STR_Heart) return get_stat_max(STR_Heart) * ((f.bottle1_state == BOTTLE_STATE_HP) + (f.bottle2_state==BOTTLE_STATE_HP));
if (argument0==STR_Magic) return get_stat_max(STR_Magic) * ((f.bottle1_state == BOTTLE_STATE_MP) + (f.bottle2_state==BOTTLE_STATE_MP));

return 0;




