/// get_pal_color(palette data, pal idx of palette data, color base char)


// make argument2 the index of the color within a palette
argument2  = string_pos(string(argument2), global.PAL_BASE_COLOR_ORDER);
argument2  = max(0,argument2-1);
argument2 *= global.PAL_CHAR_PER_COLOR;
// make argument1 the string position of color needed
argument1  = get_pal_pos(argument1);
argument1 += argument2;

return str_hex(string_copy(argument0, argument1, global.PAL_CHAR_PER_COLOR));

// p.PI_BASE   - p.PI_MENU   - p.PI_BGR1   - p.PI_BGR2   - p.PI_BGR3   - p.PI_BGR4
// FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF

//               p.PI_PC_1   - p.PI_MOB1   - p.PI_MOB2   - p.PI_MOB3   - p.PI_MOB4
//               FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF




/*
/// get_pal_color(pal idx, col idx of pal)


// Pass argument0 with get_pi(pal idx)
argument0  = clamp(argument0, 0,p.PI_LAST);
argument1  = clamp(argument1, 0,global.COLORS_PER_PALETTE-1);

argument0  = (argument0*global.COLORS_PER_PALETTE) + argument1; // idx of color requested in pal_rm_curr
argument0 *= global.PAL_CHAR_PER_COLOR;
argument0++; // because string

return str_hex(string_copy(p.pal_rm_curr, argument0, global.PAL_CHAR_PER_COLOR));

// p.PI_BASE   - p.PI_MENU   - p.PI_BGR1   - p.PI_BGR2   - p.PI_BGR3   - p.PI_BGR4
// FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF

//               p.PI_PC_1   - p.PI_MOB1   - p.PI_MOB2   - p.PI_MOB3   - p.PI_MOB4
//               FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF - FF FF FF FF




*/




