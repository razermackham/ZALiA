/// GO_can_collide_this_frame(uIdx)


return ( (argument0&$1) && !(g.counter1&$1))  // (Odd  uIdx on Even frame)
    || (!(argument0&$1) &&  (g.counter1&$1)); // (Even uIdx on Odd  frame)
//




