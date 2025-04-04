class Walker
{
  PVector position, velocity, acceleration;
  float velocityLimit = 10;
  float scale;
  float mass;
  float colR, colG, colB;

  Walker(float m)
  {
    mass = m;
    scale = mass * 15;
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    colR = random(256);
    colG = random(256);
    colB = random(256);
  }

  void applyForce(PVector force)
  {
    acceleration.add(PVector.div(force, mass));
  }

  void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0); // Reset acceleration after applying
  }

  void render()
  {
    fill(colR, colG, colB);
    noStroke();
    circle(position.x, position.y, scale);
  }

  void checkEdges()
  {
    if (position.x >= Window.right || position.x <= Window.left)
    {
      position.x = Window.right;
      velocity.x *= -1;
    }
    if (position.y >= Window.top || position.y <= Window.bottom)
    {
      position.y = Window.bottom;
      velocity.y *= -1;
    }
  }
}
