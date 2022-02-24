// --> IMPORTS
import processing.sound.*;

SoundFile soundfile;

int rectangleSize = 40;    // size of rectangle
int x = 0;                 // x position of square
int direction = 1;         // direction

// --> SETUP
void setup() {
  size(640, 480);
  background(0);

  // Load a soundfile
  soundfile = new SoundFile(this, "KnightRider.mp3");

  // Play the file in a loop
  soundfile.loop();

  // frame rate decides how many frames per second to draw (60 is maximum)
  frameRate(15);
  noStroke();
}

// --> DRAW
void draw() {
  
  // draw a transparent square the same size as the canvas
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);

  // draw red rectangle
  fill(255, 0, 0);
  rect(x, height/2, rectangleSize, rectangleSize);

  // move red rectangel
  x = x + (direction * rectangleSize);

  // switch direction of rectangle
  if (x > width-rectangleSize) {
    direction = -1;
  } else if (x < 0) {
    direction = 1;
  }
}
