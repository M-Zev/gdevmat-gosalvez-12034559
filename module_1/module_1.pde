float amplitude = 50; // Default amplitude for sine wave
float frequency = 0.1; // Default frequency for sine wave

void setup()
{
  size(1280, 720, P3D); // Set window size and 3D mode
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(130); // Dark gray background
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWave();
}

// Min/maxed cartesian plane :D
void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  stroke(white);
  
  line(-width / 2, 0, width / 2, 0); // X-axis
  line(0, -height / 2, 0, height / 2); // Y-axis
  
  // Draw grid lines
  for (int i = -width / 2; i <= width / 2; i += 20)
  {
    line(i, -5, i, 5); // Vertical markers
    line(-5, i, 5, i); // Horizontal markers
  }
}

//  f(x) = -5x + 30
void drawLinearFunction()
{
  strokeWeight(2);
  color purple = color(128, 0, 128);
  stroke(purple);
  
  for (int x = -200; x < 200; x++)
  {
    float y1 = (-5 * x) + 30;
    float y2 = (-5 * (x + 1)) + 30;
    
    line(x, -y1, x + 1, -y2);
  }
}

//  f(x) = x^2 - 15x - 3
void drawQuadraticFunction()
{
  strokeWeight(2);
  color yellow = color(255, 255, 0);
  stroke(yellow);
  
  for (int x = -200; x < 200; x++)
  {
    float y1 = (x * x) - (15 * x) - 3;
    float y2 = ((x + 1) * (x + 1)) - (15 * (x + 1)) - 3;
    
    line(x, -y1, x + 1, -y2);
  }
}

// Function to draw Sine Wave f(x) = A sin(Bx)
void drawSineWave()
{
  strokeWeight(2);
  color blue = color(0, 0, 255);
  stroke(blue);
  
  for (int x = -width/2; x < width/2; x++)
  {
    float y1 = amplitude * sin(frequency * x);
    float y2 = amplitude * sin(frequency * (x + 1));
    
    line(x, -y1, x + 1, -y2);
  }
}

// Bonus
void keyPressed()
{
  if (key == 'w') amplitude += 5;   // Increase amplitude
  if (key == 's') amplitude -= 5;   // Decrease amplitude
  if (key == 'd') frequency += 0.01; // Increase frequency
  if (key == 'a') frequency -= 0.01; // Decrease frequency
}
