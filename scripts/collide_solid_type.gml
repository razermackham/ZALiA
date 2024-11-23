/// collide_solid_type(x, y)


var _SOLID = collide_solid_inst(argument0, argument1);
if (_SOLID 
&&  _SOLID.solid_type )
{
    return _SOLID.solid_type;
}

return collide_solid_grid(argument0, argument1);




