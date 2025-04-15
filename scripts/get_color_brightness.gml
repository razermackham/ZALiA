/// get_color_brightness(color rgb value)

// Google says this is the "percieved" brightness of a color


var    _brightness  = ((argument0>>$00)&$FF) * .2126; // R
       _brightness += ((argument0>>$08)&$FF) * .7152; // G
       _brightness += ((argument0>>$10)&$FF) * .0722; // B
       _brightness  = floor(_brightness);
//
return _brightness;




