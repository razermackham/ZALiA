/// str_hex(str of bytes, *byte index)

// Returns the passed string as a number in hex as if 
// the string is a text representation of a hex number.

// Characters that are NOT "0123456789ABCDEF" are treated as 0.

// Optional argument[1] -----------------------
//      An array index where arg0 is treated like an array 
//      containing a text representaion of 1 byte.
//      The return will be just the 1 byte of the index passed.
//      Example: 
//              arg0 = "F8D5C2A9FF01EE0A"
//              array form: [F8][D5][C2][A9][FF][01][EE][0A]
//              arg1 = 4. Index 4 of array = $FF.

// Note that for performance purposes: 
//      When no arg1 is passed, arg0 will be limited to 8 chars. 
//      In the event arg0 is more than 8 chars, the chars processed 
//      will be the BACK 8 because arg0 is treated like it's a 
//      number and the BACK(right end) are the first 4 bytes(8 nybbles). 
//      I make this note because it may be a little disorienting because 
//      arrays start at their left but numbers start from their right.





// ---------------------------------------------------------------
if(!is_string(argument[0])) return 0;

var _LEN = string_length(argument[0]);
if(!_LEN)                   return 0;

// ---------------------------------------------------------------
if (argument_count>1)
{
    if (_LEN&$1) 
    {
        argument[0] = "0" + argument[0];
        _LEN++;
    }
    
    argument[1] = clamp(argument[1], 0, (_LEN>>1)-1);
    argument[0] = string_copy(argument[0], (argument[1]<<1)+1, 2);
    _LEN = 2;
}
else if (_LEN>8)
{
    argument[0] = string_copy(argument[0], _LEN-7, 8);
    _LEN = 8;
}


// ---------------------------------------------------------------
var _return = 0;

for(var _i=1; _i<=_LEN; _i++) // Each char/nybble
{
    _return = _return<<4;
    
    // HEX_CHARS = "0123456789ABCDEF";
    // if char isn't one of HEX_CHAR, the nybble will be 0
    _return |= max(0, string_pos(string_char_at(argument[0],_i), HEX_CHARS) - 1);
}


return _return;




/* Found at: https://www.reddit.com/r/gamemaker/comments/9nyjbu/hexstringtonumber_script/
var result=0;

// special unicode values
var ZERO=ord("0");
var NINE=ord("9");
var A=ord("A");
var F=ord("F");

for (var _i=1; _i<=string_length(argument0); _i++){
    var c=ord(string_char_at(string_upper(argument0), _i));
    // you could also multiply by 16 but you get more nerd points for bitshifts
    result=result<<4;
    // if the character is a number or letter, add the value
    // it represents to the total
    if (c>=ZERO&&c<=NINE){
        result=result+(c-ZERO);
    } else if (c>=A&&c<=F){
        result=result+(c-A+10);
    // otherwise complain
    } else {
        // this will make the browser behave badly but you can leave it in
        // actual game maker if you want
        //show_error("bad input for hex(str)", true);
    }
}

return result;
*/




/*
/// str_hex(str of bytes, *byte num)
// Takes all "0123456789ABCDEF" chars in the passed 
// string, treating them as a hex value, turns 
// and returns it as that value.

// argument[1]  Array posistion (not index) of 1 byte in arg0
//              as if arg0 is an array of bytes. 
//              arg1 cannot be 0: The sign of arg1 indicates 
//              whether to count from the front or the back of the array.
//              
//              Example: arg0 = "775B660D9F"
//              arg1 = -2. Return would be $0D: "77  5B  66 (0D) 9F"
//              arg1 = +2. Return would be $5B: "77 (5B) 66  0D  9F"


if (!is_string(argument[0])) return 0;

var      _LEN = string_length(argument[0]);
    if (!_LEN)               return 0;

// ---------------------------------------------------------------
if (argument_count > 1)
{
    if (argument[1] != 0)
    {
        // Visualization help.
        // arg0 = F8D5C2(A9)FF01EE0A. arg1 = -5. _LEN = 16
        // position for string_copy() = 7 = _LEN - ((arg1 << 1) - 1)
        
        // arg0 = F8D5C2A9(FF)01EE0A. arg1 = +5. _LEN = 16
        // position for string_copy() = 9 =        ((arg1 << 1) - 1)
        
        if (_LEN & 1) 
        {
            argument[0] = "0" + argument[0];
            _LEN++;
        }
        
        
        var _SIGN   = sign( argument[1]);
        argument[1] = abs(  argument[1]);
        argument[1] = clamp(argument[1], 1, _LEN >>1);
        if (_SIGN)
        {   argument[1] = _LEN - ((argument[1]  <<1) - 1);  }
        else
        {   argument[1] =        ((argument[1]) <<1) - 1);  }
        
        
        argument[0] = string_copy(argument[0], argument[1], 2);
        _LEN = 2;
    }
}

if (_LEN > 8)
{
    argument[0] = string_copy(argument[0], _LEN-7, 8);
    _LEN = 8;
}


// ---------------------------------------------------------------
var _return = 0;

for (var _i = 1; _i <= _LEN; _i++)
{
    // HEX_CHARS = "0123456789ABCDEF";
    _return  = _return <<4;
    _return |= max(0, string_pos(string_char_at(argument[0],_i), HEX_CHARS) - 1);
}


return _return;
*/



