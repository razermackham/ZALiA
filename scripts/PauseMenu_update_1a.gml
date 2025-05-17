/// PauseMenu_update_1a()

// Opening PauseMenu.  g.menuState == 4


if (state&$3 == state_SPELL  // Going to spell menu
&&  f.spells )
{
    // g.spell_selected default is 1
    if!(f.spells & g.spell_selected) // if
    {
        // A2FE: JSR A5E3, A61F
        for(var _i=0; _i<g.SPELL_COUNT; _i++)
        {
                g.spell_selected = $1<<_i;
            if (g.spell_selected & f.spells) break;
        }
    }
    
    if ( f.spells      & g.spell_selected)
    {    g.spell_ready = g.spell_selected;  }
    else g.spell_ready = 0;
}







// Menu building phase.  g.menuState == 4


// A304
if (state&$3==state_MAP 
&&  g.dungeon_num )
{
    var _low, _high;
    
    dungeon_clms_visited = (dungeon_vis_rgt-dungeon_vis_lft) + 1;
    dungeon_rows_visited = (dungeon_vis_btm-dungeon_vis_top) + 1;
    
    // ------------------------------------------------------------------
    map_clm_off  = CLMS_MAP_PAPER>>1;   // Center clm of paper
    map_clm_off -= dungeon_clms>>1;     // Dungeon centered on paper
    
    if (dungeon_clms > CLMS_MAP_DNGN) // if dungeon is wider than the paper
    {
        var _PC_CLM_OFF = (dungeon_clms>>1) - ((dngn_map_pc_rc>>0)&$FF);
        map_clm_off += _PC_CLM_OFF;         // PC centered on paper
        
        _low  = CLMS_MAP_DNGN - (dungeon_clms+DUNGEON_MAP_PAD1);
        _high = DUNGEON_MAP_PAD1;
        map_clm_off  = clamp(map_clm_off, _low, _high);
        
        if (dungeon_clms_visited <= CLMS_MAP_DNGN)
        //if (dungeon_clms_visited < CLMS_MAP_DNGN)
        {
            _low  = -dungeon_vis_lft + DUNGEON_MAP_PAD1;
            _high = CLMS_MAP_DNGN - (dungeon_vis_rgt+DUNGEON_MAP_PAD1+1);
            map_clm_off  = clamp(map_clm_off, _low, _high);
        }
    }
    
    
    // ------------------------------------------------------------------
    map_row_off  = ROWS_MAP_PAPER>>1;   // Center clm of paper
    map_row_off -= dungeon_rows>>1;     // Dungeon centered on paper
    
    if (dungeon_rows > ROWS_MAP_DNGN) // if dungeon is wider than the paper
    {
        var _PC_ROW_OFF = (dungeon_rows>>1) - ((dngn_map_pc_rc>>8)&$FF);
        map_row_off += _PC_ROW_OFF;         // PC centered on paper
        
        _low  = ROWS_MAP_DNGN - (dungeon_rows+DUNGEON_MAP_PAD1);
        _high = DUNGEON_MAP_PAD1;
        map_row_off  = clamp(map_row_off, _low, _high);
        
        if (dungeon_rows_visited <= ROWS_MAP_DNGN)
        //if (dungeon_rows_visited < ROWS_MAP_DNGN)
        {
            _low  = -dungeon_vis_top + DUNGEON_MAP_PAD1;
            _high = ROWS_MAP_DNGN - (dungeon_vis_btm+DUNGEON_MAP_PAD1+1);
            map_row_off  = clamp(map_row_off, _low, _high);
        }
    }
    
    //sdm("CLMS_MAP_DNGN $"+hex_str(CLMS_MAP_DNGN)+", dungeon_clms $"+hex_str(dungeon_clms)+", dungeon_clms_visited $"+hex_str(dungeon_clms_visited)+", dungeon_vis_rgt $"+hex_str(dungeon_vis_rgt)+", dungeon_vis_lft $"+hex_str(dungeon_vis_lft));
    //sdm("ROWS_MAP_DNGN $"+hex_str(ROWS_MAP_DNGN)+", dungeon_rows $"+hex_str(dungeon_rows)+", dungeon_rows_visited $"+hex_str(dungeon_rows_visited)+", dungeon_vis_btm $"+hex_str(dungeon_vis_btm)+", dungeon_vis_top $"+hex_str(dungeon_vis_top));
    //sdm("map_clm_off "+string(map_clm_off)+", map_row_off "+string(map_row_off));
    //sdm("");
}







/*
if (g.dungeon_num 
&&  state&3 == ST_MAP 
&&  g.menuBuiltCount == _COUNT ) {
    var _str  = "";
    _str += "  dungeon_clms $"      + hex_str(dungeon_clms);
    _str += ", map_clm_off $"       + hex_str(map_clm_off);
    _str += ", dungeon_vis_rgt $"   + hex_str(dungeon_vis_rgt);
    _str += ", dungeon_vis_lft $"   + hex_str(dungeon_vis_lft);
    sdm(_str);
    
    _str  = "";
    _str += ", dungeon_rows $"      + hex_str(dungeon_rows);
    _str += ", map_row_off $"       + hex_str(map_row_off);
    _str += ", dungeon_vis_btm $"   + hex_str(dungeon_vis_btm);
    _str += ", dungeon_vis_top $"   + hex_str(dungeon_vis_top);
    sdm(_str);
}
*/





