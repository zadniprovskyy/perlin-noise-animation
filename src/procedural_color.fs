// Set the pixel color to an interesting procedural color generated by mixing
// and filtering Perlin noise of different frequencies.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;

// expects: blinn_phong, perlin_noise
void main()
{
    vec3 ka = vec3(1,1,1);
    vec3 l = normalize(vec3( cos(M_PI*animation_seconds/3), 2, sin(M_PI*animation_seconds/3)));

    vec3 kd = vec3(0,0,1), ks = vec3(0.5,0.5,0.5);


    if (is_moon) {
        kd = vec3(0.5,0.5,0.5), ks = vec3(0.5,0.5,0.5);
    }

    color = kd * (perlin_noise((sphere_fs_in+1)*10)+1)/2;

}
