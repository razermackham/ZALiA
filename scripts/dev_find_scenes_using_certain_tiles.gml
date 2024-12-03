/// dev_find_scenes_using_certain_tiles()


//if (keyboard_check_pressed(vk_f7))
var _i,_j,_k,_m, _count, _str, _area;
var _dl_ts_data, _dm_ts_data, _dl_tile, _dl_layer_data, _dm_layer_data, _file, _file_name,_file_name1, _file_data;
var _dm_ts_info = ds_map_create();
var _layer_count, _layer_name, _layer, _tile_count, _tile_data, _tsrc, _tsrc_found, _ts_idx;
var _dl_tsrc  = ds_list_create();
var _dl_tsrc1 = ds_list_create();

///* // Solid color tiles in ts_Man_made_1a_XXX
var _TS_NAME = "Man_made_1a_BRW";
//var _TS_NAME = "Man_made_1a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04);
//*/

/* // Lone stone texture using full green
var _TS_NAME = "Man_made_6a";
ds_list_add(_dl_tsrc,$7E);
*/

/* // Stonehenge and Crystal Holder tiles in ts_Man_made_6a_WRB
var _TS_NAME = "Man_made_1a";
ds_list_add(_dl_tsrc,$08,$09);
ds_list_add(_dl_tsrc,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F);
ds_list_add(_dl_tsrc,$3C,$3D,$3E,$3F);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F);
ds_list_add(_dl_tsrc,$AA,$AB,$AC,$AD);
*/

/* // Old dungeon tileset
var _TS_NAME = "Man_made_4a";
ds_list_add(_dl_tsrc,$00,$01,$02,$03,$04,$05,$06,$07,$08);
ds_list_add(_dl_tsrc,$20);
ds_list_add(_dl_tsrc,$40,$41,$42,$43,$44,$45);
ds_list_add(_dl_tsrc,$50,$51);
ds_list_add(_dl_tsrc,$60,$61,$62,$63,$64,$65);
ds_list_add(_dl_tsrc,$70,$71);
ds_list_add(_dl_tsrc,$80,$81,$82,$83,$84,$85);
ds_list_add(_dl_tsrc,$A0,$A1,$A2,$A3,$A4,$A5);
ds_list_add(_dl_tsrc,$B0,$B1);
ds_list_add(_dl_tsrc,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9);
ds_list_add(_dl_tsrc,$D6,$D7,$D8,$D9);
*/

repeat(2) sdm("");

var          _COUNT1 = ds_list_size(g.dl_AREA_NAME);
for(_i=0; _i<_COUNT1; _i++) // Each area
{
    _area = g.dl_AREA_NAME[|_i];
    for(_j=0; _j<$100; _j++) // Each possible file of area
    {   // file name example:  "rm_tile_data/PalcA/PalcA_003.json"
        _file_has_ts = false;
        
        _file_name1  = string_lettersdigits(_area);
        _file_name1 += "_";
        _file_name1 += string_repeat("0",_j<100);
        _file_name1 += string_repeat("0",_j<10);
        _file_name1 += string(_j);
        
        _file_name  = "rm_tile_data";
        _file_name += "/";
        _file_name += string_lettersdigits(_area);
        _file_name += "/";
        _file_name += _file_name1;
        //_file_name += string_lettersdigits(_area);
        //_file_name += "_";
        //_file_name += string_repeat("0",_j<100);
        //_file_name += string_repeat("0",_j<10);
        //_file_name += string(_j);
        _file_name += ".json";
        if(!file_exists(_file_name)) continue;//_j. to next file
        
        _file_data = "";
        _file = file_text_open_read(_file_name);
        while(!file_text_eof(_file)) _file_data += file_text_readln(_file);
        file_text_close(_file);
        _file_data  = json_decode(_file_data);
        
        _ts_idx = -1;
        
        _dl_ts_data = _file_data[?"tilesets"];
        ds_map_clear(_dm_ts_info);
                     _count = ds_list_size(_dl_ts_data);
        for(_k=0; _k<_count; _k++) // Each tileset
        {
            _dm_ts_data = _dl_ts_data[|_k];
            _str        = _dm_ts_data[?"source"];
            // _dm_ts_data[?"source"] Example: "source":"..\/..\/..\/..\/..\/..\/Tiled\/Tilesets\/Z2_Remake_1a\/ts_Natural_1a_WRB.tsx
            
            if (string_pos(_TS_NAME,_str))
            {
                _ts_idx = _k;
                break;//_k
            }
        }
        
        if (_ts_idx==-1) continue;//_j
        
        
        ds_list_clear(_dl_tsrc1);
        _dl_layer_data = val(_file_data[?"layers"]);
        _layer_count = ds_list_size(_dl_layer_data);
        
        for(_k=0; _k<_layer_count; _k++) // Each layer
        {
            _tsrc_found = false;
            _dm_layer_data = _dl_layer_data[|_k];
            _layer_name    = _dm_layer_data[?"name"];
            _layer_name    = string(_layer_name);
            
            if (string_pos("BG",_layer_name) 
            ||  string_pos("FG",_layer_name) )
            {
                if (string_pos("BG",_layer_name))
                {    _layer = string_copy(_layer_name, string_pos("BG",_layer_name), 4);  }
                else _layer = string_copy(_layer_name, string_pos("FG",_layer_name), 4);
                
                _dl_tile = _dm_layer_data[?"data"];
                _tile_count = ds_list_size(_dl_tile);
                for(_m=0; _m<_tile_count; _m++)
                {
                    _tile_data = _dl_tile[|_m];
                    if (_tile_data==0) continue; // 0 means no tile
                    
                    _tile_data--; // Tiled app adds 1 so it can't be 0
                    _tile_data &= $3FFFFFFF; // truncate the scale xy data
                    _tile_data  = abs(_tile_data);
                    
                    _tsrc = _tile_data&$FF;
                    
                    if ((_tile_data>>8)&$FF==_ts_idx 
                    &&  ds_list_find_index(_dl_tsrc, _tsrc)!=-1 
                    &&  ds_list_find_index(_dl_tsrc1,_tsrc)==-1 )
                    {
                        ds_list_add(_dl_tsrc1,_tsrc);
                    }
                }
            }
        }
        
            _count = ds_list_size(_dl_tsrc1);
        if (_count)
        {
            ds_list_sort(_dl_tsrc1,true);
            
            _str = _file_name1+": ";
            for(_k=0; _k<_count; _k++) // Each found tsrc
            {
                _str += "$"+hex_str(_dl_tsrc1[|_k])+", ";
            }
            sdm(_str);
        }
    }
}

repeat(2) sdm("");

ds_list_destroy(_dl_ts_data); _dl_ts_data=undefined;
ds_map_destroy(_dm_ts_data); _dm_ts_data=undefined;
ds_map_destroy(_dm_ts_info); _dm_ts_info=undefined;
ds_list_destroy(_dl_tsrc); _dl_tsrc=undefined;
ds_list_destroy(_dl_tsrc1); _dl_tsrc1=undefined;




