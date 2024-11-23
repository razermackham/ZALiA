/// Kakusu001_draw_1(platform idx)


var _i,_j;
var _x,_y;
var _tsrc, _ts_x,_ts_y;
if (USE_SURF)
{
    for(_i=0; _i<Platform_COUNT; _i++)
    {
        if (                  !dg_platform[#_i,SURF_IDX]      // first time
        || !surface_exists(    dg_platform[#_i,SURF_IDX]) )
        {
                               dg_platform[#_i,SURF_IDX] = surface_create($10,$10);
            surface_set_target(dg_platform[#_i,SURF_IDX]);
            
            for(_j=0; _j<4; _j++)
            {
                _tsrc =        dg_platform[#_i,TSRC_IDX];
                _tsrc = _tsrc>>(_j<<3);
                _ts_x = ((_tsrc>>0)&$F)<<3;
                _ts_y = ((_tsrc>>4)&$F)<<3;
                _x    = (_j&$1)        <<3;
                _y    = (_j>$1)        <<3;
                draw_background_part(PLATFORM_TS, _ts_x,_ts_y, 8,8, _x,_y);
            }
            surface_reset_target();
        }
    }
}
else if(!dg_platform[#0,SPR_IDX]) // First frame. Sprites NOT created yet.
{
    var _surf = surface_create($10,$10);
    surface_set_target(_surf);
    
    for(_i=0; _i<Platform_COUNT; _i++)
    {
        for(_j=0; _j<4; _j++)
        {
                      _tsrc  = dg_platform[#_i,TSRC_IDX] >>(_j<<3);
                      _tsrc &= $FF;
            _ts_x  =((_tsrc>>0)&$F)<<3;
            _ts_y  =((_tsrc>>4)&$F)<<3;
            _x     = (_j&1)        <<3;
            _y     = (_j>1)        <<3;
            draw_background_part(PLATFORM_TS, _ts_x,_ts_y, 8,8, _x,_y);
        }
        dg_platform[#_i,SPR_IDX] = sprite_create_from_surface(_surf, 0,0, $10,$10, false,false, 0,0);
    }
    
    surface_reset_target();
    surface_free(_surf);
}




