/// LevelUpMenu_Game_End()


//ar_TSRC_DATA            = 0;
//statXPNext              = 0;


if (surface_exists(srf_FRAME)) surface_free(srf_FRAME);




/*
var _exists = false;


    _exists=variable_instance_exists(id,"dl_");
if (_exists) _exists = !is_undefined(    dl_);
if (_exists) _exists = ds_exists(        dl_,ds_type_list);
if (_exists)           ds_list_destroy(  dl_);
if (_exists)                             dl_=undefined;

    _exists=variable_instance_exists(id,"dm_");
if (_exists) _exists = !is_undefined(    dm_);
if (_exists) _exists = ds_exists(        dm_,ds_type_map);
if (_exists)           ds_map_destroy(   dm_);
if (_exists)                             dm_=undefined;

    _exists=variable_instance_exists(id,"dg_");
if (_exists) _exists = !is_undefined(    dg_);
if (_exists) _exists = ds_exists(        dg_,ds_type_grid);
if (_exists)           ds_grid_destroy(  dg_);
if (_exists)                             dg_=undefined;

    _exists=variable_instance_exists(id,"ds_");
if (_exists) _exists = !is_undefined(    ds_);
if (_exists) _exists = ds_exists(        ds_,ds_type_stack);
if (_exists)           ds_stack_destroy( ds_);
if (_exists)                             ds_=undefined;
*/






var _exists = false;




    _exists=variable_instance_exists(id,"dl_xp_next_stat");
if (_exists) _exists = !is_undefined(    dl_xp_next_stat);
if (_exists) _exists = ds_exists(        dl_xp_next_stat,ds_type_list);
if (_exists)           ds_list_destroy(  dl_xp_next_stat);
if (_exists)                             dl_xp_next_stat=undefined;

    _exists=variable_instance_exists(id,"dl_tsrc_data");
if (_exists) _exists = !is_undefined(    dl_tsrc_data);
if (_exists) _exists = ds_exists(        dl_tsrc_data,ds_type_list);
if (_exists)           ds_list_destroy(  dl_tsrc_data);
if (_exists)                             dl_tsrc_data=undefined;




             _exists = variable_instance_exists(id,  "dg_DATA");
if (_exists) _exists =               !is_undefined(   dg_DATA);
if (_exists) _exists =                ds_exists(      dg_DATA, ds_type_grid);
if (_exists)                          ds_grid_destroy(dg_DATA);
if (_exists)                                          dg_DATA = undefined;




