/// Rando_randomize_items()


//.........................................................
random_set_seed(Rando_SEED);
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''


var _i,_j,_k,_m, _idx, _val;
var _count,_count1,_count2;
var _loc_num,_loc_num1,_loc_num2, _loc_cat,_loc_cat1;
var _qual_loc_count1,_qual_loc_count2;
var _is_item, _is_key;
var _item_id, _item_num, _key_id, _spell_id, _rm_name, _town_name, _spell_name;
var _something_was_placed = false;
var _rando_step=0;

placement_num=0;

CONTAINER_METHOD=3;

CONTROL_ALLKEY=2;
ALLKEY_LOC_NUM=0;
if (CONTROL_ALLKEY==1) var _ALLKEY_RANDOM_VALUE=irandom(99);
else                   var _ALLKEY_RANDOM_VALUE=0;

var _dm = ds_map_create();

dl_qualified_locations = ds_list_create();
dl_qualified_locations_old = ds_list_create(); // 
dl_qualified_locations_new = ds_list_create(); // 

dl_loc_cats = ds_list_create(); // Location Categories
dl_loc_num_options = ds_list_create(); // 

dl_prog1 = ds_list_create();
dl_prog2 = ds_list_create();


dm_spell_quest = ds_map_create();
//dm_spell_quest[?STR_Spell+STR_Scene+STR_Name+STR_Rauru] = 


FallingKey_LOC_NUM = val(dm_LOCATIONS[?FallingKey_ITEM_ID+STR_Location+STR_Num], FallingKey_LOC_NUM);
FallingKey_LOC_ID  = val(dm_LOCATIONS[?hex_str(FallingKey_LOC_NUM)+STR_Location+STR_ID], "undefined");
//sdm("FallingKey_LOC_NUM "+hex_str(FallingKey_LOC_NUM)+", FallingKey_RM_NAME: "+FallingKey_RM_NAME+", FallingKey_LOC_ID: "+FallingKey_LOC_ID+", FallingKey_KEY_ID: "+FallingKey_KEY_ID);



// if certain towns have a progression spell, 
// the quest item should be in pool A, 
// otherwise put the item in pool B.
            dl_prog_spells=ds_list_create();
ds_list_add(dl_prog_spells, STR_JUMP,STR_FAIRY,STR_FIRE,STR_REFLECT,STR_ENIGMA,STR_THUNDER);
if (QUEST_NUM==2) ds_list_add(dl_prog_spells, STR_SUMMON);

for(_i=ds_list_size(dl_spell_sequence_spells)-1; _i>=0; _i--)
{
    _spell_name =   dl_spell_sequence_spells[|_i];
    //sdm("seq spell: "+_spell_name);
    if (ds_list_find_index(dl_prog_spells,_spell_name)==-1)
    {   ds_list_add(       dl_prog_spells,_spell_name);  }
}



//sdm("ItemLocations_RANDO_METHOD: "+string(ItemLocations_RANDO_METHOD));



dl_remaining_keys = ds_list_create();
ds_list_copy(dl_remaining_keys,dl_KEYS);
if (KeyLocations_WILL_RANDOMIZE)
{
    ds_list_shuffle(dl_remaining_keys);
}








// ItemPool_A: Progression items
            dl_ItemPool_A = ds_list_create();
ds_list_add(dl_ItemPool_A, STR_CANDLE);
ds_list_add(dl_ItemPool_A, STR_GLOVE);
ds_list_add(dl_ItemPool_A, STR_RAFT);
ds_list_add(dl_ItemPool_A, STR_BOOTS);
ds_list_add(dl_ItemPool_A, STR_FLUTE);
ds_list_add(dl_ItemPool_A, STR_CROSS);
ds_list_add(dl_ItemPool_A, STR_HAMMER);
ds_list_add(dl_ItemPool_A, STR_BRACELET);
ds_list_add(dl_ItemPool_A, STR_BOOK);
ds_list_add(dl_ItemPool_A, STR_RFAIRY); // The Mido fairy gives a reward if you have Rescue Fairy.
//                                                      //
ds_list_add(dl_ItemPool_A, STR_NOTE);

