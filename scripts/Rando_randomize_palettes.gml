/// Rando_randomize_palettes()


//if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}

random_set_seed(Rando_SEED);

// Dungeons ------------------------------------------------------------------
var _i,_j, _idx, _count;
var _val,_val1,_val2;
var _scene_name;
var _dk;
var _palette;
var _pos;
var _color1,_color2,_color3;
var _C_BLK1_ = color_str(p.C_BLK1);
//                                                      //
var         _dl_colors1 = ds_list_create();
ds_list_add(_dl_colors1,color_str(p.C_BLK1));
ds_list_add(_dl_colors1,color_str(p.C_GRY4));
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$01])); // blue-violet
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$02])); // blue
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$08])); // yellow
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$09])); // yellow-green
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$0B])); // blue-green
ds_list_add(_dl_colors1,color_str(p.dl_COLORS[|$0C])); // cyan/teal
//                                                      //
var         _dl_colors2 = ds_list_create();
ds_list_add(_dl_colors2,color_str(p.C_BLK1));
ds_list_add(_dl_colors2,color_str(p.C_GRY4));
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$01])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$02])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$03])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$04])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$05])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$06])); // 
//                                                      //
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$07])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$08])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$09])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$0A])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$0B])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$0C])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$12])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$13])); // 
//                                                      //
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$17])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$18])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$19])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$1B])); // 
ds_list_add(_dl_colors2,color_str(p.dl_COLORS[|$1C])); // 
/*
var _COLORS1  = p.CI_BLK1_+p.CI_GRY4_; // darkest colors
    _COLORS1 += "0C"+"0B"+"09"+"08"+"02"+"01"; // darkest colors
var _COLORS2  = p.CI_BLK1_+p.CI_GRY4_;
    _COLORS2 += "01"+"02"+"03"+"04"+"05"+"06"+"07"+"08"+"09"+"0A"+"0B"+"0C";
    _COLORS2 +=      "12"+"13"               +"17"+"18"+"19"     +"1B"+"1C";
*/
var         _dl_DUNGEON_AREAS = ds_list_create();
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcA); // Parapa Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcB); // Midoro Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcC); // Island Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcD); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcE); // Palace on the Sea
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcF); // Hidden Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcG); // Great Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcH); // Dragmire Tower
var _dl_DUNGEON_AREAS_COUNT = ds_list_size(_dl_DUNGEON_AREAS);

var         _dl_DUNGEON_TILESETS = ds_list_create();
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonA01); // Parapa Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonB01); // Midoro Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonC01); // Island Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonD01); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonE01); // Palace on the Sea
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonF01); // Hidden Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonG01); // Great Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonH01); // Dragmire Tower



var          _dl_pals1=ds_list_create();
ds_list_copy(_dl_pals1,p.dl_various_pals1);
var          _dl_pals2=ds_list_create();
ds_list_copy(_dl_pals2,p.dl_various_pals2);

