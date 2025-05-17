/// p_Create()

show_debug_message("p_Create()");


//Initilize System and add palettes
//This should be done before any drawing takes place 
//in a managing object that will persist through the entire game.
//Notice I've set it to persistent.  

//First Init the System, specify the name of the pal swap shader in 
// case you've changed it for some reason.
if (global.use_pal_swap) pal_swap_init_system(shd_pal_swapper);

p_init();




