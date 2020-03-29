/// glsl_gaussian_blur
varying vec2 v_vTexcoord;

uniform vec2 u_Scale;

vec4 sample2points ( vec2 basecoord, vec2 shift )
{
    return texture2D( gm_BaseTexture, basecoord + shift ) + 
           texture2D( gm_BaseTexture, basecoord - shift ); 
}

/*void main()
{
    gl_FragColor = ( sample2points ( v_vTexcoord, u_Scale * 1.0 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.8 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.6 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.4 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.2 ) +
                     texture2D ( gm_BaseTexture, v_vTexcoord ) ) / 11.0;
}*/
void main()
{
    gl_FragColor = ( sample2points ( v_vTexcoord, u_Scale * 1.0 ) +
					 sample2points ( v_vTexcoord, u_Scale * 0.9 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.8 ) +
					 sample2points ( v_vTexcoord, u_Scale * 0.7 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.6 ) +
					 sample2points ( v_vTexcoord, u_Scale * 0.5 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.4 ) +
					 sample2points ( v_vTexcoord, u_Scale * 0.3 ) +
                     sample2points ( v_vTexcoord, u_Scale * 0.2 ) +
					 sample2points ( v_vTexcoord, u_Scale * 0.1 ) +
                     texture2D ( gm_BaseTexture, v_vTexcoord ) ) / 22.0;
}