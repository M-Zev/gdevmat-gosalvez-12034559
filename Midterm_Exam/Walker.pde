public class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector();
  public float scale;
  public float colR, colG, colB;
  
  public Walker() 
  {
  }

  public void render()
  {
    noStroke();
    fill(colR, colG, colB);
    circle(position.x, position.y, scale);
  }

  public void move()
  {
    position.add(speed);
  }
}
