/// p_Room_Start()


if (DEV) sdm(" p_Room_Start()");


var _i,_j,_k, _idx, _count,_count1,_count2;
var _val, _val1,_val2,_val3;
var _str,_str1,_str2,_str3, _pos,_pos1, _pos_offset, _len1,_len2;
var _dk;
var _pal,_pal1, _pi;
var _layer_name, _depth;
var _color,_color1,_color2;
var _ci,_ci1,_ci2;
var _dungeon_num;




fall_scene_counter   = 1;
fall_scene_pal_state = 0;
fall_scene_fall_spd  = FallScene_FALL_SPD_DEF;
fall_scene_y         = fall_scene_get_y_base();


Flash_Pal_timer        = 0; // 074B. 
Flash_Bgr_timer        = 0;
SpellFlash_PC_timer    = 0;
SpellFlash_GOB_timer   = 0;
SpellReady_flash_timer = 0;


if (room!=rmB_Death) global.BackgroundColor_at_death = -1;

     if (g.room_type=="A")   global.BackgroundColor_scene = val(g.dm_rm[?g.rm_name+STR_Background_color], C_BLK1);
else if (room==rmB_GameOver) global.BackgroundColor_scene = GameOverScreen_BGR_COLOR;
else                         global.BackgroundColor_scene = C_BLK1;


if (g.room_type=="A" 
&&  global.BackgroundColor_scene!=C_BLK1 )
{
    var _qualifies = global.Halloween1_enabled;
    
    if(!_qualifies 
    &&  g.view_y_page_min==g.view_y_page_max 
    &&  g.RandoPalette_state ) // 0: Off, 1: Dungeons & PC, 2: Dungeons, PC, and 2 BGR PI random palette when enter room
    //&&  val(f.dm_rando[?STR_Randomize+STR_Palette]) )
    {
        if (global.BackgroundColor_scene==C_VLT2   // Town sky
        ||  global.BackgroundColor_scene==C_BLU2   // Encounter sky
        ||  global.BackgroundColor_scene==C_BLU4   // Old Kasuto sky
        ||  global.BackgroundColor_scene==C_PUR3 ) // Cemetery sky
        {
            _qualifies = !irandom($F);
        }
    }
    
    //if (true) // testing
    if (_qualifies)
    {
        var _INST = NIAO_create2(0,0, 3,StarSky_1_init);
        if (_INST!=noone) global.BackgroundColor_scene = C_BLK1;
    }
}



if (global.SceneRando_enabled)
{
    var _SceneRando_scene = val(f.dm_rando[?dk_SceneRando+STR_Scene+STR_Randomized+g.rm_name], g.rm_name);
    if (_SceneRando_scene!=g.rm_name)
    {
        _color = val(g.dm_rm[?_SceneRando_scene+STR_Background_color], global.BackgroundColor_scene);
        if (_color==C_BLK1) global.BackgroundColor_scene = C_BLK1;
    }
}


set_background_color(global.BackgroundColor_scene);








// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
pal_rm_def  = undefined; // the rm's default palette. pal_rm_def, pal_rm_new, pal_rm_curr  should all be equal by the end of this script.

//pal_rm_new  = undefined;        // Checked every frame. Triggers pal change if != pal_rm_curr
pal_rm_new  = "";        // Checked every frame. Triggers pal change if != pal_rm_curr
pal_rm_curr = "";        // the rm's current palette

pal_rm_file = undefined; // from .json Tiled file
pal_rm_dark = pal_rm_dark_DEFAULT;
//     pal_rm_dark     = undefined;
//var _pal_rm_dark_DEF = dg_pal_rm_dark[#0,0];








// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
var _FILE_CLEANING = g.FileCleaning01_STATE && g.room_type=="A" && g.rm_name==g.FileCleaning01_rm_name;
var _dm_pal_data_datakey = g.rm_name;

