/// ContinueSaveScreen_Room_End()


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




    _exists=variable_instance_exists(id,"Caution_dl_text");
if (_exists) _exists = !is_undefined(    Caution_dl_text);
if (_exists) _exists = ds_exists(        Caution_dl_text,ds_type_list);
if (_exists)           ds_list_destroy(  Caution_dl_text);
if (_exists)                             Caution_dl_text=undefined;




    _exists=variable_instance_exists(id,"Options_dg");
if (_exists) _exists = !is_undefined(    Options_dg);
if (_exists) _exists = ds_exists(        Options_dg,ds_type_grid);
if (_exists)           ds_grid_destroy(  Options_dg);
if (_exists)                             Options_dg=undefined;




