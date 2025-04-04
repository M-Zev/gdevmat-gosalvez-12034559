Walker[] walkers = new Walker[100];

PVector mousePos()
{
  return new PVector(mouseX - Window.widthPx / 2, -(mouseY - Window.heightPx / 2));
}

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(80);
  PVector mouse = mousePos();
  
  for (Walker walker : walkers)
  {
    walker.acceleration = PVector.sub(mouse, walker.position).normalize().mult(0.2);
    walker.update();
    walker.render();
  }
}
