void setup()
{
  size(1280, 720, P3D); // Set window size and 3D mode
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

int frameCountReset = 300;

void draw()
{
   //screenFlusher(); //In case you meant to refresh once only
   screenMultiFlusher(); 

  float splatterStandardDeviation = 200; 
  float splatterMean = 0;
  float x = splatterStandardDeviation * randomGaussian() + splatterMean;

  float y = random(-height / 2.0, height / 2.0); 

  float sizeMean = 30;
  float sizeStandardDeviation = 15;
  float size = sizeStandardDeviation * randomGaussian() + sizeMean; // Ensure it's positive

  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(10, 101)); 

  noStroke();
  fill(r, g, b, a);
  circle(x, y, size);
}

void screenFlusher()
{
  if (frameCount == frameCountReset)
  {
    background(255); 
  }
}

void screenMultiFlusher()
{
  if (frameCount % frameCountReset == 0)
  {
    background(255); 
  }
}
