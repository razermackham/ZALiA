/// despawn_all_goc()


for(var _i=ds_list_size(g.go_mgr.dl_goc1)-1; _i>=0; _i--)
{
    if(!ds_list_has_element(g.go_mgr.dl_goc1, _i))
    //if(!instance_exists(g.go_mgr.dl_goc1[|_i]))
    {
        continue;
    }
    
    with(g.go_mgr.dl_goc1[|_i])
    {
        state = 0;
        if (g.mod_destroy_go_on_death && !state) GO_destroy_1a();
    }
}

// for(var i=MAX_GOC1-1; i>=0; i--) g.go_mgr.dl_goc1[| i].state = 0;
// for(var i = MAX_GOC-1; i >= 0; i--) g.go_mgr.ar_goc[i].state = 0;




