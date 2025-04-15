/// triforce_pal_update()


var _POS  = val(p.dm_pal_data[?hex_str(p.triforce_pi)+STR_Palette+STR_Position]);
    _POS += p.PI_LIT1;
var _PAL  = p.dl_triforce_pal_seq[|(g.counter1>>2)&$3];
change_pal(strReplaceAt(p.pal_rm_new, _POS, string_length(_PAL), _PAL));




