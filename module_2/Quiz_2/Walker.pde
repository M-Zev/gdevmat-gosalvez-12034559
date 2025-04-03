class Walker
{
  float x;
  float y;
  
  void render()
  {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(50, 101));  // Random alpha (50-100)
    
    fill(r, g, b, a);
    noStroke();
    circle(x, y, 25);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));  

    switch (rng)
    {
      case 0: y += 5; break;  // Down
      case 1: y -= 5; break;  // Up
      case 2: x += 5; break;  // Right
      case 3: x -= 5; break;  // Left
      case 4: x += 5; y += 5; break;  // Bottom-right
      case 5: x -= 5; y += 5; break;  // Bottom-left
      case 6: x += 5; y -= 5; break;  // Top-right
      case 7: x -= 5; y -= 5; break;  // Top-left
      default: break;
    }
  }

  void randomWalkBiased()
  {
    float rng = random(1);  // Generate a random number between 0 and 1

    if (rng < 0.4)
    {       
      x += 10;
    }
    else if (rng < 0.6)
    { 
      x -= 10;
    }
    else if (rng < 0.8)
    { 
      y -= 10;
    }
    else
    {            
      y += 10;
    }
  }
}
