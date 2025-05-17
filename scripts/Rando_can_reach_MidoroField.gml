/// Rando_can_reach_MidoroField()


if (Rando_can_traverse_RauruPass()          // The boulder/RiverDevil next to Rauru
||  Rando_can_traverse_RauruToMidoroCave()  // The cave next to Rauru to Midoro Field that's only in rando
||  Rando_can_traverse_JUMPCave() )
{
    return true;
}


// Raftway to Whale Isl to Mido
if ( Rando_is_attainable(STR_FIRE)  // Through Fire-Vines Cave
||  (Rando_is_attainable(STR_RAFT) && Rando_can_traverse_NIslMtnPass()) )
{
    // Mido boulder
    if (Rando_is_attainable(STR_HAMMER))
    {
        return true;
    }
    
    // Mido fast travel to Saria
    if (Rando_can_traverse_Mido_town()       // in case Mido is Old Kasuto and don't have CROSS
    &&  Rando_can_fast_travel_MidoToSaria() 
    &&  Rando_can_traverse_Saria_town() )    // in case Saria is Old Kasuto and don't have CROSS
    {
        return true;
    }
    
    // Backway through Death Mtn
    if (Rando_can_get_from_RoyalCemeteryToZ1Area() 
    &&  Rando_can_traverse_DeathMtn() 
    &&  Rando_can_cross_SariaBridge() 
    &&  Rando_can_traverse_Saria_town() ) // in case Saria is Old Kasuto and don't have CROSS
    {
        return true;
    }
}


return false;




