/// Rando_can_reach_Saria2()

// Saria2: Saria South Exit

if (Rando_can_traverse_RauruPass()  // Rauru boulder/RiverDevil
||  Rando_can_traverse_RauruToMidoroCave() 
||  Rando_can_traverse_JUMPCave() )
{
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    if (Rando_is_attainable(STR_HAMMER) 
    &&  Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) ) // Whale Isl warp to Mido
{
    // Mido boulder
    if (Rando_is_attainable(STR_HAMMER) 
    &&  Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Mido fast travel to Saria
    if (Rando_can_traverse_Mido_town()   // in case Mido is Old Kasuto and don't have CROSS
    &&  Rando_can_fast_travel_MidoToSaria() 
    &&  Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


return false;

/*
if (Rando_can_reach_MidoroField())
{
    if (Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
}


if (Rando_is_qual_location(STR_Mido))
{
    // Mido fast travel to Saria
    if (Rando_can_traverse_Mido_town()   // in case Mido is Old Kasuto and don't have CROSS
    &&  Rando_can_fast_travel_MidoToSaria() 
    &&  Rando_can_traverse_Saria_town()  // in case Saria is Old Kasuto and don't have CROSS
    &&  Rando_can_cross_SariaBridge() )
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() )
    {
        return true;
    }
}


return false;
*/





/*
if (Rando_is_qual_location(STR_Saria) 
&&  Rando_can_cross_SariaBridge() )
{
    return true;
}
// Backway through Death Mtn
if (Rando_can_get_to_RoyalCemetery() 
&&  Rando_can_traverse_DeathMtn() )
{
    return true;
}


return false;
*/




