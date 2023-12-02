varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 v_worldPosition;

uniform vec3 lightDirection;

void main() {
    vec4 starting_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec4 lightAmbient = vec4(0.25, 0.25, 0.25, 1);
    vec3 lightDirection = normalize(lightDirection);
    
    vec3 dx = dFdx(v_worldPosition);
    vec3 dy = dFdy(v_worldPosition);
    vec3 world_normal = normalize(cross(dx, dy));
    
    float NdotL = max(0.0, -dot(world_normal, lightDirection));
    
    vec4 final_color = starting_color * vec4(min(lightAmbient + NdotL, vec4(1)).rgb, starting_color.a);
    gl_FragColor = final_color;
}