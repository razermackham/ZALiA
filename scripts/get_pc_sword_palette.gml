/// get_pc_sword_palette(for lvl 1 armor only)

/*
if(!argument[0] 
&&  g.pc.use_disguise )
{
    var _pal = p.pal_rm_def;
    if(!is_undefined( p.pal_rm_curr) 
    &&  string_length(p.pal_rm_curr) )
    {
        _pal = p.pal_rm_curr;
    }
    
    var _pos = p.PAL_POS_PC_2;
    //var _pos = p.PAL_POS_PC_3;
}
else
{
    var _pal = get_pc_skin_palette(val(g.pc.dm_skins[?STR_Current+STR_Idx]));
    var _pos = 1;
    if(!argument[0])
    {
        if (f.items&ITM_RING)         _pos += global.PAL_CHAR_PER_PAL;
        if (g.spells_active&SPL_PRTC) _pos += global.PAL_CHAR_PER_PAL;
    }
}


var _return = string_copy(_pal, _pos, global.PAL_CHAR_PER_PAL);

if (global.PAL_SYS_VER<4 
&&  f.items&ITM_SWRD )
{
    _pal = p.CI_WHT1_;
    _pos = global.PAL_CHAR_PER_COLOR+1;
    _return = strReplaceAt(_return, _pos, string_length(_pal), _pal);
}


return _return;



*/
