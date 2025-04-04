Walker walkers[] = new Walker[8];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  resetWalkers();
}

void resetWalkers()
{
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i + 2);
    float posY = 2 * (Window.windowHeight / walkers.length) * (i - (walkers.length / 2.0));
    walkers[i].position = new PVector(Window.left + 50, posY); // Slight offset from the left edge
  }
}

void draw()
{
  background(255);
  if (mousePressed)
  {
    resetWalkers();
  }
  
  // Middle line
  stroke(0);
  line(0, -Window.windowHeight, 0, Window.windowHeight);
  
  for (Walker w : walkers)
  {
    float mew = (w.position.x >= 0) ? 0.4f : 0.01f;
    
    // Friction
    if (w.velocity.mag() > 0)
    {
      PVector friction = w.velocity.copy().mult(-1).normalize().mult(mew);
      w.applyForce(friction);
    }

    // Acceleration w/ mass
    PVector acceleration = new PVector(0.2 / w.mass, 0);
    w.applyForce(acceleration);

    w.update();
    w.render();
    w.checkEdges();
  }
}