if(!KeyLocations_WILL_RANDOMIZE)
{
    switch(CONTROL_ALLKEY){
    case 0:{                            ds_list_add(dl_ItemPool_A, STR_ALLKEY); break;}
    case 1:{if (_ALLKEY_RANDOM_VALUE<2) ds_list_add(dl_ItemPool_A, STR_ALLKEY); break;}
    }
}


                          _item_id=STR_TROPHY;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Ruto;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_MIRROR;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Saria;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_FLOWER;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Mido;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
                          _item_id=STR_CHILD;
dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Darunia;
ds_list_add(dl_ItemPool_A,_item_id);
//                                                                  //
if (QUEST_NUM==2)
{                             _item_id=STR_MASK;
    dm_spell_quest[?          _item_id+STR_Town+STR_Name] = STR_Bulblin;
    ds_list_add(dl_ItemPool_A,_item_id);
}
//                                                                  //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
//                                                      //
            dl_ItemPool_B = ds_list_create();
ds_list_add(dl_ItemPool_B, STR_MEAT);
ds_list_add(dl_ItemPool_B, STR_SHIELD);
ds_list_add(dl_ItemPool_B, STR_RING);
ds_list_add(dl_ItemPool_B, STR_PENDANT);
ds_list_add(dl_ItemPool_B, STR_SWORD);
ds_list_add(dl_ItemPool_B, STR_MAP1);
ds_list_add(dl_ItemPool_B, STR_MAP2);
if (QUEST_NUM==2 && INCLUDE_BOTTLE_LOCATION) ds_list_add(dl_ItemPool_B, STR_BOTTLE);
                                           _a=$01;
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
if (QUEST_NUM==1) ds_list_add(dl_ItemPool_B, STR_1UP+hex_str(_a++));
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
//                                                      //
for(_i=f.CONT_MIN_HP+1; _i<=f.CONT_MAX_HP; _i++)
{
    for(_j=1; _j<=f.CONT_PIECE_PER_HP; _j++)
    {
        ds_list_add(dl_ItemPool_B, STR_HEART+hex_str(_i)+hex_str(_j));
    }
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
for(_i=f.CONT_MIN_MP+1; _i<=f.CONT_MAX_MP; _i++)
{
    for(_j=1; _j<=f.CONT_PIECE_PER_MP; _j++)
    {
        ds_list_add(dl_ItemPool_B, STR_MAGIC+hex_str(_i)+hex_str(_j));
    }
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));
//                                                      //
//                                                      //
if (ItemLocations_INCLUDE_PBAG)
{
                 _count = ds_list_size(dl_PBAGS);
    for(_i=0; _i<_count; _i++) ds_list_add(dl_ItemPool_B,dl_PBAGS[|_i]);
}
//sdm("ds_list_size(dl_ItemPool_B): $"+hex_str(ds_list_size(dl_ItemPool_B)));










// -----------------------------------------------------------
                dl_ItemPool_C = ds_list_create();
ds_list_copy(   dl_ItemPool_C, dl_ItemPool_B);
ds_list_shuffle(dl_ItemPool_C);


ds_list_copy(   dl_prog1, dl_ItemPool_A);
ds_list_shuffle(dl_prog1);





if (CONTROL_ALLKEY==1 
&& !KeyLocations_WILL_RANDOMIZE 
&&  ds_list_find_index(dl_ItemPool_A,STR_ALLKEY)==-1 )
{
    if (_ALLKEY_RANDOM_VALUE<8)
    {
        ds_list_add(dl_ItemPool_A,STR_ALLKEY);
        
        _count  = ds_list_size(dl_prog1);
        _count1 = _count div 3;
        _idx    = _count-2;
        _idx   -= _count1;
        _idx=irandom_range(_idx, _idx+_count1);
        ds_list_insert(dl_prog1, _idx, STR_ALLKEY);
    }
}
//if (DEBUG){debug_str="Item pools set."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}














