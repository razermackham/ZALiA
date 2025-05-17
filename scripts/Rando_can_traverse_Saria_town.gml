/// Rando_can_traverse_Saria_town()

// in case Saria is Old Kasuto and don't have CROSS


if (val(dm_save_data[?STR_Town+STR_Rando+STR_Saria+"A"], STR_Saria)!=STR_Old_Kasuto 
||  Rando_is_attainable(STR_CROSS) )
{
    return true;
}


return false;