switch(g.room_type)
{
    // ------------------------
    case 'A':{
    if (_FILE_CLEANING)
    {
        _val = json_encode(g.dm_tile_file);
        pal_rm_file = get_palette_via_file_data(_val); // Get rm palette data from file
    }
    else
    {
        _dk = g.rm_name+STR_file_name+STR_Quest+hex_str(g.file_data_quest_num);
        _dk = g.dm_rm[?_dk];
        if(!is_undefined(_dk))
        {
            pal_rm_file = dm_scene_palette[?_dk+dk_BGR];
            //sdm(""); sdm("pal_rm_file: "+pal_rm_file); sdm("");
            _pal = f.dm_rando[?g.rm_name+STR_Palette];
            if(!is_undefined(pal_rm_file) 
            && !is_undefined(_pal) )
            {
                _len1 = string_length(pal_rm_file);
                _len2 = string_length(_pal);
                     if (_len1>_len2) _pal += string_copy(pal_rm_file, _len2+1, _len1-_len2);
                else if (_len1<_len2) _pal  = string_copy(_pal, 1, _len1);
                pal_rm_file = _pal;
                //sdm(""); sdm("pal_rm_file: "+pal_rm_file); sdm("");
            }
        }
        
        if (is_undefined(pal_rm_file))
        {
            pal_rm_file = get_palette_via_file_data(0, g.rm_name, g.file_data_quest_num); // Get rm palette data from file
        }
    }
    break;}
    
    
    
    
    // ------------------------
    case 'B':{ // For rmB, TitleScreen is the only one w/ a Tiled file currently(2021/09/09).
    if (room==rmB_Title)
    {
        _dk = "Title_000";
        pal_rm_file = dm_scene_palette[?_dk+dk_BGR];
        
        if (is_undefined(pal_rm_file) 
        ||  _FILE_CLEANING )
        {
            if (_FILE_CLEANING) _val = json_encode(g.dm_tile_file);
            else                _val = 0;
            pal_rm_file = get_palette_via_file_data(_val, _dk, g.file_data_quest_num); // Get rm palette data from file
        }
    }
    else
    {
        _dm_pal_data_datakey = room_get_name(room);
    }
    break;}
    
    
    
    
    // ------------------------
    case 'C':{ // Overworld
    pal_rm_def = OW_PAL;
    break;}
}








if (is_undefined(pal_rm_def))
{
    if(!is_undefined(pal_rm_file))
    {
        // TODO: This assumes the current palette index order will always be the same. Dev a system that can handle any order.
        // GUI, PC, CUCCO
        pal_rm_def  = PAL_SET2;
        
        // BGR
        _count1 = val(global.dm_pi[?"BGR"+STR_Count]) * global.PAL_CHAR_PER_PAL;
        pal_rm_def += string_copy(pal_rm_file, 1, _count1); // BGR
        
        // MOB
        _val1 = dm_scene_palette[?g.rm_name+dk_MOB];
             if(!is_undefined(_val1))     pal_rm_def += _val1;
        else if (g.area_name==Area_TownA) pal_rm_def += PAL_NPC_SET1;
        else if (g.area_name==Area_TownB) pal_rm_def += PAL_NPC_SET2;
        else if (g.dungeon_num)           pal_rm_def += PAL_MOB_SET2;
        else                              pal_rm_def += PAL_MOB_SET1;
        
        // dark
        pal_rm_def += pal_rm_dark;
    }
    else
    {
        pal_rm_def  = val(dm_pal_data[?_dm_pal_data_datakey], pal_rm_DEFAULT);
        pal_rm_def += pal_rm_dark;
    }
}










