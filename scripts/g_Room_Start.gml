/// g_Room_Start()


if (DEV){sdm("")sdm(""); sdm(" g_Room_Start()    "+room_get_name(room));}

//g.game_end_state = 1; // Testing wake Zelda cutscene

// -------------------------------------------------------------------
// -------------------------------------------------------------------
// -------------------------------------------------------------------
var _i,_j,_k, _idx, _a, _qual;
var _num, _val,_val1,_val2, _count, _len;
var _dir, _dir1,_dir2;
var _x,_xl,_xl1,_xl2, _y,_yt,_yt1,_yt2, _w,_w_, _h,_h_;
var _clm,_clm1,_clm2, _row,_row1,_row2, _clms1,_clms2, _rows1,_rows2, _rc,_rc1,_rc2, _owrc;
var _depth, _tile_id, _layer_name;
var _data;
var _dk, _datakey,_datakey1,_datakey2;
var _obj,_ver, _obj_name, _spr,_pi, _inst;
var _rm,_rm_name, _scene_name, _scene_name1,_scene_name2;
var _exit, _exit_num, _exit_name, _exit_name1,_exit_name2, _exit_sides;
var _spawn_datakey,_spawn_datakey1,_spawn_datakey2;
var _dl1 = ds_list_create();
var _dl2 = ds_list_create();



for(_i=ds_grid_width(dg_YxY_)-1; _i>=0; _i--)
{
    dg_YxY_[#_i,$0]=choose(spr_Font1,spr_Font1,spr_Font_Hyrulian,spr_Font_Hyrulian,spr_Font2,spr_Font2_1,spr_Font3,spr_Font3_1);
    dg_YxY_[#_i,$1]=sign_(irandom($1F)); // xscale
    dg_YxY_[#_i,$2]=sign_(irandom($1F)); // yscale
}



room_speed = ROOM_SPEED_BASE;
global.Room_frame_count = 0;



_val = room_get_name(room);
room_type = string_char_at(_val, string_pos("_",_val)-1);

var _ROOM_A  = room_is_type("A");
var _ROOM_B  = room_is_type("B");
var _ROOM_C  = room_is_type("C");
var _ROOM_B1 = room==rmB_Title;


var _rm_name_PREV     = rm_name;
var _dungeon_num_PREV = get_dungeon_num(_rm_name_PREV);
var _town_num_PREV    = get_town_num(   _rm_name_PREV);
var _area_name_PREV   = area_name;
var _room_PREV        = 0;



switch(room)
{
    case rmB_Title:       {coming_from=coming_from_FILE; break;} // 1: FileSelect
    case rmB_FileSelect:  {coming_from=coming_from_FILE; break;} // 1: FileSelect
    case rmB_ContinueSave:{coming_from=coming_from_CONT; break;} // 2: ContinueSave
    case rmB_Death:       {coming_from=coming_from_DEAD; break;} // 3: Death
    default:
    {       _num       = val(dm_room_history[?STR_Counter]);
        if (_num)
        {   _room_PREV = val(dm_room_history[?hex_str(_num)+STR_Room_idx]);
            var    _ROOM_TYPE = string_char_at(room_get_name(_room_PREV),3);
            switch(_ROOM_TYPE){
            case "A":{coming_from=coming_from_RM_A; break;} // 4: rmA
            case "C":{coming_from=coming_from_RM_C; break;} // 5: Overworld
            }//switch(_ROOM_TYPE)
        }
    break;}//default
}//switch(room)






// TODO: Check if f.reen needs to be set here. It is set 1 frame before this in update_change_room_1a().
if (_ROOM_A)
{   // reen: Room-Entry Exit-Name
         if (coming_from==coming_from_FILE) f.reen = f.reen_new_run;
    else if (coming_from==coming_from_CONT) f.reen = get_continue_reen();
}



// -------------------------------------------------------------------------
    dungeon_num  = 0;
    dungeon_name = undefined;
    town_num     = 0;
    town_name    = undefined;
//
if (_ROOM_A)
{
    area_name    =         string_copy(f.reen, 1, AreaID_LEN);
    rm_num       = str_hex(string_copy(f.reen, AreaID_LEN+1, 2));
    rm_name      = area_name+hex_str(rm_num);
    dungeon_num  = get_dungeon_num(rm_name);
    dungeon_name = dm_dungeon[?STR_Dungeon+hex_str(dungeon_num)+STR_Name];
    town_num     = get_town_num(rm_name);
    town_name    = dm_town[?STR_Town+STR_Name+hex_str(town_num)];
}
else if (_ROOM_B1)
{
    rm_name      = RM_NAME_TITLSCR;
    _len         =         string_length(rm_name);
    area_name    =         string_copy(  rm_name,1,_len-2);
    rm_num       = str_hex(string_copy(  rm_name,_len-1,2));
}


var                            _SceneRando_scene = rm_name;
if (global.SceneRando_enabled) _SceneRando_scene = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+rm_name],rm_name);

var _SCENE_IS_RANDOMIZED = global.SceneRando_enabled && _SceneRando_scene!=rm_name;
var _SceneRando_DEBUG1 = 0 && val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+rm_name],rm_name)!=rm_name;


// For boss/scene rando
var _DUNGEON_NUM = dungeon_num;
    _DUNGEON_NUM = val(f.dm_rando[?rm_name+STR_Dungeon+STR_Num], _DUNGEON_NUM);
//
//scene_data_scene_name = rm_name;
//scene_data_scene_name = val(f.dm_rando[?rm_name+STR_Scene+STR_Name], rm_name);


if (_ROOM_A)
{
    if (town_num 
    && !is_undefined(town_name) )
    {
        var _TOWN_NAME = val(f.dm_rando[?rm_name+STR_Overworld+STR_Town+STR_Name], town_name);
        f.dm_quests[?STR_Warp+STR_Qualified]=1;
        f.dm_quests[?STR_Warp+STR_Qualified+_TOWN_NAME]=1;
    }
}




// -------------------------------------------------------------------------
// Update room history ---------------------------------------
// Keep record of the last $100 rooms visited
if (coming_from==coming_from_FILE)
{   ds_map_clear(dm_room_history);  }

             dm_room_history[?STR_Counter] = val(dm_room_history[?STR_Counter]) + 1;
_num=hex_str(dm_room_history[?STR_Counter]);
//
             dm_room_history[?_num+STR_Room_idx] = room;
             dm_room_history[?_num+STR_RmName]   = rm_name;
             dm_room_history[?_num+STR_Area_ID]  = area_name;
             dm_room_history[?_num+STR_reen]     = f.reen;
//
if (_ROOM_A) dm_room_history[?STR_Last+STR_Rm+"A"+STR_Datakey] = _num;

_num =   val(dm_room_history[?STR_Counter]);
var _MAX_SCENES = $100;
if (_MAX_SCENES<_num)
{
    _num -= _MAX_SCENES;
    
    _dk = hex_str(_num)+STR_Room_idx;
    if(!is_undefined( dm_room_history[?_dk]))
    {   ds_map_delete(dm_room_history, _dk);  }
    
    _dk = hex_str(_num)+STR_RmName;
    if(!is_undefined( dm_room_history[?_dk]))
    {   ds_map_delete(dm_room_history, _dk);  }
    
    _dk = hex_str(_num)+STR_Area_ID;
    if(!is_undefined( dm_room_history[?_dk]))
    {   ds_map_delete(dm_room_history, _dk);  }
    
    _dk = hex_str(_num)+STR_reen;
    if(!is_undefined( dm_room_history[?_dk]))
    {   ds_map_delete(dm_room_history, _dk);  }
}



// -------------------------------------------------------------------------
// Update exit_leave history ---------------------------------------
// Keep record of the last $100 exits taken
if (coming_from==coming_from_FILE)
{
    ds_map_clear(dm_exit_leave_history);
}
else
{
    _num = val(dm_exit_leave_history[?STR_Counter]);
    var _MAX_EXITS = $100;
    if (_MAX_EXITS<_num)
    {
        _num -= _MAX_EXITS;
        _dk = hex_str(_num)+STR_Exit+STR_Name;
        if(!is_undefined( dm_exit_leave_history[?_dk]))
        {
            ds_map_delete(dm_exit_leave_history, _dk);
        }
    }
}








// -------------------------------------------------------------------
ds_list_clear(dl_solid_inst);

