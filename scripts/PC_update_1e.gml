/// PC_update_1e()


g.last_pc_x = x; // For Death flash screen
g.last_pc_y = y; // For Death flash screen
g.last_dist_from_view_x = g.last_pc_x-view_xview[0]; // For Death flash screen
g.last_dist_from_view_y = g.last_pc_y-view_yview[0]; // For Death flash screen
g.last_pc_xscale = xScale; // For rm_Death


if(!Input.Attack_held 
&&  StabFrenzy_charge_counter < $80 )
{
    StabFrenzy_charge_counter = 0;
}




