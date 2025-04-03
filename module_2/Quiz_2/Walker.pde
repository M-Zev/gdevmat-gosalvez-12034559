class Walker
{
  float x;
  float y;
  float distribution = 5;
  
  void render()
  {
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(50, 101));
    
    fill(r, g, b, a);
    noStroke();
    circle(x, y, 25);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));  

    switch (rng)
    {
      case 0: y += distribution; break;  // Down
      case 1: y -= distribution; break;  // Up
      case 2: x += distribution; break;  // Right
      case 3: x -= distribution; break;  // Left
      case 4:  // Bottom-right
        x += distribution;
        y += distribution; 
        break;
      case 5: // Bottom-left
        x -= distribution;
        y += distribution;
        break;  
      case 6: // Top-right
        x += distribution;
        y -= distribution;
        break;  
      case 7: // Top-left
        x -= distribution;
        y -= distribution;
        break; 
      default: break;
    }
  }

  void randomWalkBiased()
  {
    float rng = random(1);  // Generate a random number between 0 and 1

    if (rng < 0.4)
    {       
      x += distribution;
    }
    else if (rng < 0.6)
    { 
      x -= distribution;
    }
    else if (rng < 0.8)
    { 
      y -= distribution;
    }
    else
    {            
      y += distribution;
    }
  }
}
