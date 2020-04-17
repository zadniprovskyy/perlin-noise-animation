// Add (hard code) an orbiting (point or directional) light to the scene. Light
// the scene using the Blinn-Phong Lighting Model.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform int planet_id;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;
// expects: PI, blinn_phong
void main()
{

    vec3 ka = vec3(1,1,1);
    vec3 l = normalize(vec3( cos(M_PI*animation_seconds/3), 2, sin(M_PI*animation_seconds/3)));
    vec3 kd = vec3(0,0,1), ks = vec3(0.5,0.5,0.5);
    if (planet_id == 0) {
        vec3 kd = vec3(0,0,1), ks = vec3(0.5,0.5,0.5);
    }
    else if (planet_id == 1) {
        kd = vec3(0.5,0.5,0.5), ks = vec3(0.5,0.5,0.5);
    }

    else if (planet_id == 2) {
        kd = vec3(1,0,0), ks = vec3(0.5,0.5,0.5);
    }

    color = blinn_phong(
        ka,
        kd,
        ks,
        1000,
        normalize(sphere_fs_in),
        normalize(-view_pos_fs_in.xyz),
        l
    );


}
