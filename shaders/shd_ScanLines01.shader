//
// Simple passthrough vertex shader
//
// #############################################################
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}




//######################_==_YOYO_SHADER_MARKER_==_######################@~// Simple passthrough fragment shader
//
// #############################################################
// Based off: GameMaker Casts - https://www.youtube.com/watch?v=jjUkQJJokCU
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_texture_w;
uniform float u_texture_h;

uniform float u_line_brightness;
uniform float u_line_height;


void main()
{
    vec4 _color = v_vColour * texture2D(gm_BaseTexture,v_vTexcoord);
    
    if (mod(floor(u_texture_h*v_vTexcoord.y), u_line_height*2.0) < u_line_height)
    {
        _color.rgb *= vec3(u_line_brightness);
    }
    
    gl_FragColor = _color;
}




