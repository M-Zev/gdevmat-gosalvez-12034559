public class Walker
{
  private PVector position;
  private PVector noiseOffset; 
  private PVector colorOffset; 
  private float sizeOffset; 

  Walker()// Trying constructors
  {
    position = new PVector(); 
    noiseOffset = new PVector(0, 10000);
    colorOffset = new PVector(20000, 30000, 40000);
    sizeOffset = 50000;
  }

  void render()
  {
    int r = int(map(noise(colorOffset.x), 0, 1, 0, 255));
    int g = int(map(noise(colorOffset.y), 0, 1, 0, 255));
    int b = int(map(noise(colorOffset.z), 0, 1, 0, 255));
    int a = 255;

    float size = map(noise(sizeOffset), 0, 1, 5, 150);

    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, size);
  }

  void perlinWalk()
  {
    position.x = map(noise(noiseOffset.x), 0, 1, -640, 640);
    position.y = map(noise(noiseOffset.y), 0, 1, -360, 360);

    noiseOffset.add(0.008f, 0.008f); 
    colorOffset.add(0.1f, 0.1f, 0.1f); 
    sizeOffset += 0.008f; 

  }
}
