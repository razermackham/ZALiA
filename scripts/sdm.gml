/// sdm(arguments...)

// sdm: Show Debug Message
// This is a shorter named show_debug_message() that takes
// a list of arguments as input and prints them space separated.
// It also prints floating point numbers with 10 digits precision.
var _output_string = "";
var _str = "";
for (var _i = 0; _i < argument_count; _i++) {
    _str = argument[_i];
    if (is_real(_str)) {
        _str = string_format(_str, 10, 10);
        // Remove prefix spaces
        while (string_char_at(_str, 1) == " ") {
            _str = string_delete(_str, 1, 1);
        }
        // Remove trailing zeroes
        while (string_char_at(_str, string_length(_str)) == "0") {
            _str = string_delete(_str, string_length(_str), 1);
        }
        if (string_char_at(_str, string_length(_str)) == "." || _str == "") {
            _str += "0";
        }
    }
    if (!is_string(_str)) {
        _str = string(_str);
    }
    _output_string += _str;
    if (_i < argument_count - 1) {
        _output_string += " ";
    }
}
show_debug_message(_output_string);
