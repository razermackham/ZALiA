/// tile_layer_get_tsrc(depth, x, y)


// Get tile id.
    argument0 = tile_layer_find(argument0, argument1,argument2); // tile id
if (argument0+1) // if (tile id>=0) create tsrc
{   argument0 = ((tile_get_top(argument0)>>3)<<4) | (tile_get_left(argument0)>>3);  }


return argument0;




