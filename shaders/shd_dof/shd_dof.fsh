varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D sampDepth;
uniform sampler2D sampBlur;

uniform float u_near;
uniform float u_far;
uniform float u_focus;

void main()
{
    vec4 color_main = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 color_blur = texture2D(sampBlur, v_vTexcoord);
    float depth_value = texture2D(sampDepth, v_vTexcoord).r;
    
    if (depth_value > u_near && depth_value < u_far)
        gl_FragColor = color_main;
    else
        gl_FragColor = color_blur;
}