// -----------------------------------------------------------
// A location that doesn't require anything else to obtain the item at it once in its room
SafeLocation_LOC_NUM = -1;
/* // *** I don't think this is actually necessary..
if (ds_list_size(    dl_SAFE_LOCATION_NUMS)){
    ds_list_shuffle( dl_SAFE_LOCATION_NUMS);
SafeLocation_LOC_NUM=dl_SAFE_LOCATION_NUMS[|0];
}*/



// -----------------------------------------------------------
ds_list_clear(dl_locations_remaining);

for(_i=ds_list_size(dl_item_location_NUMS)-1; _i>=0; _i--)
{
        _loc_num =  dl_item_location_NUMS[|_i];
    if (_loc_num!=SafeLocation_LOC_NUM)
    {
        if(!KeyLocations_WILL_RANDOMIZE 
        ||  _loc_num != val(dm_LOCATIONS[?STR_ALLKEY+STR_Location+STR_Num]) )
        {
            ds_list_add(dl_locations_remaining, _loc_num);
        }
    }
}

if (ItemLocations_INCLUDE_PBAG)
{
    for(_i=ds_list_size(dl_pbag_location_NUMS)-1; _i>=0; _i--)
    {
            _loc_num =  dl_pbag_location_NUMS[|_i];
        if (_loc_num!=SafeLocation_LOC_NUM)
        {   ds_list_add(dl_locations_remaining, _loc_num);  }
    }
}

if (KeyLocations_WILL_RANDOMIZE)
{
    for(_i=ds_list_size(dl_key_location_NUMS)-1; _i>=0; _i--)
    {
            _loc_num =  dl_key_location_NUMS[|_i];
        if (_loc_num!=  FallingKey_LOC_NUM 
        &&  _loc_num!=SafeLocation_LOC_NUM )
        {   ds_list_add(dl_locations_remaining, _loc_num);  }
    }
}


ds_list_shuffle(dl_locations_remaining);

//if (DEBUG){debug_str="dl_locations_remaining set."; sdm(debug_str); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)]=debug_str;}







// -----------------------------------------------------------
if (DEBUG){
debug_str  =      "Remaining Locations"+" COUNT $"+hex_str(ds_list_size(dl_locations_remaining));
debug_str += ", "+"Remaining Items"    +" COUNT $"+hex_str(ds_list_size(dl_prog1)+ds_list_size(dl_ItemPool_C));
debug_str += ", "+"Remaining Keys"     +" COUNT $"+hex_str(ds_list_size(dl_remaining_keys));
repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
sdm(debug_str);    dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = debug_str;
//repeat(1){sdm(""); dm_debug_data[?STR_Data+'01'+hex_str(++debug_data_count)] = "";}
}




// -----------------------------------------------------------
if(!ds_list_size(dl_locations_remaining))
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if(0){
_count=ds_list_size(dl_prog1);
for(_i=0; _i<_count; _i++) sdm("dl_prog1[|$"+hex_str(_i)+"] = "+dl_prog1[|_i]);
sdm("");
}






Rando_randomize_items_1();
//if (isVal(ItemLocations_RANDO_METHOD,1,2)) Rando_randomize_items_1();
//else                                       Rando_randomize_items_2();








// Scene outside of Fire-Vines Cave
dm_save_data[?Area_WestA+"40"+STR_file_name+STR_Quest+hex_str(QUEST_NUM)] = "WestA_"+"002";










// ==============================================================================
ds_map_destroy(_dm); _dm=undefined;

ds_list_destroy(dl_remaining_keys); dl_remaining_keys=undefined;
ds_list_destroy(dl_qualified_locations); dl_qualified_locations=undefined;
ds_list_destroy(dl_qualified_locations_old); dl_qualified_locations_old=undefined;
ds_list_destroy(dl_qualified_locations_new); dl_qualified_locations_new=undefined;

ds_list_destroy(dl_prog1); dl_prog1=undefined;
ds_list_destroy(dl_prog2); dl_prog2=undefined;

ds_list_destroy(dl_prog_spells); dl_prog_spells=undefined;
ds_map_destroy(dm_spell_quest); dm_spell_quest=undefined;

ds_list_destroy(dl_loc_cats); dl_loc_cats=undefined;
ds_list_destroy(dl_loc_num_options); dl_loc_num_options=undefined;




