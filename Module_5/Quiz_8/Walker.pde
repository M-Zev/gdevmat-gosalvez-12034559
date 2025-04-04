class Walker
{
  PVector position = new PVector(-500, 200);
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  
  float velocityLimit = 10;
  float scale;
  float mass;
  float colR, colG, colB;

  Walker(float mass)
  {
    this.mass = mass;
    this.scale = mass * 15;

    colR = random(256);
    colG = random(256);
    colB = random(256);
  }

  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass); // Apply force using F = ma
    acceleration.add(f);
  }

  void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0); // Reset acceleration every frame
  }

  void render()
  {
    fill(colR, colG, colB);
    circle(position.x, position.y, scale);
  }

  void checkEdges()
  {
    if (position.x >= Window.right || position.x <= Window.left)
    {
      velocity.x *= -1;
    }
    
    if (position.y >= Window.top || position.y <= Window.bottom)
    {
      velocity.y *= -1;
    }
  }
}
