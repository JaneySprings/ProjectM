/// glsl_threshold
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_Threshold;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor.rgb = max ( vec3 ( 0.0 ), gl_FragColor.rgb - u_Threshold );
    gl_FragColor.rgb /= 1.0 - u_Threshold;
}