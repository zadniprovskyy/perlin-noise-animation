// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
//
// Inputs:
//   planet_id  what planet we are considering
//   time  seconds on animation clock
// Returns affine model transformation as 4x4 matrix
//
// expects: identity, rotate_about_y, translate, PI
mat4 model(int planet_id, float time)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  if (planet_id == 0) {
    return uniform_scale(0.3) * translate(vec3(sin(M_PI * time / 2.0) * 2 / 0.3, 0, cos(M_PI * time / 2.0) * 2 / 0.3)) * rotate_about_y(M_PI * time / 2.0);
    // return transpose(translate(vec3(0, 2, 0)));//* rotate_about_y(time);
  }
  else if (planet_id == 1) {
    return identity();
  }
  else if (planet_id == 2) {
    return uniform_scale(0.7) * translate(vec3(sin(M_PI * time / 2.0) * 2 / 0.3, 0, cos(M_PI * time / 2.0) * 2 / 0.3)) * rotate_about_y(M_PI * time / 2.0);
  }
  /////////////////////////////////////////////////////////////////////////////
}