for(_i=1; _i<=_dl_DUNGEON_AREAS_COUNT; _i++) // each dungeon
{
    // Dungeon primary palette
    ds_list_shuffle(_dl_pals2);
    _val2 =         _dl_pals2[|0];
    ds_list_delete( _dl_pals2, 0);
    
    
    // Attempting to lower the brightness
    _color1 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // highlight
    _color2 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*1)+1, global.PAL_CHAR_PER_COLOR); // midtone
    _color3 = string_copy(_val2, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // shadow
    
    //if (get_color_brightness(_color2)<$40)
    if (ds_list_find_index(_dl_colors2,_color2)==-1) // if not an acceptable midtone color
    {   // Midtone
        _idx = irandom(ds_list_size(_dl_colors2)-1);
        _color2 = _dl_colors2[|_idx];
    }
    
    
    // Use darker colors if the tileset for dungeon _i is brighter because it has more highlight color pixels in the graphics
    _val = _dl_DUNGEON_TILESETS[|_i-1];
    _val = val(dm_save_data[?STR_Rando+STR_Tileset+background_get_name(_val)], _val);
    if (_val==ts_DungeonB01   // if dungeon _i will use dungeon 2 tileset
    ||  _val==ts_DungeonD01 ) // if dungeon _i will use dungeon 4 tileset
    {
        if (ds_list_find_index(_dl_colors2,_color1)==-1)
        {   // Highlight
            _idx = irandom(ds_list_size(_dl_colors2)-1);
            _color1 = _dl_colors2[|_idx];
        }
        
        if (ds_list_find_index(_dl_colors1,_color3)==-1)
        {   // Shadow
            _idx = irandom(ds_list_size(_dl_colors1)-1);
            _color3 = _dl_colors1[|_idx];
        }
        
        if (ds_list_find_index(_dl_colors1,_color1)==-1 
        &&  ds_list_find_index(_dl_colors1,_color3)==-1 )
        {   // Make sure at least one of these colors is one of the darkest colors
            _idx = irandom(ds_list_size(_dl_colors1)-1);
            if (irandom(1)) _color1 = _dl_colors1[|_idx];
            else            _color3 = _dl_colors1[|_idx];
        }
    }
    
    
    if (ds_list_find_index(_dl_colors2,_color3)==-1)
    {   // Midtone
        _idx = irandom(ds_list_size(_dl_colors2)-1);
        _color3 = _dl_colors2[|_idx];
    }
    
    
    
    
    // The main color scheme palette of the dungeon
    _val2 = build_pal(_color1,_color2,_color3,_C_BLK1_, -2,-2,-2,-2);
    //_val2 = _color1 + _color2 + _color3 + _C_BLK1_;
    
    
    // Dungeon secondary palette (the palette curtains,crystal-holder,etc.. use)
    ds_list_shuffle(_dl_pals1);
    _val1 =         _dl_pals1[|_val2==_dl_pals1[|0]];
    ds_list_delete( _dl_pals1, _val2==_dl_pals1[|0]);
    
    _palette = _val2+_val1;
    
    
    for(_j=0; _j<$100; _j++) // Each dungeon scene
    {
        _scene_name = _dl_DUNGEON_AREAS[|_i-1]+hex_str(_j);
        //if (_j<8) sdm("_scene_name "+_scene_name);
        if(!is_undefined(g.dm_rm[?_scene_name+STR_Rm+STR_Num+STR_Game]))
        {
            dm_save_data[?STR_Palette+STR_Rando+_scene_name] = _palette;
            //sdm("_scene_name "+_scene_name+", _palette "+_palette);
        }
    }
    //sdm("");
}

ds_list_destroy(_dl_pals1); _dl_pals1=undefined;
ds_list_destroy(_dl_pals2); _dl_pals2=undefined;








