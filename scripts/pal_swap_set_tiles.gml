/// pal_swap_set_tiles(palette sprite or surface, pal index, start layer, end layer);

// Call this every step you want to draw the tiles palette swapped.  
// Stop calling it, or set the pal index to 0 to stop palette swapping.
// Does not need to be called in a draw event.  In fact, I recommend the step event.


// ------------------------------------------------------------
if(!global.use_pal_swap 
|| !argument[1] 
||  argument[1]>=global.palette_image_w )
{
    exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}

if (global.palette_image_IS_SURFACE)
{    if(!surface_exists(argument[0])) exit;  } // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
else if(!sprite_exists( argument[0])) exit;    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




// ------------------------------------------------------------
var _PALETTE_IMAGE = argument[0];
var _PALETTE_INDEX = argument[1];

argument[2]++;
argument[3]--;
var _LOW  = max(argument[2],argument[3]);
var _HIGH = min(argument[2],argument[3]);




///Check the start object-------------------------
var _start_exists = false;
with(TileSwapperStart)
{
    if (depth==_LOW)
    {   //Object already exists, update the values.
        _start_exists  = true;
        active         = true;
        pal_sprite     = _PALETTE_IMAGE;
        pal_index      = _PALETTE_INDEX;
        pal_is_surface = global.palette_image_IS_SURFACE;
    }
}

if(!_start_exists)
{   //Object does not exist.  Create it.
    with(instance_create(0,0,TileSwapperStart))
    {
        active         = true;
        depth          = _LOW;
        pal_sprite     = _PALETTE_IMAGE;
        pal_index      = _PALETTE_INDEX;
        pal_is_surface = global.palette_image_IS_SURFACE;
    }
}





///Check the end object-------------------------
var _end_exists = false;
with(TileSwapperEnd)
{
    if (depth==_HIGH)
    {   //Object already exists, update the values.
        _end_exists = true;
        active      = true;
    }
}

if(!_end_exists)
{   //Object does not exist.  Create it.
    with(instance_create(0,0,TileSwapperEnd))
    {
        active = true;
        depth  = _HIGH;
    }
}




