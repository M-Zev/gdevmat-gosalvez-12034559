int n, a = 0;

Walker blackHole = new Walker();
Walker[] matter = new Walker[100];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
  
  for (int i = 0; i < matter.length; i++)
  {
    matter[i] = new Walker();
  }
}

PVector mousePos()
{
  return new PVector(mouseX - Window.widthPx / 2, -(mouseY - Window.heightPx / 2));
}

void draw()
{
  float gaussian = randomGaussian(), scaleGaussian = randomGaussian();
  float xRng = random(-640, 641), yRng = random(-360, 361);
  float colorRngR = random(256), colorRngG = random(256), colorRngB = random(256);

  float x = Window.windowWidth * gaussian;
  float y = yRng;
  float thickness = 20 * scaleGaussian + 10;

  PVector mouse = mousePos();

  if (a < 99)
  { 
    matter[a].position.set(x, y);
    matter[a].scale = thickness;
    matter[a].colR = colorRngR;
    matter[a].colG = colorRngG;
    matter[a].colB = colorRngB;
    a++;
  }

  if (a == 99)
  {
    for (Walker w : matter) w.render();

    blackHole.position.set(xRng, yRng);
    blackHole.scale = 50;
    blackHole.colR = blackHole.colG = blackHole.colB = 255;
    blackHole.render();
    a++;
  }

  if (a == 100)
  {
    if (n >= 199)
    {
      background(0);
      a = 0;
      n = 0;
    }
    else
    {
      background(0);
      for (Walker w : matter)
      {
        w.speed = PVector.sub(blackHole.position, w.position).normalize().mult(10);
        w.move();
        w.render();
      }

      blackHole.position.set(mouse);
      blackHole.render();
      n++;
    }
  }
}