// PC and Cucco -----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
var _CHANCE1 = $27;
var _CHANCE2 = $01;
//var _CHANCE3=$03;
var _COLOR_pc_skin    = string_copy(p.PAL_PC_1, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // pc skin
var _COLOR_pc_outline = string_copy(p.PAL_PC_1, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // pc outline
var _COLOR_cucco_legs = string_copy(p.PAL_CUC1, (global.PAL_CHAR_PER_COLOR*0)+1, global.PAL_CHAR_PER_COLOR); // cucco legs/beak
var _COLOR_cucco_body = string_copy(p.PAL_CUC1, (global.PAL_CHAR_PER_COLOR*2)+1, global.PAL_CHAR_PER_COLOR); // cucco body

var         _dl_tunic_colors = ds_list_create(); // acceptable tunic colors
ds_list_add(_dl_tunic_colors, p.C_WHT2,p.C_GRY4,p.C_BLK1)
ds_list_add(_dl_tunic_colors, p.C_BLU2,p.C_BLU3,p.C_BLU4);
ds_list_add(_dl_tunic_colors, p.C_VLT2,p.C_VLT3,p.C_VLT4);
ds_list_add(_dl_tunic_colors, p.C_PUR2,p.C_PUR3,p.C_PUR4);
ds_list_add(_dl_tunic_colors, p.C_MGN2,p.C_MGN3,p.C_MGN4);
ds_list_add(_dl_tunic_colors, p.C_PNK2,p.C_PNK3,p.C_PNK4);
ds_list_add(_dl_tunic_colors, p.C_RED2,p.C_RED3,p.C_RED4);
ds_list_add(_dl_tunic_colors, p.C_ORG2,p.C_ORG3,p.C_ORG4);
ds_list_add(_dl_tunic_colors, p.C_YLW2,p.C_YLW3,p.C_YLW4);
ds_list_add(_dl_tunic_colors, choose(p.C_YGR2,p.C_GRN2,p.C_GRB2), choose(p.C_YGR3,p.C_GRN3,p.C_GRB3), choose(p.C_YGR4,p.C_GRN4,p.C_GRB4));
ds_list_add(_dl_tunic_colors, p.C_CYN2,p.C_CYN3,p.C_CYN4);
//ds_list_add(_dl_tunic_colors, choose(p.C_BLU1,p.C_VLT1,p.C_TEL1), choose(p.C_BLU2,p.C_VLT2,p.C_TEL2), choose(p.C_BLU3,p.C_VLT3,p.C_TEL3), choose(p.C_BLU4,p.C_TEL4));

// Limiting the number of brights because their colors aren't very distinct
var             _dl_bright_colors = ds_list_create(); // bright acceptable tunic colors
ds_list_add(    _dl_bright_colors, p.C_BLU1,p.C_VLT1,p.C_PUR1,p.C_MGN1,p.C_PNK1,p.C_RED1,p.C_ORG1,p.C_YLW1,p.C_YGR1,p.C_GRN1,p.C_GRB1,p.C_CYN1);
ds_list_shuffle(_dl_bright_colors);
ds_list_add(_dl_tunic_colors, _dl_bright_colors[|0],_dl_bright_colors[|1],_dl_bright_colors[|2],_dl_bright_colors[|3]);

ds_list_shuffle(_dl_tunic_colors);




_i=0;
_val = "";

//
_color1 = _COLOR_pc_skin;
_color2 = _COLOR_pc_outline;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_color1, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

_color1 = _COLOR_pc_skin;
_color2 = _COLOR_pc_outline;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_color1, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

_color1 = _COLOR_pc_skin;
_color2 = _COLOR_pc_outline;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_COLOR_pc_skin, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

dm_save_data[?STR_Palette+"_PC"+"01"] = _val;




_val = "";

_color1 = _COLOR_cucco_legs;
_color2 = _COLOR_cucco_body;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_color1, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

_color1 = _COLOR_cucco_legs;
_color2 = _COLOR_cucco_body;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_color1, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

_color1 = _COLOR_cucco_legs;
_color2 = _COLOR_cucco_body;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _color1 = _C_BLK1_;
    else                   _color2 = _C_BLK1_;
}
_val += build_pal(_color1, color_str(_dl_tunic_colors[|_i++]), _color2, _C_BLK1_, -2,-2,-2,-2);

dm_save_data[?STR_Palette+STR_Cucco+"01"] = _val;








ds_list_destroy(_dl_colors); _dl_colors=undefined;
ds_list_destroy(_dl_colors1); _dl_colors1=undefined;
ds_list_destroy(_dl_colors2); _dl_colors2=undefined;

ds_list_destroy(_dl_tunic_colors); _dl_tunic_colors=undefined;
ds_list_destroy(_dl_bright_colors); _dl_bright_colors=undefined;
ds_list_destroy(_dl_DUNGEON_AREAS); _dl_DUNGEON_AREAS=undefined;
ds_list_destroy(_dl_DUNGEON_TILESETS); _dl_DUNGEON_TILESETS=undefined;








/*
/// Rando_randomize_palettes()


//if (DEBUG){sdm(" "); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=" ";}

random_set_seed(Rando_SEED);

// Dungeons ------------------------------------------------------------------
var _i,_j, _count;
var _val,_val1,_val2;
var _scene_name;
var _dk;
var _palette;
var _pos;
var _color1,_color2,_color3;
var _COLORS1  = p.CI_BLK1_+p.CI_GRY4_; // darkest colors
    _COLORS1 += "0C"+"0B"+"09"+"08"+"02"+"01"; // darkest colors
var _COLORS2  = p.CI_BLK1_+p.CI_GRY4_;
    _COLORS2 += "01"+"02"+"03"+"04"+"05"+"06"+"07"+"08"+"09"+"0A"+"0B"+"0C";
    _COLORS2 +=      "12"+"13"               +"17"+"18"+"19"     +"1B"+"1C";
//
var         _dl_DUNGEON_AREAS = ds_list_create();
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcA); // Parapa Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcB); // Midoro Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcC); // Island Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcD); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcE); // Palace on the Sea
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcF); // Hidden Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcG); // Great Palace
ds_list_add(_dl_DUNGEON_AREAS,Area_PalcH); // Dragmire Tower
var _dl_DUNGEON_AREAS_COUNT = ds_list_size(_dl_DUNGEON_AREAS);

var         _dl_DUNGEON_TILESETS = ds_list_create();
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonA01); // Parapa Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonB01); // Midoro Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonC01); // Island Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonD01); // Maze Isl Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonE01); // Palace on the Sea
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonF01); // Hidden Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonG01); // Great Palace
ds_list_add(_dl_DUNGEON_TILESETS,ts_DungeonH01); // Dragmire Tower


//
var          _dl_pals1=ds_list_create();
ds_list_copy(_dl_pals1,p.dl_various_pals1);
var          _dl_pals2=ds_list_create();
ds_list_copy(_dl_pals2,p.dl_various_pals2);

for(_i=1; _i<=_dl_DUNGEON_AREAS_COUNT; _i++) // each dungeon
{
    // Dungeon primary palette
    ds_list_shuffle(_dl_pals2);
    _val2 =         _dl_pals2[|0];
    ds_list_delete( _dl_pals2, 0);
    
    
    // Attempting to lower the brightness
    _color1 = string_copy(_val2,3,2); // highlight
    _color2 = string_copy(_val2,5,2); // midtone
    _color3 = string_copy(_val2,7,2); // shadow
    
    if(!string_pos(_color2,_COLORS2)) // if not an acceptable midtone color
    {   // Midtone
        _count  = string_length(_COLORS2)>>1;
        _pos    = (irandom(_count-1)<<1)+1;
        _color2 = string_copy(  _COLORS2, _pos, 2);
    }
    
    
    // Use darker colors if the tileset for dungeon _i is brighter because it has more highlight color pixels in the graphics
    _val = _dl_DUNGEON_TILESETS[|_i-1];
    _val = val(dm_save_data[?STR_Rando+STR_Tileset+background_get_name(_val)], _val);
    if (_val==ts_DungeonB01   // if dungeon _i will use dungeon 2 tileset
    ||  _val==ts_DungeonD01 ) // if dungeon _i will use dungeon 4 tileset
    {
        if(!string_pos(_color1,_COLORS2))
        {   // Highlight
            _count  = string_length(_COLORS2)>>1;
            _pos    = (irandom(_count-1)<<1)+1;
            _color1 = string_copy(  _COLORS2, _pos, 2);
        }
        
        if(!string_pos(_color3,_COLORS1))
        {   // Shadow
            _count  = string_length(_COLORS1)>>1;
            _pos    = (irandom(_count-1)<<1)+1;
            _color3 = string_copy(  _COLORS1, _pos, 2);
        }
        
        if(!string_pos(_color1,_COLORS1) 
        && !string_pos(_color3,_COLORS1) )
        {   // Make sure at least one of these colors is one of the darkest colors
            _count  = string_length(_COLORS1)>>1;
            _pos    = (irandom(_count-1)<<1)+1;
            if (irandom(1)) _color1 = string_copy(_COLORS1, _pos, 2);
            else            _color3 = string_copy(_COLORS1, _pos, 2);
        }
    }
    
    
    if(!string_pos(_color3,_COLORS2))
    {   // Midtone
        _count  = string_length(_COLORS2)>>1;
        _pos    = (irandom(_count-1)<<1)+1;
        _color3 = string_copy(  _COLORS2, _pos, 2);
    }
    
    
    _val2  = string_copy(_val2,1,2); // 
    _val2 += _color1+_color2+_color3;
    
    
    
    
    // Dungeon secondary palette
    ds_list_shuffle(_dl_pals1);
    _val1 =         _dl_pals1[|_val2==_dl_pals1[|0]];
    ds_list_delete( _dl_pals1, _val2==_dl_pals1[|0]);
    
    _palette = _val2+_val1;
    
    
    for(_j=0; _j<$100; _j++) // Each dungeon scene
    {
        _scene_name = _dl_DUNGEON_AREAS[|_i-1]+hex_str(_j);
        //if (_j<8) sdm("_scene_name "+_scene_name);
        if(!is_undefined(g.dm_rm[?_scene_name+STR_Rm+STR_Num+STR_Game]))
        {
            dm_save_data[?STR_Palette+STR_Rando+_scene_name] = _palette;
            //sdm("_scene_name "+_scene_name+", _palette "+_palette);
        }
    }
    //sdm("");
}

ds_list_destroy(_dl_pals1); _dl_pals1=undefined;
ds_list_destroy(_dl_pals2); _dl_pals2=undefined;








// PC and Cucco ------------------------------------------------------------------
var _CHANCE1=$27;
var _CHANCE2=$01;
//var _CHANCE3=$03;

var             _dl_colors=ds_list_create();
ds_list_copy(   _dl_colors,p.dl_COLORS_USED);
ds_list_shuffle(_dl_colors);


var         _dl_TUNIC_CI=ds_list_create(); // acceptable tunic colors
ds_list_add(_dl_TUNIC_CI, p.CI_WHT2_,p.CI_GRY4_,p.CI_BLK1_)
ds_list_add(_dl_TUNIC_CI, p.CI_BLU2_,p.CI_BLU3_,p.CI_BLU4_);
ds_list_add(_dl_TUNIC_CI, p.CI_VLT2_,p.CI_VLT3_,p.CI_VLT4_);
ds_list_add(_dl_TUNIC_CI, p.CI_PUR2_,p.CI_PUR3_,p.CI_PUR4_);
ds_list_add(_dl_TUNIC_CI, p.CI_MGN2_,p.CI_MGN3_,p.CI_MGN4_);
ds_list_add(_dl_TUNIC_CI, p.CI_PNK2_,p.CI_PNK3_,p.CI_PNK4_);
ds_list_add(_dl_TUNIC_CI, p.CI_RED2_,p.CI_RED3_,p.CI_RED4_);
ds_list_add(_dl_TUNIC_CI, p.CI_ORG2_,p.CI_ORG3_,p.CI_ORG4_);
ds_list_add(_dl_TUNIC_CI, p.CI_YLW2_,p.CI_YLW3_,p.CI_YLW4_);
ds_list_add(_dl_TUNIC_CI, choose(p.CI_YGR2_,p.CI_GRN2_,p.CI_GRB2_), choose(p.CI_YGR3_,p.CI_GRN3_,p.CI_GRB3_), choose(p.CI_YGR4_,p.CI_GRN4_,p.CI_GRB4_));
ds_list_add(_dl_TUNIC_CI, p.CI_CYN2_,p.CI_CYN3_,p.CI_CYN4_);
//ds_list_add(_dl_TUNIC_CI, choose(p.CI_BLU1_,p.CI_VLT1_,p.CI_TEL1_), choose(p.CI_BLU2_,p.CI_VLT2_,p.CI_TEL2_), choose(p.CI_BLU3_,p.CI_VLT3_,p.CI_TEL3_), choose(p.CI_BLU4_,p.CI_TEL4_));

// Limiting the number of brights because their colors aren't very distinct
var _dl_BRIGHT_CI=ds_list_create(); // bright acceptable tunic colors
ds_list_add(_dl_BRIGHT_CI, p.CI_BLU1_,p.CI_VLT1_,p.CI_PUR1_,p.CI_MGN1_,p.CI_PNK1_,p.CI_RED1_,p.CI_ORG1_,p.CI_YLW1_,p.CI_YGR1_,p.CI_GRN1_,p.CI_GRB1_,p.CI_CYN1_);
ds_list_shuffle(_dl_BRIGHT_CI);
ds_list_add(_dl_TUNIC_CI, _dl_BRIGHT_CI[|0],_dl_BRIGHT_CI[|1],_dl_BRIGHT_CI[|2],_dl_BRIGHT_CI[|3]);

ds_list_shuffle(_dl_TUNIC_CI);



var _CI1 = string_copy(p.PAL_PC_1,3,2); // pc skin
var _CI2 = string_copy(p.PAL_PC_1,7,2); // pc outline
var _CI3 = string_copy(p.PAL_CUC1,3,2); // cucco legs/beak
var _CI4 = string_copy(p.PAL_CUC1,7,2); // cucco body
var _ci1 = _CI1;
var _ci2 = _CI2;

_i=0;

_ci1 = _CI1;
_ci2 = _CI2;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val  = p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

_ci1 = _CI1;
_ci2 = _CI2;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val += p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

_ci1 = _CI1;
_ci2 = _CI2;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val += p.CI_BLK1_ + _CI1 + _dl_TUNIC_CI[|_i++] + _ci2;
//_val += p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

dm_save_data[?STR_Palette+"_PC"+"01"] = _val;






_ci1 = _CI3;
_ci2 = _CI4;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val  = p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

_ci1 = _CI3;
_ci2 = _CI4;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val += p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

_ci1 = _CI3;
_ci2 = _CI4;
if(!irandom(_CHANCE1)){
    if(!irandom(_CHANCE2)) _ci1 = p.CI_BLK1_;
    else                   _ci2 = p.CI_BLK1_;
}
_val += p.CI_BLK1_ + _ci1 + _dl_TUNIC_CI[|_i++] + _ci2;

dm_save_data[?STR_Palette+STR_Cucco+"01"] = _val;


ds_list_destroy(_dl_colors); _dl_colors=undefined;
ds_list_destroy(_dl_colors1); _dl_colors1=undefined;
ds_list_destroy(_dl_colors2); _dl_colors2=undefined;

ds_list_destroy(_dl_TUNIC_CI); _dl_TUNIC_CI=undefined;
ds_list_destroy(_dl_BRIGHT_CI); _dl_BRIGHT_CI=undefined;
ds_list_destroy(_dl_DUNGEON_AREAS); _dl_DUNGEON_AREAS=undefined;
ds_list_destroy(_dl_DUNGEON_TILESETS); _dl_DUNGEON_TILESETS=undefined;
*/




