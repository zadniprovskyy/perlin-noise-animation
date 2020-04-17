// Set the pixel color to blue or gray depending on is_moon.
//
// Uniforms:
uniform int planet_id;
// Outputs:
out vec3 color;
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code:
  if (planet_id == 0) {
   color = vec3(0.5,0.5,0.5);
//     color = vec3(0,0,1);
  }
  else if (planet_id == 1){
    color = vec3(0,0,1);
  }
  else if (planet_id == 2){
      color = vec3(1,0,0);
    }
  /////////////////////////////////////////////////////////////////////////////
}
