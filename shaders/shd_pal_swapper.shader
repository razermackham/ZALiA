attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;
uniform vec3 ALPHA0_COLOR;

void main()
{
    vec4 _source = texture2D(gm_BaseTexture, v_vTexcoord);
    
    DoAlphaTest(_source);
    
    if (_source.rgb==ALPHA0_COLOR)
    //if (_source.rgb==vec3(127.0/255.0)) // mid grey $7F7F7F
    {
        _source.a = 0.0;
    }
    else
    {
        for(float _i=palette_UVs.y; _i<palette_UVs.w; _i+=texel_size.y)
        {
            if (distance(_source, texture2D(palette_texture, vec2(palette_UVs.x, _i))) <= 0.004)
            {
                float _palette_V = palette_UVs.x + texel_size.x * palette_index;
                _source = texture2D(palette_texture, vec2(_palette_V, _i));
                break;
            }
        }
    }

    gl_FragColor = _source * v_vColour;
}




/*
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

void main()
{
    vec4 _source = texture2D(gm_BaseTexture, v_vTexcoord);
    
    DoAlphaTest(_source);
    
    for(float _i=palette_UVs.y; _i<palette_UVs.w; _i+=texel_size.y)
    {
        if (distance(_source, texture2D(palette_texture, vec2(palette_UVs.x, _i))) <= 0.004)
        {
            float _palette_V = palette_UVs.x + texel_size.x * palette_index;
            _source = texture2D(palette_texture, vec2(_palette_V, _i));
            break;
        }
    }

    gl_FragColor = _source * v_vColour;
}
*/
