/// Rando_randomize_scenes()


var _i,_j,_k, _idx, _num, _val,_val1,_val2,_val3,_val4, _count,_count1,_count2,_count3;
var _dk,_dk1,_dk2,_dk3;
var _scene_name,_scene_name1,_scene_name2;


global.SceneRando_enabled = Scenes_WILL_RANDOMIZE;
save_game_pref();


random_set_seed(Rando_SEED);


_dk1 = dk_SceneRando+STR_Scene+STR_Type;
_count1 = val(global.dm_scene_rando[?_dk1+STR_Count]);
for(_i=1; _i<=_count1; _i++) // number of scene types
{
    _val1 = global.dm_scene_rando[?_dk1+hex_str(_i)];
    if(!is_undefined(_val1))
    {
        ds_list_clear(dl_list1);
        _count2 = val(global.dm_scene_rando[?_val1+STR_Count]);
        for(_j=1; _j<=_count2; _j++) // number of matching scenes for this type
        {
            _scene_name = global.dm_scene_rando[?_val1+"-"+hex_str(_j)+STR_Scene];
            if(!is_undefined(_scene_name)) ds_list_add(dl_list1,_scene_name);
        }
        
        
        _count3 = ds_list_size(dl_list1);
        if (_count3>1)
        {
            ds_list_copy(dl_list2,dl_list1);
            ds_list_shuffle(dl_list2);
            for(_j=0; _j<_count3; _j++)
            {
                _scene_name1 = dl_list1[|_j];
                _scene_name2 = dl_list2[|_j];
                dm_save_data[?dk_SceneRando+STR_Scene+STR_Randomized+_scene_name1] = _scene_name2;
                //if (string_pos(STR_Pit+"8",_val1)) sdm(""); sdm(_scene_name1+" - "+_scene_name2);
            }
        }
    }
}




