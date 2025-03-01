/// ds_list_has_element(list, index)
// 
// Check if a list has a defined element at index
var _list = argument0
var _index = argument1

// Expand list if needed
if (is_undefined(_list)) {
    return false;
}
if (_index >= ds_list_size(_list)) {
    return false;
}
if (!instance_exists(_list[|_index])) {
    return false;
}

return true;
