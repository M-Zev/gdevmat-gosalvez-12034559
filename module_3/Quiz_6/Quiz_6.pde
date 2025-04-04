void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D); // Set window size and 3D mode
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);

  return new PVector(x, y);
}

void draw() {
  background(30); // Dark background for contrast

  PVector mouse = mousePos();
  mouse.normalize();
  mouse.mult(250);
  
  float magnitude = mouse.mag();
  println("Lightsaber one side magnitude: " + magnitude);

  // Handle
  float handleLength = 50; //adjustable handle length
  PVector handleLeft = PVector.mult(mouse, -handleLength / magnitude);
  PVector handleRight = PVector.mult(mouse, handleLength / magnitude);

  // Outer Glow
  strokeWeight(20);
  stroke(255, 0, 0, 180);
  line(handleLeft.x, handleLeft.y, handleLeft.x - mouse.x, handleLeft.y - mouse.y);
  line(handleRight.x, handleRight.y, handleRight.x + mouse.x, handleRight.y + mouse.y);

  // Inner Glow
  strokeWeight(10);
  stroke(255, 255, 255, 255);
  line(handleLeft.x, handleLeft.y, handleLeft.x - mouse.x, handleLeft.y - mouse.y);
  line(handleRight.x, handleRight.y, handleRight.x + mouse.x, handleRight.y + mouse.y);

  // Handle
  strokeWeight(15);
  stroke(0);
  line(handleLeft.x, handleLeft.y, handleRight.x, handleRight.y);
}
