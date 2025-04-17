/// enemy_spawn_1(object_index, version)

// Used by WosuSpawner & MauSpawner


var _OBJ = argument0;
var _VER = argument1;


var _facingDir = facingDir;
if (Input.heldH) facingDir = -sign_(Input.heldH&$1);
else             facingDir = -sign_(rand()&$1);


with(GameObject_create(0,0, _OBJ,_VER))
{   // B876
    facingDir =  other.facingDir;
    other.facingDir = _facingDir;
    
    // WIDE VIEW
    var _XL  = viewXL() + (viewW() * !facingDir); // left or right end of view
        _XL -= ww_;                               // half GO's width
        _XL +=((g.pc.yt&$FF)<3) * facingDir;      // OG CARRY. 0, 1, -1
    var _YT  =  g.pc.yt + g.pc.hh - $22;
    /*  OG
    var _XL = g.camXL + ((8*facingDir)&$FF) + ((g.pc.yt&$FF)<3);
    var _YT = g.pc.yt - 2;
    */
    
    set_xlyt(id, _XL,_YT);
    
    hspd = (HSPD1*facingDir) &$FF;
    counter = $FF;
    
    
    return id;
}




