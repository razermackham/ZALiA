/// color_str(color)


if (is_string(argument0))
{
    return argument0;
}


var _byte;
var _return = "";

for(var _i=0; _i<3; _i++)
{
    _byte = (argument0>>(_i<<3)) &$FF;
    _return = hex_str(_byte) + _return;
}


return _return;




