/// Spawner_NPC_init2()


// 96B2
LIMIT = 8;


if (g.town_num 
&&  g.town_name==STR_Bulblin 
&& !g.pc.Disguise_enabled )
//&& !(f.items&ITM_MASK) )
{
    state = 0;
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}




