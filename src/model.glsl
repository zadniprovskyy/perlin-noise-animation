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
  // whenever we want all planets to move we set t to time, o.w. set it to some constant
  float t = 1;
  if (planet_id == 0) {
    return identity();
    // return transpose(translate(vec3(0, 2, 0)));//* rotate_about_y(time);
  }
  else if (planet_id == 1) {

    return uniform_scale(1.2) * translate(vec3(sin(M_PI * t / 2.0) * 2 / 0.3, 0, cos(M_PI * t / 2.0) * 2 / 0.3)) * rotate_about_y(M_PI * t / 2.0);
  }
  else if (planet_id == 2) {
    return uniform_scale(1.4) * translate(vec3(sin(M_PI * t / 2.0) * 4 / 0.3, 0, cos(M_PI * t / 2.0) * 4 / 0.3)) * rotate_about_y(M_PI * t / 2.0);
  }
  /////////////////////////////////////////////////////////////////////////////
}
