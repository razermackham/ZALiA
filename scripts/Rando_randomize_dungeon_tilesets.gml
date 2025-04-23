/// Rando_randomize_dungeon_tilesets()


var _i,_j,_k, _idx, _num, _val, _count,_count1,_count2,_count3;
var _datakey;


global.RandoDungeonTilesets_enabled = DungeonTileset_WILL_RANDOMIZE;
save_game_pref();


random_set_seed(Rando_SEED);


ds_list_clear(dl_list1);
ds_list_add(  dl_list1,ts_DungeonA01);
ds_list_add(  dl_list1,ts_DungeonB01);
ds_list_add(  dl_list1,ts_DungeonC01);
ds_list_add(  dl_list1,ts_DungeonD01);
ds_list_add(  dl_list1,ts_DungeonE01);
ds_list_add(  dl_list1,ts_DungeonF01);
ds_list_add(  dl_list1,ts_DungeonG01);

ds_list_clear(dl_list2);
ds_list_copy( dl_list2,dl_list1);

ds_list_add(  dl_list2,ts_DungeonAlt01);
ds_list_add(  dl_list2,ts_DungeonAlt02);
ds_list_add(  dl_list2,ts_DungeonAlt03);
ds_list_add(  dl_list2,ts_DungeonAlt04);
ds_list_add(  dl_list2,ts_DungeonAlt05);
ds_list_add(  dl_list2,ts_DungeonAlt06);

ds_list_add(  dl_list2,ts_Cave01);

ds_list_clear(dl_list3);


_datakey = "_User"+STR_Custom+STR_Dungeon+STR_Tileset;
_count = val(g.dm_tileset[?_datakey+STR_Count]);
if (_count)
{
    var _background;
    for(_i=1; _i<=_count; _i++)
    {
        _background = g.dm_tileset[?_datakey+hex_str(_i)+STR_Asset];
        if(!is_undefined(        _background) 
        &&  background_exists(   _background) )
        {
            ds_list_add(dl_list3,_background);
        }
    }
    
    if (ds_list_size(dl_list3))
    {
        if (1) // testing. So that '"_User"+STR_Custom+STR_Dungeon+STR_Tileset' are guaranteed to be used.
        {
            ds_list_shuffle(dl_list2);
            _count1 = ds_list_size(dl_list1)-ds_list_size(dl_list3);
            for(_i=0; _i<_count1; _i++) ds_list_add(dl_list3,dl_list2[|_i]);
            ds_list_copy(dl_list2,dl_list3);
        }
        else
        {
            for(_i=ds_list_size(dl_list3)-1; _i>=0; _i--) ds_list_add(dl_list2,dl_list3[|_i]);
        }
    }
}


ds_list_shuffle(dl_list2);

//_count1 = ds_list_size(dl_list1);
for(_i=ds_list_size(dl_list1)-1; _i>=0; _i--)
{
    _datakey = STR_Rando+STR_Tileset+background_get_name(dl_list1[|_i]);
    dm_save_data[?_datakey] = dl_list2[|_i];
}




