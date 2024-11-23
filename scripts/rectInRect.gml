/// rectInRect(ax, ay, aw, ah, bx, by, bw, bh)


return argument0           < argument4+argument6  // a_LFT  <  b_RGT
    && argument1           < argument5+argument7  // a_TOP  <  b_BTM
    && argument0+argument2 > argument4            // a_RGT  >  b_LFT
    && argument1+argument3 > argument5;           // a_BTM  >  b_TOP
//


                                               
                                                     