// Temporary fix to avoid updating all Tiled files:
// Because ZALiA is widescreen, there are a lot more pixels on the screen compared to OG.
// This makes the screen much brighter when a background is using brighter color. 
// The following code changes the color a dungeon's background wall to 
// the darkest tone of the color it's using.
if (g.room_type=="A" 
&&  g.dungeon_num 
&&  g.dungeon_num<8 )
{
    _count = ds_list_size(g.dl_TILE_DEPTH_NAMES);
    for(_i=0; _i<_count; _i++)
    {
        _dk = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
        //if(!string_pos("BG",_dk)) break;//_i
        _depth      = g.dm_TILE_DEPTH[?_dk];
        _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
        if(!is_undefined(_depth) 
        && !is_undefined(_layer_name) 
        &&  string_pos("STRUCTURE_BGWALL01_01",_layer_name) ) // use "STRUCTURE_BGWALL01_02" in the layer name if you don't want this run
        {
            _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
            if (_idx!=-1)
            {
                _pi = global.PI_BGR4;
                dg_depth_pi[#_idx,0] = _pi; // pi default
                dg_depth_pi[#_idx,1] = _pi; // pi current
                dg_depth_pi[#_idx,2] = 0;   // permut default. 00-05
                dg_depth_pi[#_idx,3] = 0;   // permut current. 00-05
                
                
                _dungeon_num = val(f.dm_rando[?g.rm_name+STR_Dungeon+STR_Num], g.dungeon_num);
                switch(_dungeon_num){
                default:{_color=C_GRY4; break;}
                case  1:{_color=C_GRY4; break;}
                case  2:{_color=C_CYN4; break;}
                case  3:{_color=C_ORG4; break;}
                case  4:{_color=C_PUR4; break;}
                case  5:{_color=C_GRB4; break;}
                case  6:{_color=C_ORG4; break;}
                case  7:{_color=C_ORG4; break;}
                }//switch(_dungeon_num)
                
                _color = color_str(_color);
                pal_rm_def = strReplaceAt(pal_rm_def, get_pal_col_pos(_pi,"B"), string_length(_color), _color);
            }
        }
    }
}








if (room!=rmB_Title 
&&  room!=rmB_FileSelect )
{
    if (g.RandoPalette_state) // 0: Off, 1: Dungeons & PC, 2: Dungeons, PC, and 2 BGR PI random palette when enter room
    {
        if (g.room_type=="A")
        {
            if (g.dungeon_num 
            ||  g.RandoPalette_state==2 ) // 0: Off, 1: Dungeons & PC, 2: Dungeons, PC, and 2 BGR PI random palette when enter room
            {
                _pal = f.dm_rando[?STR_Palette+STR_Rando+g.rm_name];
                if(!is_undefined(_pal))
                {
                    pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_BGR1), string_length(_pal), _pal);
                    //sdm(g.rm_name+": "+_pal); sdm("");
                    if (g.dungeon_num)
                    {
                        var _solid_wall_pi_pos = get_pal_pos(global.PI_BGR1);
                        
                        var _dl_TILE_DEPTH_NAMES_COUNT = ds_list_size(g.dl_TILE_DEPTH_NAMES);
                        for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                        {
                            _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                            _depth      = g.dm_TILE_DEPTH[?_dk];
                            _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                            if(!is_undefined(_depth) 
                            && !is_undefined(_layer_name) 
                            &&  string_pos("STRUCTURE_FGWALL01_01",_layer_name) ) // use "STRUCTURE_BGWALL01_02" in the layer name so this doesn't run
                            {
                                _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                                if (_idx!=-1)
                                {
                                    _pi = dg_depth_pi[#_idx,1];
                                    _solid_wall_pi_pos = get_pal_pos(_pi);
                                    break;//_i
                                }
                            }
                        }
                        
                        
                        for(_i=0; _i<_dl_TILE_DEPTH_NAMES_COUNT; _i++)
                        {
                            _dk         = g.dl_TILE_DEPTH_NAMES[|_i]; // "BG01, BG02, ..."
                            _depth      = g.dm_TILE_DEPTH[?_dk];
                            _layer_name = g.dm_tile_file[? _dk+STR_Depth+STR_Layer+STR_Name];
                            if(!is_undefined(_depth) 
                            && !is_undefined(_layer_name) 
                            &&  string_pos("STRUCTURE_BGWALL01_01",_layer_name) ) // use "STRUCTURE_BGWALL01_02" in the layer name if you dont want this to run
                            {
                                _idx = ds_list_find_index(g.dl_TILE_DEPTHS,_depth);
                                if (_idx!=-1)
                                {
                                    _pi  = dg_depth_pi[#_idx,1]; // pi for bgr wall
                                    _pos = get_pal_pos(_pi);
                                    
                                    var _COLOR_DATA1 = string_copy(pal_rm_def, _solid_wall_pi_pos+(global.PAL_CHAR_PER_COLOR*1), global.PAL_CHAR_PER_COLOR); // 2nd to last color, mid-tone, base color
                                    var _COLOR_DATA2 = string_copy(pal_rm_def, _solid_wall_pi_pos+(global.PAL_CHAR_PER_COLOR*2), global.PAL_CHAR_PER_COLOR); // last color, and last 2 str chars of a palette
                                    
                                    // If the mid-tone (_ci_) IS black, make the bgr wall full black to contrast the fgr wall
                                    if (_COLOR_DATA1!=color_str(C_BLK1))
                                    {
                                        if (_COLOR_DATA2==color_str(C_BLK1)) _color = str_hex(_COLOR_DATA1);
                                        else                                 _color = str_hex(_COLOR_DATA2);
                                        
                                        if (_color==C_WHT0 
                                        ||  _color==C_RED0 
                                        ||  _color==C_BLU0 
                                        ||  _color==C_GRN0 
                                        ||  _color==C_YLW0 
                                        ||  _color==C_MGN0 
                                        ||  _color==C_BLK0 
                                        ||  _color==C_CYN0 )
                                        {
                                            _color = C_BLK1;
                                        }
                                        //if (ds_list_find_index(dl_COLOR,str_hex(_color_data))>=$40) _color_data = color_str(C_BLK1); // temp fix for new colors
                                        
                                        _pos += global.PAL_CHAR_PER_COLOR*2;
                                        
                                        if (_color!=C_BLK1)
                                        {
                                            // find the color with the closest hue out of `dl_colors_s`
                                            _val1 = colour_get_hue(_color);
                                            _val2 = $FF; // hue difference
                                            for(_j=ds_list_size(dl_colors_s)-1; _j>=0; _j--)
                                            {
                                                _val3 = colour_get_hue(dl_colors_s[|_j]);
                                                _val3 = abs(_val3-_val1);
                                                if (_val3<_val2) // if hue diff _val3 < hue diff _val2
                                                {
                                                    _val2 = _val3;
                                                    _color = dl_colors_s[|_j];
                                                }
                                            }
                                        }
                                        _pal1 = color_str(_color);
                                        /*
                                        _pos += global.PAL_CHAR_PER_COLOR*2;
                                        _pal1 = color_str(_color);
                                        
                                        if (_color_data!=C_BLK1)
                                        {
                                            _color_data = ds_list_find_index(dl_COLOR,str_hex(_color_data));
                                            _color_data = hex_str(_color_data);
                                            _val1 = string_char_at(_color_data,2);
                                                 if (isVal(_val1,"0","D"))     _pal1 = CI_GRY4_; // CI_GRY4_: darkest grey. if white or grey
                                            else if (isVal(_val1,"9","A","B")) _pal1 = CI_GRB4_; // CI_GRB4_: darkest green tone
                                            else if (isVal(_val1,"5","6","7")) _pal1 = CI_ORG4_; // CI_ORG4_: darkest red tone
                                            else if (isVal(_val1,"1","2"))     _pal1 = CI_VLT4_; // CI_VLT4_: darkest blue/purple tone
                                            else                               _pal1 = "0"+_val1; // use darkest of this color
                                        }
                                        _pal1 = color_str(dl_COLOR[|str_hex(_pal1)]);
                                        */
                                    }
                                    else
                                    {
                                        _pal1 = build_pal(C_BLK1,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2);
                                    }
                                    
                                    
                                    pal_rm_def = strReplaceAt(pal_rm_def, _pos, string_length(_pal1), _pal1);
                                    break;//_i
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
        // PC Palette ----------------------------------------------------------------------
        _pal = f.dm_rando[?STR_Palette+"_PC"+"01"];
        if(!is_undefined(_pal))
        {
            pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_PC1), string_length(_pal), _pal);
        }
        
        // Cucco Palette ----------------------------------------------------------------------
        _pal = f.dm_rando[?STR_Palette+STR_Cucco+"01"];
        if(!is_undefined(_pal))
        {
            pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_CUCCO1), string_length(_pal), _pal);
        }
    }
    
    
    _idx = val(g.pc.dm_skins[?STR_Current+STR_Idx]);
    _pal = get_pc_skin_palette(_idx);
    pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_PC1), string_length(_pal), _pal);
    //if (g.AltDungeonTiles_TEST1 && g.room_type=="A" && isVal(g.dungeon_num,1)) pal_rm_def = strReplaceAt(pal_rm_def,get_pal_pos(PI_BGR_1)+2, 6,CI_PUR2_+CI_PUR3_+CI_CYN4_); // Testing
}



















// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// pal_rm_dark_idx == -1: Means this rm is NOT a dark rm
pal_rm_dark_idx = val(g.dm_rm[?g.rm_name+STR_Dark_Room], -1);
pal_rm_dark_idx = clamp(pal_rm_dark_idx, -1, ds_grid_width(dg_pal_rm_dark)-1);


if(!is_undefined(pal_rm_def) 
&&  pal_rm_dark_idx+1 
&&  g.rm_brightness<g.RM_BRIGHTNESS_MAX )
{
    _idx = clamp(g.rm_brightness, 0, ds_grid_height(dg_pal_rm_dark)-1);
    pal_rm_dark = dg_pal_rm_dark[#pal_rm_dark_idx, _idx];
    
    pal_rm_def  = string_copy(pal_rm_def, 1,global.PAL_CHAR_PER_SET);
    pal_rm_def += pal_rm_dark;
    //sdm("g.rm_name "+g.rm_name+". pal_rm_dark_idx "+string(pal_rm_dark_idx)+", _idx "+string(_idx));
}




// ------------------------------------------------------------------------------------------
// Make sure pal_rm_def has the correct number of chars.
var _LEN1 = string_length(pal_rm_def);
if (_LEN1<global.PAL_CHAR_PER_SCENE)
{
    pal_rm_def += string_repeat("0", global.PAL_CHAR_PER_SCENE-_LEN1);
}
else
{
    pal_rm_def  = string_copy(pal_rm_def, 1,global.PAL_CHAR_PER_SCENE);
}




// ------------------------------------------------------------------------------------------
if (global.Halloween1_enabled 
&&  g.room_type=="A" )
{
    if (g.town_name==STR_Rauru 
    ||  g.town_name==STR_Ruto 
    ||  g.town_name==STR_Saria 
    ||  g.town_name==STR_Mido 
    ||  g.town_name==STR_Nabooru 
    ||  g.town_name==STR_Darunia 
    ||  g.town_name==STR_New_Kasuto 
    ||  g.town_name==STR_Old_Kasuto )
    {
        _pal = 0;
        var _mob_pal  = build_pal(C_VLT1,C_VLT2,C_YLW4,C_BLK1,-2,-2,-2,-2); // MOB ORG
            _mob_pal += build_pal(C_VLT1,C_ORG3,C_BLK1,C_BLK1,-2,-2,-2,-2); // MOB RED
            _mob_pal += build_pal(C_RED3,C_ORG4,C_BLK1,C_BLK1,-2,-2,-2,-2); // MOB BLU
            _mob_pal += build_pal(C_VLT1,C_PNK3,C_BLK1,C_BLK1,-2,-2,-2,-2); // MOB PUR
        //
        if (val(g.dm_rm[?g.rm_name+STR_Town+STR_House]))
        {
            _pal  = build_pal(C_BLU4,C_VLT4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
            _pal += build_pal(C_VLT3,C_BLK1,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
            _pal += build_pal(C_BLU3,C_MGN4,C_YLW4,C_BLK1,-2,-2,-2,-2); // BG3
            _pal += build_pal(C_YLW1,C_YGR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
        }
        else if (val(g.dm_rm[?g.rm_name+STR_Town+STR_Outside]))
        {
            switch(g.town_name)
            {
                default:{
                _pal = 0;
                _mob_pal = 0;
                break;}
                case STR_Rauru:{
                _pal  = build_pal(C_ORG1,C_YLW3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_PUR3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_BLK1,C_ORG3,C_YLW4,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_BLU2,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Ruto:{
                _pal  = build_pal(C_ORG4,C_BLK1,C_GRY4,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_GRY2,C_YLW3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_GRY2,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_VLT4,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Saria:{
                _pal  = build_pal(C_GRY3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_CYN3,C_VLT4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_GRY2,C_CYN4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_RED2,C_RED4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Mido:{
                _pal  = build_pal(C_YLW3,C_YLW4,C_PUR2,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_GRN1,C_GRN3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_YLW4,C_GRN3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_VLT4,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Nabooru:{
                _pal  = build_pal(C_ORG1,C_YLW3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_PUR3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_GRN3,C_YGR4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_BLU2,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Darunia:{
                _pal  = build_pal(C_YLW3,C_PUR4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_VLT2,C_CYN4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_ORG1,C_ORG3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_PNK3,C_YLW4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_New_Kasuto:{
                _pal  = build_pal(C_ORG3,C_ORG4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_YLW3,C_YLW4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_GRY3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_BLU2,C_PUR3,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                break;}
                case STR_Old_Kasuto:{
                _pal  = build_pal(C_GRY3,C_GRY4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG1
                _pal += build_pal(C_CYN3,C_VLT4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG2
                _pal += build_pal(C_GRY2,C_CYN4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG3
                _pal += build_pal(C_RED2,C_RED4,C_BLK1,C_BLK1,-2,-2,-2,-2); // BG4
                _mob_pal = 0;
                break;}
            }//switch(g.town_name)
        }
        else
        {
            _mob_pal = 0;
        }
        
        if (_pal!=0)     pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_BGR1),    string_length(_pal),_pal);
        if (_mob_pal!=0) pal_rm_def = strReplaceAt(pal_rm_def, get_pal_pos(global.PI_MOB_ORG), string_length(_mob_pal),_mob_pal);
    }
}







// These are here, instead of the create events, because the objects are in the room assets causing their create events to call before `p_Room_Start()`
switch(room)
{
    case rmB_Title:{
    break;}//case rmB_Title
    
    case rmB_FileSelect:{
    break;}//case rmB_FileSelect
    
    case rmB_NextLife:{
    break;}//case rmB_NextLife
    
    case rmB_Death:{
    break;}//case rmB_Death
    
    case rmB_GameOver:{
    _pal = build_pal(C_WHT1,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2);
    pal_rm_def = strReplaceAt(pal_rm_def, PAL_POS_MOB2, string_length(_pal), _pal); // PAL_POS_MOB2: MOB RED
    break;}//case rmB_GameOver
    
    case rmB_ContinueSave:{
    _pal = build_pal(C_RED2,C_RED3,C_BLK1,C_BLK1,-2,-2,-2,-2);
    pal_rm_def = strReplaceAt(pal_rm_def, PAL_POS_BGR1, string_length(_pal), _pal);
    break;}//case rmB_ContinueSave
}//switch(room)








global.spell_unaffordable_pi = add_pi_permut(global.PI_GUI1, "BWRGKYMC", "spell unaffordable");
global.spell_futile_pi       = add_pi_permut(global.PI_GUI1, "RBWGMKYC", "spell futile");


_idx = -1;
ds_grid_resize(dg_FallScene_PI, (++_idx)+1, FallScene_CLM_COUNT);
dg_FallScene_PI[#_idx,0] = add_pi_permut(FallScene_PI_BASE, "RBWGMKYC", "fall scene 1a"); // m, s, h
dg_FallScene_PI[#_idx,1] = add_pi_permut(FallScene_PI_BASE, "BWRGKYMC", "fall scene 1b"); // s, h, m
dg_FallScene_PI[#_idx,2] =               FallScene_PI_BASE; // h, m, s
//                                                      //
ds_grid_resize(dg_FallScene_PI, (++_idx)+1, FallScene_CLM_COUNT);
dg_FallScene_PI[#_idx,0] = add_pi_permut(global.PI_MOB_PUR, "RBWGMKYC", "fall scene 2a"); // m, s, h
dg_FallScene_PI[#_idx,1] = add_pi_permut(global.PI_MOB_PUR, "BWRGKYMC", "fall scene 2b"); // s, h, m
dg_FallScene_PI[#_idx,2] =               global.PI_MOB_PUR; // h, m, s








// ------------------------------------------------------------------------------------------
pal_rm_def = change_pal( pal_rm_def);
pal_rm_def = string_copy(pal_rm_def, 1, global.PAL_CHAR_PER_SCENE);
// ------------------------------------------------------------------------------------------




