


can_draw_self = true;

xScale_L = facingDir;    // 
xScale_R = facingDir;    // 
palIdx_L = palidx_def; // 
palIdx_R = palidx_def; // 

if (isProjSprAdjFrame())
{
    xScale_L *= -1;       // 
    palIdx_L  = global.PI_PC1; // 
}

// sprites[0]: tip, sprites[1]: pole
spr_L = dl_sprites[|facingDir == 1]; // 
spr_R = dl_sprites[|facingDir != 1]; // 




