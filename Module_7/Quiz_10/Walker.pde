public class Walker
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  float velocityLimit = 10;
  float scale = 15;
  float mass = 1;
  float r = 255, g = 255, b = 255;

  public void applyForce(PVector force)
  {
    acceleration.add(PVector.div(force, mass));
  }

  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void render()
  {
    fill(r, g, b);
    circle(position.x, position.y, scale);
  }
}
