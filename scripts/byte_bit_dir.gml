/// byte_bit_dir(byte horz speed, byte vert speed)


return   ((1 <<(argument0>=$80)) * (!!argument0))  // hspd:  $00: $0,  $01-$7F: $1,  $80-$FF: $2
       | ((4 <<(argument1>=$80)) * (!!argument1)); // vspd:  $00: $0,  $01-$7F: $4,  $80-$FF: $8
//
// return ((1 <<(argument0>=$80)) * !!argument0)   |   ((4 <<(argument1>=$80)) * !!argument1);