ds_list_clear(dl_pal_swap_depths);

ds_grid_resize(dg_anim_liquid, 0, ds_grid_height(dg_anim_liquid));
ds_grid_clear( dg_anim_liquid, 0);

ds_grid_resize(dg_anim_clouds, 0, ds_grid_height(dg_anim_clouds));
ds_grid_clear( dg_anim_clouds, 0);

if (BackgroundTileAnimations_VER) ds_list_clear(dl_scene_anims);




view_lock      = 0;
view_lock_rm   = 0;
view_lock_boss = 0;

dialogue_source = noone;

FallScene_timer = FallScene_INACTIVE;

rm_brightness = 0;



if (_ROOM_A 
&& !val(f.dm_quests[?STR_Quest+STR_Started]) )
{
        f.dm_quests[?STR_Quest+STR_Started]=1; // So that the following only happens once per quest
    //
    spell_selected        = 1; // 0749.  Default value is 1
    spell_ready           = 0;
    spell_cast_this_frame = 0; // 
    spells_active         = 0; // 076F. active spells
    
    kill_count1 = 0;
    kill_count2 = 0;
}




if (room==rmB_NextLife 
&&  coming_from==coming_from_FILE )
{
    overworld_paused = false;
    rm_ow_dir = 0; // 0: WE, 1: NS, 2: 
    
    leave_rm_x = 0; // 05D3,Y. pc's ogX when exiting a room
    leave_rm_y = 0; // 
    
    encounter_type = 0; // current room's encounter type
    in_safe_encounter = false;
    
    pc_lock              = 0;
    control1_timer       = 0;
    boss_stun_timer      = 0;
    StatRestore_timer_hp = 0; // 070D
    StatRestore_timer_mp = 0; // 070C
    
    spell_selected        = 1; // 0749.  Default value is 1
    spell_ready           = 0;
    spell_cast_this_frame = 0; // 
    //spell_cast            = 0; // 074A. last spell cast
    spells_active         = 0; // 076F. active spells
    
    cutscene        = 0;
    cutscene_ctr    = 0;
    cutscene_part   = 0;
    cutscene_timer  = 0;
    cutscene_house_built = 0;
    
    kill_count1 = 0; // itemDropLevel1 enemies
    kill_count2 = 0; // itemDropLevel2 enemies
}



pc.Disguise_enabled = false;
if (_ROOM_A 
&& !is_undefined(town_name) )
{
    if (town_name==STR_Bulblin)
    {
        if (f.items&ITM_MASK) pc.Disguise_enabled = true;
    }
    else if (global.Halloween1_enabled)
    {
        if (town_name==STR_Rauru 
        ||  town_name==STR_Ruto 
        ||  town_name==STR_Saria 
        ||  town_name==STR_Mido 
        ||  town_name==STR_Nabooru 
        ||  town_name==STR_Darunia 
        ||  town_name==STR_New_Kasuto )
        {
            pc.Disguise_enabled = true;
        }
    }
}









// -------------------------------------------------------------------------
file_data_quest_num = 1;
if (_ROOM_A 
&&  f.quest_num>1 )
{
    _datakey = _SceneRando_scene+STR_file_name+STR_Quest+"02";
    if(!is_undefined(dm_rm[?_datakey]) 
    || !is_undefined(f.dm_rando[?_datakey]) )
    {
        file_data_quest_num = 2;
    }
}


if (_ROOM_A 
||  _ROOM_B1 ) // Title-Screen
{
    var                      _DATA = rm_get_file_data(_SceneRando_scene, file_data_quest_num); // _SceneRando_scene==rm_name here if this scene isn't rando'd
    if (is_undefined(_DATA)) _DATA = rm_get_file_data(_rm_name_PREV,     file_data_quest_num);
    if (is_undefined(_DATA)) _DATA = rm_get_file_data(RM_NAME_NPALACE,   file_data_quest_num);
    if(!is_undefined(_DATA))  dm_tile_file = json_decode(_DATA);
}


if (FileCleaning01_STATE 
&&  _ROOM_A 
&&  rm_name==FileCleaning01_rm_name )
{
    var _FILE_NAME = FileCleaning01_dm[?STR_Tile+STR_File+hex_str(FileCleaning01_current_data_id)+STR_Name];
    if(!is_undefined(_FILE_NAME))
    {   //  _FILE example:  "rm_tile_data/PalcA/PalcA_003.json"
        var _FILE  = "rm_tile_data";
            _FILE += "/";
            _FILE += string_letters(_FILE_NAME); // get "PalcA" from "PalcA_003"
            _FILE += "/";
            _FILE += _FILE_NAME;
            _FILE += ".json";
        //sdm(_FILE);
        if (file_exists(_FILE))
        {          _FILE  = file_text_open_read(_FILE);
                   _data  = "";
            while (        !file_text_eof(      _FILE)) 
            {      _data += file_text_readln(   _FILE);  }
                            file_text_close(    _FILE);
            dm_tile_file = json_decode(_data);
            sdm("FileCleaning01: "+_FILE_NAME);
        }
    }
}










if (_ROOM_A 
||  _ROOM_B1 ) // Title-Screen
{
    room_width  = val(dm_tile_file[?"width"], PAGE_CLMS) <<3;
    room_height = val(dm_tile_file[?"height"],PAGE_ROWS) <<3;
    
    room_width  = (room_width >>8)<<8;
    room_height = (room_height>>8)<<8;
    
    room_width  = max(PAGE_W,room_width);
    room_height = max(PAGE_H,room_height);
    
    
    rm_w        = room_width;
    rm_w_       = rm_w>>1;
    
    rm_h        = room_height;
    rm_h_       = rm_h>>1;
    
    rm_clms     = rm_w>>3;
    rm_rows     = rm_h>>3;
    
    rm_tile_count = rm_clms*rm_rows;
    
    rm_clm0     = rm_clms-PAGE_CLMS;
    rm_row0     = rm_rows-PAGE_ROWS;
    
    rm_pages_x  = rm_w>>8;  // 
    rm_pages_y  = rm_h>>8;  // 
    
    view_x_page_min = 0;
    view_x_page_max = rm_pages_x-1;
    view_y_page_min = 0;
    view_y_page_max = rm_pages_y-1;
    if (rm_is_bottom_page_locked(_SceneRando_scene)) view_y_page_min = view_y_page_max;
    //if (rm_is_bottom_page_locked(scene_data_scene_name)) view_y_page_min = view_y_page_max;
    
    _datakey = _SceneRando_scene+STR_file_name+STR_Quest+hex_str(file_data_quest_num);
    //_datakey = scene_data_scene_name+STR_file_name+STR_Quest+hex_str(file_data_quest_num);
    var _FILE_NAME = val(dm_rm[?_datakey]);
        _FILE_NAME = val(f.dm_rando[?_datakey], _FILE_NAME);
    db_rm_data_Room_Start(_FILE_NAME);
}








// -------------------------------------------------------------------------
if (_ROOM_A)
{
    var _spawn_xl,_spawn_xc, _spawn_yt,_spawn_yc;
    var _defeated_count, _respawn_type;
    var _spawn_permission  = 0;
    var _spawn_permission1 = 0;
    var _item_id   = undefined;
    var _item_type = undefined;
    var _objver1   = undefined;
    var _objver2   = undefined;
    
    var _PRXM_COUNT = val(dm_spawn[?get_spawn_datakey(_SceneRando_scene,STR_PRXM,-1)]);
    var _PRIO_COUNT = val(dm_spawn[?get_spawn_datakey(_SceneRando_scene,STR_PRIO,-1)]);
    //var _PRXM_COUNT = val(dm_spawn[?get_spawn_datakey(scene_data_scene_name,STR_PRXM,-1)]);
    //var _PRIO_COUNT = val(dm_spawn[?get_spawn_datakey(scene_data_scene_name,STR_PRIO,-1)]);
}








f.key_count    = get_key_count(_DUNGEON_NUM);
f.kakusu_count = get_kakusu_count();





