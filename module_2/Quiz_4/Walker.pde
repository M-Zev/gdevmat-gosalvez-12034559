public class Walker
{
  public float x, y;
  public float tx = 0, ty = 10000; // Offset for walk
  public float tr = 20000, tg = 30000, tb = 40000; // Offsets for colors
  public float ts = 50000; // Offset for size
  private boolean hasStarted = false; // Prevents middle circle

  void render()
  {
    if (!hasStarted) return;
    
    int r = int(map(noise(tr), 0, 1, 0, 255));
    int g = int(map(noise(tg), 0, 1, 0, 255));
    int b = int(map(noise(tb), 0, 1, 0, 255));
    int a = int(255); 
    
    float size = map(noise(ts), 0, 1, 5, 150);
    
    fill(r, g, b, a);
    noStroke();
    circle(x, y, size);
  }

  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);

    tx += 0.008f;
    ty += 0.008f;

    tr += 0.1f;
    tg += 0.1f;
    tb += 0.1f;
    
    ts += 0.008f; 
    
    hasStarted = true;
  }
}
