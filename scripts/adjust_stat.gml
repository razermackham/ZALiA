/// adjust_stat(hp difference, mp difference)


if (argument0!=0) f.hp = clamp(f.hp+argument0, 0,get_stat_max(STR_Heart));
if (argument1!=0) f.mp = clamp(f.mp+argument1, 0,get_stat_max(STR_Magic));