if (room==rmB_NextLife)
{
    if (coming_from==coming_from_FILE 
    ||  coming_from==coming_from_CONT 
    ||  coming_from==coming_from_DEAD )
    {
        f.hp = get_stat_max(STR_Heart);
        f.mp = get_stat_max(STR_Magic);
        //sdm("f.hp $"+hex_str(f.hp)+", f.mp $"+hex_str(f.mp));
        
        if (coming_from==coming_from_FILE) f.xpPending = 0;
        //f.xpPending = 0;
        f.xpDrain   = 0;
        
        
        if (coming_from==coming_from_FILE)
        {
            for(_i=ds_grid_width(overworld.TreasureMaps_dg)-1; _i>=0; _i--)
            {   // Mark as NOT acquired. Overworld_Room_Start() will check what has been acquired and update this.
                overworld.TreasureMaps_dg[#_i,$05]=0;
            }
        }
        
        
        if (coming_from==coming_from_FILE 
        ||  coming_from==coming_from_CONT )
        {
            if (mod_START_RUN_LIVES) lives = STARTING_LIVES + get_life_doll_count();
            else                     lives = STARTING_LIVES;
            
            
            f.xpNext=0;
            if (f.xp)
            {
                var          _dl_NEXT = ds_list_create();
                ds_list_add( _dl_NEXT, get_xp_next(STAT_ATK));
                ds_list_add( _dl_NEXT, get_xp_next(STAT_MAG));
                ds_list_add( _dl_NEXT, get_xp_next(STAT_LIF));
                ds_list_sort(_dl_NEXT,true);
                
                for(_i=0; _i<3; _i++)
                {
                    if (f.xp <     _dl_NEXT[|_i])
                    {
                        f.xpNext = _dl_NEXT[|_i];
                        break;//_i
                    }
                }
                ds_list_destroy(_dl_NEXT);
            }
        }
        
        
        overworld.exit_grid_xy = val(overworld.dm_data[?MK_OWRC_NPAL1],OWRC_DFL);
    }
}




if(!f.xpNext) f.xpNext = min(get_xp_next(STAT_ATK),get_xp_next(STAT_MAG),get_xp_next(STAT_LIF));



if (_ROOM_A)
{
    if (coming_from != coming_from_RM_C)
    {
        _owrc = dm_rm[?rm_name+STR_OWRC];
        if(!is_undefined(_owrc) 
        &&               _owrc>=0 )
        {
            overworld.pcrc = _owrc;
            
            if (DisplayOWPosOnMap_VER 
            ||  val(dm_rm[?rm_name+STR_show_ow_pos]) )
            {
                overworld.pcrc_map = overworld.pcrc;
            }
        }
    }
}



// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------







// -------------------------------------------------------------------------
// Going into a Palace or Town rmA should trigger this so OW objects get reset
var _C1 = _ROOM_A && isVal(coming_from, coming_from_FILE, coming_from_CONT);
var _C2 = _ROOM_A && val(f.dm_rando[?_rm_name_PREV+STR_Dungeon+STR_Area],_area_name_PREV)!=val(f.dm_rando[?rm_name+STR_Dungeon+STR_Area],area_name);
//var _C2 = _ROOM_A && _area_name_PREV!=area_name;
var _C3 = coming_from==coming_from_RM_C && ( dungeon_num      ||  town_num);
var _C4 =                       _ROOM_C && (_dungeon_num_PREV || _town_num_PREV);
if (_C1 || _C2 || _C3 || _C4)
{
    // --------------------------------------------------------------------
    ds_map_clear(f.dm_jars);
    spawn_data_set_default();
    
    // --------------------------------------------------------------------
    with(overworld)
    {
        // In OG, going to diff area resets overworld to default
        ds_grid_copy(dg_tsrc,  dg_tsrc_def);
        ds_grid_copy(dg_solid, dg_solid_def);
        if (f.items&ITM_BOOT) Overworld_tile_change_2a(TileChangeEvent_TYPE_BOOT1);
        
        
        // So that Palace 6 and New Kasuto don't stay 'Open':
        _datakey  = ds_map_find_first(dm_data);
        var _LAST = ds_map_find_last( dm_data);
        while (true)
        {
            if (string_pos(STR_Open,   _datakey)   // _datakey does     contain "_Open"
            && !string_pos(STR_Default,_datakey) ) // _datakey does NOT contain "_Default"
            {
                if(!is_undefined(        dm_data[?_datakey+STR_Default]))
                {   dm_data[?_datakey] = dm_data[?_datakey+STR_Default];  }
            }
            
            if (_datakey==_LAST) break;//while (true)
            _datakey = ds_map_find_next(dm_data,_datakey);
        }
        
        
        for(_i=1; _i<=$100; _i++)
        {
            _owrc=val(dm_data[?STR_OWRC+STR_River_Devil+hex_str(_i)]);
            if(!is_undefined(dm_data[?hex_str(_owrc)+STR_River_Devil+STR_State]))
            {                dm_data[?hex_str(_owrc)+STR_River_Devil+STR_State] = 1;  }
            else break;//_i
        }
        
        
        if (g.Rando_RauruRiverDevil)
        {
            _owrc = dm_data[?STR_Rando+STR_River_Devil+STR_OWRC];
            if(!is_undefined(_owrc))
            {
                    dm_data[?hex_str(_owrc)+STR_River_Devil+STR_State] = 0;
                if (val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]))
                {
                    dm_data[?hex_str(_owrc)+STR_River_Devil+STR_State] = 1;
                    dg_tsrc[# byte(_owrc>>0),byte(_owrc>>8)] = val(dm_data[?STR_Rando+STR_River_Devil+STR_TSRC]);
                    //dg_tsrc[# byte(_owrc>>0),byte(_owrc>>8)] = val(dm_data[?STR_Rando+STR_River_Devil+STR_TSRC], $D8);
                    dg_solid[#byte(_owrc>>0),byte(_owrc>>8)] = 1;
                }
            }
        }
        
        
        
        
        if (g.anarkhyaOverworld_MAIN)
        {
            ds_grid_copy(dg_anarkhya_tsrc, dg_anarkhya_tsrc_def);
            ds_grid_copy(dg_anarkhya_tsrc_detail, dg_anarkhya_tsrc_detail_def);
            
            if (f.items&ITM_BOOT)
            {
                for(_i=ds_grid_width(dg_anarkhya_tsrc_boots)-1; _i>=0; _i--)
                {
                    _owrc = dg_anarkhya_tsrc_boots[#_i,0];
                    _clm = (_owrc>>0)&$FF;
                    _row = (_owrc>>8)&$FF;
                    dg_anarkhya_tsrc[#_clm,_row] = dg_anarkhya_tsrc_boots[#_i,1];
                }
            }
        }
    }
    
    
    
    
    // --------------------------------------------------------------------
    // _C2 = _ROOM_A && _area_name_PREV!=area_name;
    // _C3 = coming_from==coming_from_RM_C && (dungeon_num||town_num);
    if (_DUNGEON_NUM 
    && (_C2 || _C3) )
    {
        DungeonMapVisible_refresh(_DUNGEON_NUM);
    }
}
                                     _datakey=STR_Dungeon+hex_str(_DUNGEON_NUM)+STR_Map;
PAUSE_MENU.dungeon_clms = val(dm_rm[?_datakey+STR_Clm+STR_Count]);
PAUSE_MENU.dungeon_rows = val(dm_rm[?_datakey+STR_Row+STR_Count]);


// --------------------------------------------------------------------
if (_ROOM_C)
{   // Reset Boulder Circle every time entering overworld so player 
    // doesn't have to go all the way to diff area and back.
    with(overworld)
    {
        for(_i=ds_list_size(dl_BoulderCircle_OWRC)-1; _i>=0; _i--)
        {
            _clm = (dl_BoulderCircle_OWRC[|_i]>>0)&$FF;
            _row = (dl_BoulderCircle_OWRC[|_i]>>8)&$FF;
            dg_tsrc[# _clm,_row] = dg_tsrc_def[# _clm,_row];
            dg_solid[#_clm,_row] = dg_solid_def[#_clm,_row];
            
            if (g.anarkhyaOverworld_MAIN)
            {
                dg_anarkhya_tsrc_detail[#_clm,_row] = anarkhya_TSRC_BOULDER;
            }
        }
        
        ds_list_clear(dl_BoulderCircle_broke_order);
        if (val(f.dm_quests[?STR_Boulder+STR_Circle+STR_Complete]))
        {
            _clm = (BoulderCircle_center_OWRC>>0)&$FF;
            _row = (BoulderCircle_center_OWRC>>8)&$FF;
            dg_tsrc[# _clm,_row] = BoulderCircle_center_TSRC;
            dg_solid[#_clm,_row] = 0;
            
            if (g.anarkhyaOverworld_MAIN)
            {
                dg_anarkhya_tsrc[#_clm,_row]=anarkhya_TSRC_HOLE;
            }
        }
    }
}
















// -------------------------------------------------------------------------
// ENCOUNTER  --------------------------------------------------
in_safe_encounter = false;


if (_ROOM_C 
|| (_ROOM_A && !rm_get_encounter_types(rm_name)) )
//|| (_ROOM_A && !rm_get_encounter_types(scene_data_scene_name)) )
{
    encounter_type = 0;
}

if (_ROOM_A)
{
    if (encounter_type)
    {
        if (encounter_type&g.ENC_FARY 
        ||  is_safe_encounter_rm() )
        {
            in_safe_encounter = true;
        }
    }
    
    // !!! g.encounter_type SHOULD NOT update if respawning from dying !!!
    if (coming_from!=coming_from_DEAD  // if NOT respawning from dying
    &&  encounter_type )
    {
        // 0: NO encounter, 1: WEAK encounter, 2: STRONG encounter, 3: FAIRY encounter
        // encounter_type is set to 0 in Room_End Event
        // encounter_type is set to the encounter object type(1:WEAK, 2:STRONG, 3:FAIRY) in Overworld_enc_inst_update() on encounter rm trigger.
        // rm data for encounter_type is stored as a string. (Example: '01'+'02')
        
        // This is checking if this particular encounter rm allows the encounter type that triggered the encounter.
        // I'm not sure if it even matters.
        if (rm_get_encounter_types(rm_name)&encounter_type)
        //if (rm_get_encounter_types(scene_data_scene_name)&encounter_type)
        {
            // New encounter gaurantees all enemy spawns.
            for(_i=max(_PRIO_COUNT,_PRXM_COUNT)-1; _i>=0; _i--)
            {
                                           _spawn_datakey = get_spawn_datakey(rm_name,STR_PRIO,_i);
                                           //_spawn_datakey = get_spawn_datakey(scene_data_scene_name,STR_PRIO,_i);
                if(!is_undefined(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]))
                {                dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;  }
                
                                           _spawn_datakey = get_spawn_datakey(rm_name,STR_PRXM,_i);
                                           //_spawn_datakey = get_spawn_datakey(scene_data_scene_name,STR_PRXM,_i);
                if(!is_undefined(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]))
                {                dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;  }
            }
        }
        else
        {
            encounter_type = 0;
        }
    }
}



if (_ROOM_A)
{
    overworld.enc_spawn_timer_add = 0;
    if (encounter_type 
    && !in_safe_encounter )
    {   // Balancing. Add extra delay to next enc inst spawn
        // overworld.enc_spawn_timer decrements every $14 frames when g.timer_b reaches -1 in update_game_timers()
        overworld.enc_spawn_timer_add = 2; // this value is multiplied by $14
    }
}












// -------------------------------------------------------------------------
// --------  EXITS  EXITS  EXITS  ---------------------------------
if (_ROOM_A)
{
                 _count = ds_list_size(dl_exit_dirs);
    for(_i=0; _i<_count; _i++) // each room side, and middle
    {
        for(_j=0; _j<$100; _j++) // each possible exit of this room side
        {
            _exit_num  = dl_exit_dirs[|_i] + _j;
            _exit_name = rm_name+hex_str(_exit_num);
            if (is_undefined(dm_rm[?_exit_name+STR_Open])) break;//_j
            
            _exit = Exit_construct(_exit_name);
            
            if (_SCENE_IS_RANDOMIZED)
            {
                _exit_name2 = _SceneRando_scene+hex_str(_exit_num);
                with(_exit)
                {
                    ww  = val(g.dm_rm[?_exit_name2+STR_Width], 2) <<3;
                    hh  = val(g.dm_rm[?_exit_name2+STR_Height],2) <<3;
                    hh += sign(exit_type&g.EXIT_TYPE_DOOR); // EXIT_TYPE_DR y scale down 1 extra pixel so GO csMid can detect
                    
                    ww_ = ww>>1;
                    hh_ = hh>>1;
                    
                    image_xscale = ww;
                    image_yscale = hh;
                    
                    xl = val(g.dm_rm[?_exit_name2+STR_Exit_x]) <<3;
                    xr = xl + ww;
                    xc = xl + ww_;
                    x  = xl;
                    
                    yt = val(g.dm_rm[?_exit_name2+STR_Exit_y]) <<3;
                    yb = yt + hh;
                    yc = yt + hh_;
                    y  = yt;
                    
                    update_draw_xy();
                    
                                      page_x = xl>>8;
                         if (side&$2) page_x++;
                    else if (side&$1) page_x--;
                    page_y = yt>>8;
                    
                    
                    BodyHB_x = xl;
                    BodyHB_y = yt;
                    BodyHB_w = ww;
                    BodyHB_h = hh;
                }
            }
        }
    }
    
    
    
    exit_enter = noone;
    with(Exit)
    {
        if (exitName==f.reen)
        {
            g.exit_enter = id;
            break;//with(Exit)
        }
    }
    
    if (exit_enter==noone)
    {
        sdm("!!! WARNING: No Exit matches f.reen: "+string(f.reen));
        with(Exit){g.exit_enter=id; break;}
        if (exit_enter==noone)
        {   // Probably wrong datakey for rm data.
            f.reen = EXIT_NAME_GAME_START;
            var _RM_NAME = get_exit_rm_name(f.reen);
            room_goto_(rmA_ACTION, rm_get_wh(_RM_NAME,0), rm_get_wh(_RM_NAME,1));
        }
    }
    else
    {
        if (_SCENE_IS_RANDOMIZED 
        &&  exit_enter.exitName==f.reen 
        &&  exit_enter.exit_type&g.EXIT_TYPE_DOOR 
        && !exit_enter.open 
        &&  coming_from=coming_from_RM_C )
        {
            _exit = exit_enter;
            with(Exit)
            {
                if (id!=_exit 
                &&  side&$3 )
                {
                    if ((g.overworld.pc_dir&$A && side&$1) 
                    ||  (g.overworld.pc_dir&$5 && side&$2) )
                    {
                        _exit = id;
                        break;//with(Exit)
                    }
                    
                    if (_exit==g.exit_enter 
                    ||  abs(xc-g.exit_enter.xc)<=abs(_exit.xc-g.exit_enter.xc) )
                    {
                        _exit = id;
                    }
                }
            }
            
            exit_enter = _exit;
            f.reen = exit_enter.exitName;
        }
    }
}    












// -------------------------------------------------------------------------
if (_ROOM_C)
{   // 2025/03/23. A falling scene from the overworld will draw cucco if pc was cucco in the last scene
    spells_active = 0;
    
    if (mod_PC_CUCCO_1 
    &&  CuccoSpell2_Acquired 
    &&  CuccoSpell2_Active 
    &&  CuccoSpell2_Option )
    {   spells_active |= SPL_FARY;  }
}
else if (_ROOM_A)
{
    if (coming_from != coming_from_RM_A  // NOT coming from a      rmA
    ||  rm_name     != _rm_name_PREV )   //     coming from a diff rmA 
    {
        ds_list_clear(dl_spell_history);
        ds_list_add(  dl_spell_history,0);
        
        spell_cast_this_frame = 0;
        spells_active = 0;
        
        if (mod_PC_CUCCO_1 
        &&  CuccoSpell2_Acquired 
        &&  CuccoSpell2_Active 
        &&  CuccoSpell2_Option )
        {   spells_active |= SPL_FARY;  }
        
        //sdm("CuccoSpell2_Acquired "+string(CuccoSpell2_Acquired)+", CuccoSpell2_Option "+string(CuccoSpell2_Option)+", CuccoSpell2_Active "+string(CuccoSpell2_Active));
        if(!mod_CAST_SPELL_CONDITION 
        &&  f.spells    & spell_selected )
        {
            spell_ready = spell_selected;
        }
    }
}























// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
if (_ROOM_A)
{
    // ow_axis bits: $0:horizontal, $1:vertical, $2:flip x/yscale
    rm_ow_dir  = val(dm_rm[?rm_name+STR_ow_axis]);
    rm_ow_dir &= $3;
    
    
    // This won't start counting down until timer_change_room reaches 0
    EnterRoom_SpawnGO_timer = EnterRoom_SpawnGO_DELAY; // EnterRoom_SpawnGO_DELAY=2
    
    
    // -------------------------------------------------------------------------
    // Build list of GO spawn tiles for the rm
    ds_grid_clear( dg_spawn_prxm, 0);
    ds_grid_resize(dg_spawn_prxm, _PRXM_COUNT, ds_grid_height(dg_spawn_prxm));
    
    ds_grid_clear( dg_spawn_prio, 0);
    ds_grid_resize(dg_spawn_prio, _PRIO_COUNT, ds_grid_height(dg_spawn_prio));
    
    var _DATAKEY1     = STR_Randomize+STR_Enemy;
    var _Rando_METHOD = val(f.dm_rando[?_DATAKEY1+STR_Method]);
    
                 _count = max(_PRIO_COUNT,_PRXM_COUNT);
    for(_i=0; _i<_count; _i++)
    {
        for(_j=0; _j<=1; _j++) // 0: PRIO, 1: PRXM
        {
            switch(_j)
            {
                case 0:{
                if (_i>=_PRIO_COUNT) continue;//_j
                _spawn_datakey = get_spawn_datakey(_SceneRando_scene,STR_PRIO,_i);
                //_spawn_datakey = get_spawn_datakey(scene_data_scene_name,STR_PRIO,_i);
                break;}
                
                case 1:{
                if (_i>=_PRXM_COUNT) continue;//_j
                _spawn_datakey = get_spawn_datakey(_SceneRando_scene,STR_PRXM,_i);
                //_spawn_datakey = get_spawn_datakey(scene_data_scene_name,STR_PRXM,_i);
                break;}
            }
            
                _obj  = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
            if(!_obj) continue;//_j
            
            _obj_name = object_get_name(_obj);
            _ver      = val(dm_spawn[?_spawn_datakey+STR_Version]);
            _objver1  = _obj_name+hex_str(_ver);
            
            _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
            _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
            _w_       = _w>>1;
            _h_       = _h>>1;
            
            _spawn_xl = val(dm_spawn[?_spawn_datakey+"_x"]); // spawn x
            _spawn_yt = val(dm_spawn[?_spawn_datakey+"_y"]); // spawn y
            _spawn_xc = _spawn_xl + _w_;
            _spawn_yc = _spawn_yt + _h_;
            
            _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey]);
            
            // respawn_type: Value representing if and when GO can respawn.
            // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
                _spawn_permission1 = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
            if (_respawn_type==3 
            &&  _spawn_permission1!=-1 ) // -1 never spawn again
            {   dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;  }
            
            _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
            
            
            
            
            // --------------------------------------------------------------
            _item_id = val(g.dm_spawn[?_spawn_datakey+STR_Item+STR_ID+STR_Randomized]);
            if (is_string(_item_id))
            {
                _item_type = val(g.dm_spawn[?_item_id+STR_Item+STR_Type]);
                if (is_string(_item_type))
                {
                    _obj = val(g.dm_ITEM[?_item_type+STR_Object]);
                    _ver = val(g.dm_spawn[?_item_id+STR_Version],1);
                    _obj_name = object_get_name(_obj);
                    _objver2  = _obj_name+hex_str(_ver);
                    
                    _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                    _w   = _val;
                    _w_  = _w>>1;
                    _spawn_xl = _spawn_xc - _w_;
                    
                    _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                    _spawn_yt = (_spawn_yt+_h) - _val;
                    _h   = _val;
                    _h_  = _h>>1;
                    _spawn_yc  = _spawn_yt + _h_;
                }
            }
            else
            {
                if ( Rando_enemy 
                &&  _Rando_METHOD )
                {
                    switch(_Rando_METHOD){
                    default:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Spawn+_spawn_datakey+STR_OBJVER+STR_Randomized]; break;}
                    case  2:{_objver2 = f.dm_rando[?_DATAKEY1+STR_Type +_objver1      +STR_OBJVER+STR_Randomized]; break;}
                    }
                    
                    if(!is_undefined(_objver2))
                    {   // _objver2 example: "Snaraa01". obj name + ver
                        _len  = string_length(_objver2);
                        _val1 = string_copy(  _objver2,1,_len-2); // obj name
                        _val2 = g.dm_go_prop[?_val1+STR_Object+STR_Idx]; // obj
                        if(!is_undefined(_val2))
                        {
                            // *** Cutscene_CreateWaterfall_update() checks for any hard skin enemies and if PC can defeat them
                            if (_SceneRando_scene!=NabooruQuest_RM_NAME  // All enemies must be defeated in this rm
                            || !isVal(_val2,GeldA,GlzmA,LeevA) )         // these enemies draw behind the wall so restrict them for now
                            {
                                if (cam_xl_range() 
                                || !isVal(_val2,SpMaA,SpWoA) ) // Spawner_Mau, Spawner_Wosu, all need camera scroll to work
                                {
                                    _obj      = _val2;
                                    _obj_name = _val1;
                                    _ver      = string_copy(_objver2,_len-1,2);
                                    _ver      = str_hex(_ver);
                                    
                                    _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                                    _w   = _val;
                                    _w_  = _w>>1;
                                    _spawn_xl = _spawn_xc - _w_;
                                    
                                    _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                                    _spawn_yt = (_spawn_yt+_h) - _val;
                                    _h   = _val;
                                    _h_  = _h>>1;
                                    _spawn_yc  = _spawn_yt + _h_;
                                    if (_obj==TektA)
                                    {   // Temporary fix bc Tektites are falling through bridges
                                        _spawn_yt -= $10;
                                        _spawn_yc  = _spawn_yt + _h_;
                                    }
                                    
                                    
                                    
                                    dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = _spawn_permission1;
                                    
                                        _respawn_type = val(dm_go_prop[?_objver2+STR_Respawn]);
                                    if (_respawn_type==3)   dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;
                                    
                                    _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                                }
                            }
                        }
                    }
                }
            }
            
            
            
            
            
            // --------------------------------------------------------------
            if (_j) // PRXM (proximity-to-view spawns)
            {                     _a=0;
                dg_spawn_prxm[#_i,_a++] = _spawn_datakey;   // 
                dg_spawn_prxm[#_i,_a++] = _obj;             // 
                dg_spawn_prxm[#_i,_a++] = _obj_name;        // 
                dg_spawn_prxm[#_i,_a++] = _ver;             // 
                //                                          //
                dg_spawn_prxm[#_i,_a++] = _spawn_xl;        // 
                dg_spawn_prxm[#_i,_a++] = _spawn_xc;        // 
                dg_spawn_prxm[#_i,_a++] = _spawn_yt;        // 
                dg_spawn_prxm[#_i,_a++] = _spawn_yc;        // 
                //                                          //
                dg_spawn_prxm[#_i,_a++] = _w;               // 
                dg_spawn_prxm[#_i,_a++] = _w_;              // 
                dg_spawn_prxm[#_i,_a++] = _h;               // 
                dg_spawn_prxm[#_i,_a++] = _h_;              // 
                //                                          //
                dg_spawn_prxm[#_i,_a++] = _respawn_type;    // 
                dg_spawn_prxm[#_i,_a++] = _defeated_count;  // 
                dg_spawn_prxm[#_i,_a++] = _spawn_permission;// 
            }
            else // PRIO (priority spawns)
            {                     _a=0;
                dg_spawn_prio[#_i,_a++] = _spawn_datakey;   // 
                dg_spawn_prio[#_i,_a++] = _obj;             // 
                dg_spawn_prio[#_i,_a++] = _obj_name;        // 
                dg_spawn_prio[#_i,_a++] = _ver;             // 
                //                                          //
                dg_spawn_prio[#_i,_a++] = _spawn_xl;        // 
                dg_spawn_prio[#_i,_a++] = _spawn_xc;        // 
                dg_spawn_prio[#_i,_a++] = _spawn_yt;        // 
                dg_spawn_prio[#_i,_a++] = _spawn_yc;        // 
                //                                          //
                dg_spawn_prio[#_i,_a++] = _w;               // 
                dg_spawn_prio[#_i,_a++] = _w_;              // 
                dg_spawn_prio[#_i,_a++] = _h;               // 
                dg_spawn_prio[#_i,_a++] = _h_;              // 
                //                                          //
                dg_spawn_prio[#_i,_a++] = _respawn_type;    // 
                dg_spawn_prio[#_i,_a++] = _defeated_count;  // 
                dg_spawn_prio[#_i,_a++] = _spawn_permission;// 
                //sdm(_spawn_datakey+", "+_obj_name+"-"+string(_ver)+", xl $"+hex_str(_spawn_xl)+" yt $"+hex_str(_spawn_yt)+", _w $"+hex_str(_w)+" _h $"+hex_str(_h)+", _respawn_type "+string(_respawn_type)+", _spawn_permission"+string(_spawn_permission));
                if (_SceneRando_DEBUG1 && is_ancestor(_obj,Item)) sdm("SceneRando Item-A. _SceneRando_scene '"+_SceneRando_scene+"', rm_name '"+rm_name+"', _spawn_datakey '"+_spawn_datakey+"', _obj_name '"+_obj_name+"', ");
            }
        }
    }
}




if (_ROOM_A 
&&  _SCENE_IS_RANDOMIZED )
{
    //global.dm_scene_rando[?dk_SceneRando+STR_Scene+STR_Type+hex_str(_num2)] = _RANDO_SCENE_TYPE
    //global.dm_scene_rando[?dk_SceneRando+STR_Scene+STR_Type+_SCENE_NAME] = _RANDO_SCENE_TYPE;
    _val1 = global.dm_scene_rando[?dk_SceneRando+STR_Scene+STR_Type+rm_name];
    //var _SceneRando_HAS_ITEM = !is_undefined(_val1) && string_pos(STR_Item,_val1);
    if(!is_undefined(_val1) 
    && string_pos(STR_Item,_val1) )
    {
        for(_i=0; _i<_PRIO_COUNT; _i++)
        {
            _obj = dg_spawn_prio[#_i,1];
            if (is_ancestor(_obj,Item))
            {
                if (_SceneRando_DEBUG1) sdm("SceneRando Item-B. _SceneRando_scene '"+_SceneRando_scene+"', rm_name '"+rm_name+"', _spawn_datakey '"+dg_spawn_prio[#_i,0]+"', _obj_name '"+object_get_name(_obj)+"', ");
                _count2 = val(dm_spawn[?get_spawn_datakey(rm_name,STR_PRIO,-1)]);
                for(_j=0; _j<_count2; _j++)
                {
                    _spawn_datakey = get_spawn_datakey(rm_name,STR_PRIO,_j);
                    _obj = val(dm_spawn[?_spawn_datakey+STR_obj_idx]);
                    //sdm("_obj "+object_get_name(_obj)+", is_ancestor(_obj,Item) "+string(is_ancestor(_obj,Item))+", val(dm_ITEM[?object_get_name(_obj)+STR_Item+STR_Type]) "+string(val(dm_ITEM[?object_get_name(_obj)+STR_Item+STR_Type])));
                    if (_obj 
                    &&  is_ancestor(_obj,Item) )
                    //&&  val(dm_ITEM[?object_get_name(_obj)+STR_Item+STR_Type])!=STR_JAR )
                    {
                        _obj_name = object_get_name(_obj);
                        _ver      = val(dm_spawn[?_spawn_datakey+STR_Version]);
                        _objver1  = _obj_name+hex_str(_ver);
                        
                        _w        = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                        _h        = val(dm_go_prop[?_obj_name+STR_Height], $10);
                        _w_       = _w>>1;
                        _h_       = _h>>1;
                        
                        _spawn_xl = dg_spawn_prio[#_i,4]; // spawn x
                        _spawn_yt = dg_spawn_prio[#_i,6]; // spawn y
                        _spawn_xc = _spawn_xl + _w_;
                        _spawn_yc = _spawn_yt + _h_;
                        if (_SceneRando_DEBUG1) sdm("SceneRando Item-C. _SceneRando_scene '"+_SceneRando_scene+"', rm_name '"+rm_name+"', _spawn_datakey '"+_spawn_datakey+"', _obj_name '"+_obj_name+"', ");
                        
                        _item_id = val(g.dm_spawn[?_spawn_datakey+STR_Item+STR_ID+STR_Randomized]);
                        if (is_string(_item_id))
                        {
                            _item_type = val(g.dm_spawn[?_item_id+STR_Item+STR_Type]);
                            if (is_string(_item_type))
                            {
                                _obj = val(g.dm_ITEM[?_item_type+STR_Object]);
                                _ver = val(g.dm_spawn[?_item_id+STR_Version],1);
                                _obj_name = object_get_name(_obj);
                                _objver2  = _obj_name+hex_str(_ver);
                                
                                _val = val(dm_go_prop[?_obj_name+STR_Width],  $10);
                                _w   = _val;
                                _w_  = _w>>1;
                                _spawn_xl = _spawn_xc - _w_;
                                
                                _val = val(dm_go_prop[?_obj_name+STR_Height], $10);
                                _spawn_yt = (_spawn_yt+_h) - _val;
                                _h   = _val;
                                _h_  = _h>>1;
                                _spawn_yc  = _spawn_yt + _h_;
                                if (_SceneRando_DEBUG1) sdm("SceneRando Item-D. _SceneRando_scene '"+_SceneRando_scene+"', rm_name '"+rm_name+"', _spawn_datakey '"+_spawn_datakey+"', _obj_name '"+_obj_name+"', _item_id '"+_item_id+"', _item_type '"+_item_type+"'");
                            }
                        }
                        
                        _defeated_count = val(f.dm_quests[?get_defeated_dk()+_spawn_datakey]);
                        
                        // respawn_type: Value representing if and when GO can respawn.
                        // 0: never, 1: off screen, 2: refresh area, 3: refresh rm, 4: 30 seconds (on or off screen)
                            _respawn_type      = val(dm_go_prop[?_objver1+STR_Respawn]);
                            _spawn_permission1 = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                        if (_respawn_type==3 
                        &&  _spawn_permission1!=-1 ) // -1 never spawn again
                        {   dm_spawn[?_spawn_datakey+STR_Spawn_Permission] = 1;  }
                        
                        _spawn_permission = val(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]);
                        
                        
                                          _a=0;
                        dg_spawn_prio[#_i,_a++] = _spawn_datakey;   // 
                        dg_spawn_prio[#_i,_a++] = _obj;             // 
                        dg_spawn_prio[#_i,_a++] = _obj_name;        // 
                        dg_spawn_prio[#_i,_a++] = _ver;             // 
                        //                                          //
                        dg_spawn_prio[#_i,_a++] = _spawn_xl;        // 
                        dg_spawn_prio[#_i,_a++] = _spawn_xc;        // 
                        dg_spawn_prio[#_i,_a++] = _spawn_yt;        // 
                        dg_spawn_prio[#_i,_a++] = _spawn_yc;        // 
                        //                                          //
                        dg_spawn_prio[#_i,_a++] = _w;               // 
                        dg_spawn_prio[#_i,_a++] = _w_;              // 
                        dg_spawn_prio[#_i,_a++] = _h;               // 
                        dg_spawn_prio[#_i,_a++] = _h_;              // 
                        //                                          //
                        dg_spawn_prio[#_i,_a++] = _respawn_type;    // 
                        dg_spawn_prio[#_i,_a++] = _defeated_count;  // 
                        dg_spawn_prio[#_i,_a++] = _spawn_permission;// 
                        break;//_j
                    }
                }
                break;//_i
            }
        }
    }
}












if (_ROOM_A)
{
    var _X = pc.x;
    var _Y = pc.y;
    set_pc_spawn_xy(); // update_explored_data() && rm_set_cam_1a() need this
    set_xy(pc, pc.spawn_x+PC_W_,pc.spawn_y+PC_H_);
    
    update_explored_data();
    set_xy(pc, _X,_Y); // idk if this is necessary.
}













// ------------------------------------------------------------------------------
// RM BRIGHTNESS  ----------------------------------------------------
if (_ROOM_A)
{
    set_rm_brightness(0);
    
    if (mod_RM_BRIGHTNESS_SYS)
    {
        if (mod_RM_BRIGHTNESS_SYS==2 
        &&  f.items&ITM_CAND )
        {   set_rm_brightness(rm_brightness+1);  }
        
        
        _val = dm_rm[?rm_name+STR_Dark_Room];
        //_val = dm_rm[?scene_data_scene_name+STR_Dark_Room];
        if (is_undefined(_val) 
        ||  _val==-1 
        ||  _SCENE_IS_RANDOMIZED )
        {
            set_rm_brightness(RM_BRIGHTNESS_MAX);
        }
        
        
        if (rm_brightness<RM_BRIGHTNESS_MAX)
        {
            for(_i=_PRIO_COUNT-1; _i>=0; _i--)
            {
                _spawn_datakey    = dg_spawn_prio[#_i,$0];
                _obj              = dg_spawn_prio[#_i,$1];
                _obj_name         = dg_spawn_prio[#_i,$2];
                _ver              = dg_spawn_prio[#_i,$3];
                _spawn_permission = dg_spawn_prio[#_i,$E];
                //if (is_ancestor(_obj,Torch)) sdm(_spawn_datakey+", _spawn_permission "+string(_spawn_permission)+":"+string(dm_spawn[?_spawn_datakey+STR_Spawn_Permission]));
                if (is_undefined(_spawn_datakey) 
                || !_spawn_permission )
                {
                    continue;//_i
                }
                
                // ------------------------------------------------
                _val = dm_spawn[?_spawn_datakey+STR_Qualified+STR_Quest+STR_Nums];
                if (is_undefined(_val)  // This inst is qualified for any quest if there's no data
                || !is_string(   _val)  // Should this be:  (!is_string(_val) && _val==f.quest_num) ??
                ||  string_pos(hex_str(f.quest_num),_val) )
                {
                    _objver1 = _obj_name+hex_str(_ver);
                    _val1 = val(dm_go_prop[?_objver1    +STR_Brightness]); // brightness specific to this object
                    _val2 =     dm_spawn[?_spawn_datakey+STR_Brightness];  // brightness specific to this spawn location
                    _val  = val(_val2,_val1); // if _val2 is undefined, use _val1
                    if (_val)
                    {
                        if(!is_ancestor(_obj,Torch) 
                        ||  val(dm_spawn[?_spawn_datakey+STR_Lit]) ) // Torch spawn locations must specify if they're already lit
                        {
                            set_rm_brightness(rm_brightness+_val);
                            // TODO: More things need to be checked first? This instance may 
                            // not spawn due to various reasons like respawn limits.
                            
                            if (rm_brightness>=RM_BRIGHTNESS_MAX)
                            {
                                break;//_i
                            }
                        }
                    }
                }
            }//for(_i=_PRIO_COUNT-1; _i>=0; _i--)
        }
    }
    else
    {   // OG ---------------------
        if (dungeon_num 
        ||  f.items&ITM_CAND )
        {
            set_rm_brightness(RM_BRIGHTNESS_MAX); // fully lit
        }
    }
}










if (_ROOM_A 
||  _ROOM_B1 ) // w/out this here, view coords will be wrong when going from end credits to title screen.
{
    if (_ROOM_A)
    {
        with(pc)
        {
            set_xy(id, spawn_x+PC_W_,spawn_y+PC_H_); // rm_set_cam_1a() needs this
            update_view_og();
            rm_set_cam_1a(x,y);
        }
    }
    
    
    
    
    // Default $1(set in set_rm_data()) unless specified. Most rms do not scroll vertically.
    var _LOCK = val(dm_rm[?_SceneRando_scene+STR_View+STR_Data]);
    //var _LOCK = val(dm_rm[?scene_data_scene_name+STR_View+STR_Data]);
        _LOCK = clamp(_LOCK,$0,$3);
    // This is to prevent vertical scroll.
    // Because wide view 480x270 is taller than 1 page, 
    // some rms need graphics above the normal 1 page height 
    // and must be 2 pages high.
    // The view will act as if rm is only 1 page high and lock to the btm-most page.
    if (_LOCK&$1 
    ||  viewH()>rm_h )
    {
        set_camera_xy(viewXL(), rm_h-VIEW_PAD_YB-viewH());
        view_lock_rm |= $C;
        view_lock    |= view_lock_rm;
        
        view_y_page_min = view_y_page_max;
    }
    
    // Same thing, but for horizontal.
    // View will act as if rm is only 1 page wide and lock to the CENTER of the rm.
    if (_LOCK&$2 
    ||  viewW()>rm_w 
    ||  rm_pages_x==2 )
    {
        set_camera_xy(rm_w_-viewW_(), viewYT());
        view_lock_rm |= $3;
        view_lock    |= view_lock_rm;
    }
}








if (_ROOM_A)
{
    scene_enter_add_tiles();
}








if (_ROOM_A 
&&  pc.Disguise_enabled )
{
    for(_i=ds_list_size(g.dl_TILE_DEPTH_NAMES)-1; _i>=0; _i--)
    {
        _val = g.dm_tile_file[?g.dl_TILE_DEPTH_NAMES[|_i]+STR_Depth+STR_Layer+STR_Name];
        if(!is_undefined(_val) 
        &&  is_string(_val) )
        {
            if (string_pos(STR_BREAK_,_val) 
            ||  string_pos(STR_BURNABLE,_val) )
            {   // So that pc can stab blocks, burn vines, etc...
                pc.Disguise_enabled = false;
                break;//_i
            }
        }
    }
    
    
    // TODO: What if the scene will have enemies?
    //dg_spawn_prxm
}











if (_ROOM_A)
{
    instance_create(viewXC()-viewW_(), viewYT(), HUD); // Create HUD instance
    with(pc) PC_Room_Start();
    with(go_mgr) GameObjectMgr_Room_Start(); // Creates inactive GOBs
    NIAO_Room_Start();
    
    
    // Torches outside town fast travel entrance
    if(!is_undefined(town_name))
    {
        with(Exit)
        {
            if (open 
            &&  exitName==val(g.dm_rm[?g.town_name +dk_FastTravel+STR_Exit+'A']) 
            && !is_undefined( g.dm_rm[?goToExitName+dk_FastTravel+STR_Exit+STR_Datakey]) )
            {
                switch(g.town_name){
                default:            {_pi=global.PI_BGR3; break;}
                case STR_Rauru:     {_pi=global.PI_BGR4; break;}
                case STR_Ruto:      {_pi=global.PI_BGR4; break;}
                case STR_Saria:     {_pi=global.PI_BGR2; break;}
                case STR_Mido:      {_pi=global.PI_BGR3; break;}
                case STR_Nabooru:   {_pi=global.PI_BGR4; break;}
                case STR_Darunia:   {_pi=global.PI_BGR1; break;}
                case STR_New_Kasuto:{_pi=global.PI_BGR4; break;}
                case STR_Old_Kasuto:{_pi=global.PI_BGR3; break;}
                case STR_Bulblin:   {_pi=global.PI_BGR3; break;}
                }
                
                with(GameObject_create(xl-$C,yt-$4, TorchA,$3, -1, _pi))
                {
                    Torch_ignite();
                }
                
                break;//with(Exit)
            }
        }
    }
}















if (_ROOM_A 
&&  _SCENE_IS_RANDOMIZED )
{
    var _normal_room_is_outside = false;
    
    _count1 = ds_list_size(g.dl_niao);
    for(_i=0; _i<_count1; _i++)
    {
        _dk   = rm_name+STR_NIAO+string(_i);
        _data = dm_rm[?_dk+"_xy"];
        _ver  = dm_rm[?_dk+STR_version];
        _init = dm_rm[?_dk+"_init"];
        if(!is_undefined(_init))
        {
            if (string_pos("Cloud",script_get_name(_init)) 
            ||  string_pos("Star" ,script_get_name(_init)) )
            {
                _normal_room_is_outside = true;
                break;//_i
            }
        }
    }
    
    //if (1)//testing
    if (_normal_room_is_outside)
    {
        _xl1 = room_width;
        _yt1 = room_height;
        _xl2 = room_width;
        _yt2 = room_height;
        _exit_sides = 0;
        with(Exit)
        {
            if (side&$3)
            {
                if (side&$1)
                {
                    _xl1 = val(g.dm_rm[?exitName+STR_Spawn_x])<<3; // pc spawn xl. right exit
                    _yt1 = val(g.dm_rm[?exitName+STR_Spawn_y])<<3; // pc spawn yt. right exit
                }
                else
                {
                    _xl2 = val(g.dm_rm[?exitName+STR_Spawn_x])<<3; // pc spawn xl. right exit
                    _yt2 = val(g.dm_rm[?exitName+STR_Spawn_y])<<3; // pc spawn yt. right exit
                }
                
                _exit_sides |= side&$F;
                //_exit_sides |= side&$3;
                //if (_exit_sides&$3==$3) break;//with(Exit)
            }
        }
        
        var _BG_depth = undefined;
        var _FG_depth = undefined;
        
        _count1 = ds_list_size(g.dl_TILE_DEPTH_NAMES);
        for(_i=0; _i<_count1; _i++)
        {
            _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
            _depth      = g.dm_TILE_DEPTH[?_dk];
            _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
            if(!is_undefined(_depth) 
            && !is_undefined(_layer_name) )
            {
                if (string_pos("STRUCTURE_BGWALL01_01",_layer_name))
                {
                    _BG_depth = _depth;
                    continue;//_i
                }
            }
        }
        
        if(!is_undefined(_BG_depth))
        {
            tile_layer_delete(_BG_depth);
        }
        
        // Remove ceiling?
        if (0
        && !(_exit_sides&$8)     // if there's no up exit
        &&  _exit_sides&$3==$3 ) // if there is both a right and left exit
        {
            _count1 = ds_list_size(dl_ceiling_bottom_rc);
            for(_i=0; _i<_count1; _i++)
            {
                _tile_id = dl_ceiling_bottom_rc[|_i];
                //if (_i==0) sdm("tile_get_depth(_tile_id) "+string(tile_get_depth(_tile_id))+", _FG_depth "+string(_FG_depth));
                if (tile_exists(_tile_id))
                {
                    _depth = tile_get_depth(_tile_id);
                    //_depth = _FG_depth;
                    _x = tile_get_x(_tile_id);
                    _y = tile_get_y(_tile_id);
                    _clm = _x>>3
                    _row = _y>>3
                    for(_j=0; _j<dg_RmTile_solid_h; _j++) // each row
                    {
                        //tile_layer_find, tile_layer_delete_at, tile_get_x
                        _x = _clm<<3;
                        _y = _row<<3;
                        _tile_id = tile_layer_find(_depth, _x,_y);
                        if (_tile_id!=-1)
                        {
                            if (tile_get_top(_tile_id)<$80)
                            {
                                tile_delete_(_tile_id);
                                tile_change_1a(_depth, _x,_y, 0,0, 0,0,0); // remove solid
                                //if (dg_RmTile_solid[#_clm,_row]&TID_SOLID1)
                            }
                        }
                        else break;//_j
                        
                        _row--;
                        if (_row<0) break;//_j
                    }
                }
                /*
                _rc = dl_ceiling_bottom_rc[|_i];
                _clm = (_rc>>0)&$FF;
                _row = (_rc>>8)&$FF;
                for(_j=0; _j<dg_RmTile_solid_h; _j++) // each row
                {
                    //tile_layer_find, tile_layer_delete_at, tile_get_x
                    _x = _clm<<3;
                    _y = _row<<3;
                    _tile_id = tile_layer_find(_FG_depth, _x,_y);
                    if (_tile_id!=-1)
                    {
                        if (tile_get_top(_tile_id)<$80)
                        {
                            tile_delete_(_tile_id);
                            tile_change_1a(_FG_depth, _x,_y, 0,0, 0,0,0); // remove solid
                            //if (dg_RmTile_solid[#_clm,_row]&TID_SOLID1)
                        }
                    }
                    else break;//_j
                    
                    _row--;
                    if (_row<0) break;//_j
                }
                */
            }
            /*
            ds_list_clear(_dl1);
            while (true)
            {
                if (_yt1<=_yt2)
                {
                    _row2 = (max(0,_yt1)>>3)-1;
                    _clm1 = 0;
                    _row1 = 0;
                    _dir1 = 1;
                    _dir2 = 1;
                }
                else
                {
                    _row2 = (max(0,_yt2)>>3)-1;
                    _clm1 = rm_clms-1;
                    _row1 = 0;
                    _dir1 = -1;
                    _dir2 = 1;
                }
                
                
                _clm = _clm1;
                //_count1 = 0;
                //_clm1  = rm_clms;
                //_row1  = rm_rows;
                _clms1 = 0;
                _rows1 = 0;
                for(_i=0; _i<dg_RmTile_solid_h; _i++) // each row
                {
                    for(_j=0; _j<dg_RmTile_solid_w; _j++) // each clm
                    {
                        _rc1 = (_i<<8)|_j;
                        if (dg_RmTile_solid_h[#_j,_i]&TID_SOLID1)
                        {
                            if (_i>=dg_RmTile_solid_h-$06)
                            {
                                
                            }
                            else
                            {
                                if (ds_list_find_index(_dl1,_rc1)==-1)
                                _clm1 = min(_j,_clm1);
                                _row1 = min(_i,_row1);
                                ds_list_add(_dl1,_rc1);
                            }
                        }
                    }
                    
                    _clm += _dir1;
                }
                break;//while (true)
            }
            */
        }
    }
}
















// --------------------  CUTSCENE  ---------------------------
if (_ROOM_A 
||  _ROOM_C )
{
    cutscene = 0;
    cutscene_house_built = 0;
    
    var _DATAKEY = rm_name+STR_CutScene;
    //var _DATAKEY = scene_data_scene_name+STR_CutScene;
    _count = val(dm_spawn[?_DATAKEY+STR_Count]);
    for(_i=1; _i<=_count; _i++) // Each Cutscene obj for this rm.
    {                            _datakey = _DATAKEY+hex_str(_i);
            _obj = val(dm_spawn[?_datakey+STR_Object]);
        if (_obj)
        {
            _ver = val(dm_spawn[?_datakey+STR_Version]);
            _xl  = val(dm_spawn[?_datakey+"_x"]);
            _yt  = val(dm_spawn[?_datakey+"_y"]);
            _pi  = val(dm_spawn[?_datakey+STR_Palette+STR_Idx]);
            GameObject_create(_xl,_yt, _obj,_ver, _datakey, _pi)
        }
    }
}











// TITLE SCREEN -----------------------------------------------------
if (_ROOM_B1)
{
    counter1       = 0;
    pc_lock        = 0;
    cutscene       = 0;
    game_end_state = 0;
    f.reen         = EXIT_NAME_GAME_START;
    
    
    ds_map_clear(dm_room_history);
    
    CuccoSpell2_Option   = 1; // 
    CuccoSpell2_Acquired = 0; // 
    CuccoSpell2_Active   = 0; // 
    
    
    
    
    
    if(!instance_exists(    TitleScreen))
    {   instance_create(0,0,TitleScreen);  }
    
    with(TitleScreen)
    {
        x = HOME_X;
        y = HOME_Y;
        
        counter   = $100;
        cycle_num = 0;
        
        story_y  = TITLE_Y_START + STORY_YOFF;
        title_y  = -(story_y + Story_H);
        //title_y  = -(story_y + STORY_SPR_H);
        
        sstar_can_draw       = true;
        sstar_is_first_cycle = true;
        sstar_moveNum        = 0;
        
        cover_can_draw = true;
    }
}













// Rando item location hints
if (_ROOM_A)
{
    if (global.RandoHints_enabled 
    &&  val(f.dm_rando[?STR_Randomize+STR_Item+STR_Locations]) )
    {
        _count = val(f.dm_rando[?STR_Rando+STR_Hint+STR_Count]);
        for(_i=1; _i<=_count; _i++)
        {
            _item_id = f.dm_rando[?STR_Rando+STR_Hint+hex_str(_i)+STR_Item];
            if(!is_undefined(_item_id))
            {
                if (ds_list_find_index(dl_Spell_STR,_item_id)!=-1)
                {
                    _val = val(dm_Spell[?STR_Bit+_item_id]);
                    g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_i)+STR_Item+STR_Found] = f.spells & _val;
                }
                else
                {
                    g.dm_RandoHintsRecorder[?STR_Hint+hex_str(_i)+STR_Item+STR_Found] = item_acquired(_item_id);
                }
            }
        }
    }
}








ds_list_destroy(_dl1); _dl1=undefined;
ds_list_destroy(_dl2); _dl2=undefined;




