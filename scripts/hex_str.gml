/// hex_str(number)

// converts a number to a string representation of its hex value


if (is_string(argument0)) return argument0;

argument0&=$FFFFFFFF; // limit to 32 bits

if (argument0==0) return "00";


// ---------------------------------------------------------
var _return = "";
while (argument0!=0) //      HEX_CHARS = "0123456789ABCDEF";
{   //_char =        strChar(HEX_CHARS,(argument0&$F)+1); // !!! causing slow performance
    _return = string_char_at(HEX_CHARS,(argument0&$F)+1) + _return;
    argument0 = argument0>>4;
}

if (string_length(_return)&$1) _return = "0"+_return;


return _return;




