public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale;
  
  public Walker()
  {
    position.set(random(-640, 640), random(-360, 360));
    scale = random(10, 50);
  }
  
  public void update()
  {
    velocity.add(acceleration).limit(velocityLimit);
    position.add(velocity);
  }
  
  public void render()
  {    
    fill(100);
    circle(position.x, position.y, scale);
  }
}
