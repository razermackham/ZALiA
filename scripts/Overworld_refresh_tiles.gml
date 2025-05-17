/// Overworld_refresh_tiles(ow x, ow y)


var _i,_j, _x,_y;
var _ow_clm, _ow_row;
var _tile_data;



if (g.anarkhyaOverworld_MAIN 
&&  g.anarkhyaOverworld_enabled )
{
    tile_layer_delete(anarkhya_TILE_DEPTH1);
    tile_layer_delete(anarkhya_TILE_DEPTH2);
    
    for(_i=0; _i<DRAW_ROWS; _i++) // each row
    {
        for(_j=0; _j<DRAW_CLMS; _j++) // each clm
        {
            _x = _j<<SHIFT;
            _y = _i<<SHIFT;
            
            _ow_clm = (argument0+_x)>>SHIFT;
            _ow_row = (argument1+_y)>>SHIFT;
            
            
            // MAIN layer
                _tile_data = dg_anarkhya_tsrc[#_ow_clm,_ow_row];
            if (_tile_data!=0)
            {
                Overworld_tile_change_3(_tile_data, _x,_y, anarkhya_TILE_DEPTH1, 0);
            }
            
            // DETAILS layer
                _tile_data = dg_anarkhya_tsrc_detail[#_ow_clm,_ow_row];
            if (_tile_data!=0)
            {
                Overworld_tile_change_3(_tile_data, _x,_y, anarkhya_TILE_DEPTH2, 0);
            }
        }
    }
}
else
{
    var _val;
    var _ts, _tsrc0, _tid;
    var _scale_x,_scale_y;
    
    tile_layer_delete_(Tile_DEPTH1);
    
    for(_i=0; _i<DRAW_ROWS; _i++) // each row
    {
        for(_j=0; _j<DRAW_CLMS; _j++) // each clm
        {
            _x = _j<<SHIFT;
            _y = _i<<SHIFT;
            
            _ow_clm = (argument0+_x)>>SHIFT;
            _ow_row = (argument1+_y)>>SHIFT;
            
            _scale_x = 1;
            _scale_y = 1;
            
            _tile_data = dg_tsrc[#_ow_clm,_ow_row];
            
            if (RandoTSRC_active)
            {
                _val = dm_Rando_TSRC[?hex_str(_tile_data)];
                if(!is_undefined(_val)) _tile_data = (_val>>2)<<2;
            }
            
            _tsrc0 = _tile_data&$FF;
            
            
            if (g._YxY_)
            {
                if (_tsrc0==TSRC_TREE01 
                ||  _tsrc0==TSRC_TREE02 
                ||  _tsrc0==TSRC_TREE03 
                ||  _tsrc0==TSRC_TREE04 
                ||  _tsrc0==TSRC_GRAS01 
                ||  _tsrc0==TSRC_GRAS02 
                ||  _tsrc0==TSRC_GRAS03 
                ||  _tsrc0==TSRC_GRAS04 
                ||  _tsrc0==TSRC_SWAM01 
                ||  _tsrc0==TSRC_SWAM02 
                ||  _tsrc0==TSRC_SWAM03 
                ||  _tsrc0==TSRC_SWAM04 
                ||  _tsrc0==TSRC_VOLC01 )
                {
                    if (irandom(1))
                    {
                        _scale_x=-1;
                        _x+=$1<<SHIFT;
                    }
                    if (irandom(1))
                    {
                        _scale_y=-1;
                        _y+=$1<<SHIFT;
                    }
                }
            }
            
            _ts = g.dl_tileset[|(_tile_data>>8)&$FF];
            _tid = tile_change_2a(T_SIZE, _ts,_tsrc0, _x,_y, Tile_DEPTH1, 0);
            dg_tid[#_j,_i] = _tid;
            
            if (tile_exists(_tid)) tile_set_scale(_tid, _scale_x,_scale_y);
            //db_Overworld_Draw_2a();
        }
    }
}




