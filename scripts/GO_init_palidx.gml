/// GO_init_palidx(palette index, *palette permut num)


palidx_def = argument[0];

// permutation (0-5)
if (argument_count>1) palidx_permut = argument[1];
//else                  palidx_permut = 0;

switch(palidx_permut){
case 1:{palidx_def=add_pi_permut(palidx_def,"WBRGYMKC",object_get_name(id)+" permut "+"WBRGYMKC"); break;}
case 2:{palidx_def=add_pi_permut(palidx_def,"RWBGYMKC",object_get_name(id)+" permut "+"RWBGYMKC"); break;}
case 3:{palidx_def=add_pi_permut(palidx_def,"RBWGYMKC",object_get_name(id)+" permut "+"RBWGYMKC"); break;}
case 4:{palidx_def=add_pi_permut(palidx_def,"BWRGYMKC",object_get_name(id)+" permut "+"BWRGYMKC"); break;}
case 5:{palidx_def=add_pi_permut(palidx_def,"BRWGYMKC",object_get_name(id)+" permut "+"BRWGYMKC"); break;}
}

palidx_base = palidx_def;
palidx      = palidx_base;




