/// Fokkeru_draw()


if (!can_draw_self) exit; // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


pal_swap_set(global.palette_image, palidx);
GO_draw_sprite(sprBtm);
GO_draw_sprite(sprite);
pal_swap_reset();




