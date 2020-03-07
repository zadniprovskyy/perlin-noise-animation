// Generate a pseudorandom unit 3D vector
// 
// Inputs:
//   seed  3D seed
// Returns psuedorandom, unit 3D vector drawn from uniform distribution over
// the unit sphere (assuming random2 is uniform over [0,1]²).
//
// expects: random2.glsl, PI.glsl
vec3 random_direction( vec3 seed)
{
  // https://www.scratchapixel.com/lessons/procedural-generation-virtual-worlds/perlin-noise-part-2
  // used this source to read about uniform distribution over unit sphere

  vec2 r = random2(seed);

  float theta = acos(2 * r.x - 1);
  float phi = 2 * r.y * M_PI;

  return vec3(cos(phi) * sin(theta), sin(phi) * sin(theta), cos(theta));
}
