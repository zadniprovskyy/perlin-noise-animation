// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
//
// Inputs:
//   is_moon  whether we're considering the moon
//   time  seconds on animation clock
// Returns affine model transformation as 4x4 matrix
//
// expects: identity, rotate_about_y, translate, PI
mat4 model(bool is_moon, float time)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  if (is_moon) {
    return uniform_scale(0.3) * translate(vec3(sin(M_PI * time / 2.0) * 2 / 0.3, 0, cos(M_PI * time / 2.0) * 2 / 0.3)) * rotate_about_y(M_PI * time / 2.0);
    // return transpose(translate(vec3(0, 2, 0)));//* rotate_about_y(time);
  }
  else {
    return identity();
  }
  /////////////////////////////////////////////////////////////////////////////
}
