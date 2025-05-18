/// ds_grid_get_compat(grid, x, y)
// For GMS 1 ds_grid_get compatability in GMS2, returns 0 instead of undefined.
var _grid = argument0
var _x = argument1
var _y = argument2
if (ds_grid_width(_grid) <= _x || ds_grid_height(_grid) <= _y || _x < 0  || _y < 0) {
    sdm("ds_grid_get_compat:", _grid, "index out of bounds reading [", _x, ",", _y, "] - size is [", ds_grid_width(_grid) , ",", ds_grid_height(_grid) , "]");
    return 0;
}
return ds_grid_get(_grid, _x, _y);
