// Given a 3d position as a seed, compute an even smoother procedural noise
// value. "Improving Noise" [Perlin 2002].
//
// Inputs:
//   st  3D seed
// Values between  -½ and ½ ?
//
// expects: random_direction, improved_smooth_step
float perlin_noise( vec3 st)
{
  float fl_x = floor(st.x), fl_y = floor(st.y), fl_z = floor(st.z);

  float noise = 0;

  // v*** vector from lettice point to centre,
  // g*** gradient vector
  vec3 p000 = (vec3(fl_x, fl_y, fl_z));
  vec3 v000 = st - p000;
  vec3 g000 = random_direction(p000);
  float n000 = dot(g000, v000);

  vec3 p001 = (vec3(fl_x, fl_y, fl_z+1));
  vec3 v001 = st - p001;
  vec3 g001 = random_direction(p001);
  float n001 = dot(g001, v001);

  vec3 p010 = (vec3(fl_x, fl_y+1, fl_z));
  vec3 v010 = st - p010;
  vec3 g010 = random_direction(p010);
  float n010 = dot(g010, v010);

  vec3 p011 = (vec3(fl_x, fl_y+1, fl_z+1));
  vec3 v011 = st - p011;
  vec3 g011 = random_direction(p011);
  float n011 = dot(g011, v011);

  //
  vec3 p100 = (vec3(fl_x+1, fl_y, fl_z));
  vec3 v100 = st - p100;
  vec3 g100 = random_direction(p100);
  float n100 = dot(g100, v100);

  vec3 p101 = (vec3(fl_x+1, fl_y, fl_z+1));
  vec3 v101 = st - p101;
  vec3 g101 = random_direction(p101);
  float n101 = dot(g101, v101);

  vec3 p110 = (vec3(fl_x+1, fl_y+1, fl_z));
  vec3 v110 = st - p110;
  vec3 g110 = random_direction(p110);
  float n110 = dot(g110, v110);

  vec3 p111 = (vec3(fl_x+1, fl_y+1, fl_z+1));
  vec3 v111 = st - p111;
  vec3 g111 = random_direction(p111);
  float n111 = dot(g111, v111);

  float sx = 1-smooth_step(v000.x);
  float sy = 1-smooth_step(v000.y);
  float sz = 1-smooth_step(v000.z);


  float n00 = sz*n000 + (1-sz)*n001;
  float n01 = sz*n010 + (1-sz)*n011;
  float n10 = sz*n100 + (1-sz)*n101;
  float n11 = sz*n110 + (1-sz)*n111;

  float n0 = n00 * sy + n01 * (1-sy);
  float n1 = n10 * sy + n11 * (1-sy);

  noise = n0 * sx + n1 * (1-sx);

  return clamp(noise,-1,1);

}

