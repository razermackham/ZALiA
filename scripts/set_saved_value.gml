/// set_saved_value(file num, datakey, new value, *delete)


var                              _arg=0;
var _FILE_NUM  = clamp( argument[_arg++], 1,SAVE_FILE_MAX);
var _DATAKEY   = string(argument[_arg++]);
var _NEW_VALUE =        argument[_arg++];

var                      _WILL_DELETE = false;
if (argument_count>_arg) _WILL_DELETE = argument[_arg++];


var _FILE_NAME = f.dl_file_names[|_FILE_NUM-1];

if (file_exists(_FILE_NAME))
{
    var _file;
    var _file_data = global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+"_Encoded"];
    if (is_undefined(_file_data))
    {
        _file      = file_text_open_read(working_directory+_FILE_NAME);
        _file_data = file_text_read_string(_file);
                     file_text_close(      _file);
    }
    
    var _dm_save_data = json_decode(_file_data);
    if (ds_exists(_dm_save_data,ds_type_map))
    {
        if (_WILL_DELETE) ds_map_delete(_dm_save_data, _DATAKEY);
        else _dm_save_data[?_DATAKEY] = _NEW_VALUE;
        //
        
        var _SAVE_DATA = json_encode(_dm_save_data);
        ds_map_destroy(_dm_save_data); _dm_save_data=undefined;
        
        _file = file_text_open_write(working_directory+_FILE_NAME);
                file_text_write_string(_file,_SAVE_DATA);
                file_text_close(       _file);
        //
        global.dm_save_file_data[?STR_Save+STR_File+hex_str(_FILE_NUM)+"_Encoded"] = _SAVE_DATA;
    }
}




