/// round16(int)
// round an int to the nearest 16th
return ((argument0>>4)<<4) + ((argument0&$8)<<1);


