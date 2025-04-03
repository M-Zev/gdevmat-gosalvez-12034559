void setup()
{
  size(1280, 720, P3D); // Set window size and 3D mode
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker walker1 = new Walker();  // Uses randomWalk()
Walker walker2 = new Walker();  // Uses randomWalkBiased()

void draw()
{
  walker1.randomWalk();
  walker2.randomWalkBiased();
  
  walker1.render();
  walker2.render();
}
