/*
  CC_les_28_02_gezicht
 
 A sketch that draw an graphic  multiple times in a grid
 In interactis with the mouse.
 
 This is the funky version with som extras
 */

// --> Variables
PImage img;          // object to old the image
int size = 30;       // size of grid element
int maxSteps;        // number of rows/columns in th egrid
boolean go = true;
float angles[];

// --> Setup is run once
void setup() {
  size(600, 600);

  // load the image
  img = loadImage("portrait.jpg");

  // calculate how many rows/collumns we need to fill the screen
  maxSteps =  width / size ;

  angles = new float[maxSteps*maxSteps];

  for (int i=0; i<angles.length; i++) {
    angles[i] = i/60.0;
  }

  // draw image from the center
  imageMode(CENTER);

  // set color mode
  colorMode(HSB, 360, 100, 100);
}

// -> Draw loop
void draw() {
  background(0);

  // change size every 10 seconds
  if (frameCount%600==1) {
    size = int(random(30, 60));
  }

  int counter = 0;
  // i = i+1 is the same as i++
  for (int i=0; i<maxSteps; i++) {
    for (int j=0; j<maxSteps; j++) {

      // calculate the xy position of ythe image in the grid
      // based on one for loop for the horizontal position and
      // one for loop for the vertical position
      int x = size/2 +  i * size;
      int y = size/2 +  j * size;

      // Get the distance of the image to the mouse
      float d = dist(x, y, mouseX, mouseY);
      // conver the distance to a value between 1 and 0.1
      float s = map(d, 0, width, 1.2, 0.1);

      // these are the houses..
      // draw the image using a function
      drawElement(counter, x, y, s);
      counter ++;
    }
  }

  for (int i=0; i<angles.length; i++) {
    angles[i] += 0.1;
  }
} // END draw loop

// This is a custom function that I wrote
// this is the blueprint for the house
void drawElement(int c, int x, int y, float s) {

  noStroke();
  int numCircle = 10;

  float offsetX = size/10.0 * sin(angles[c]);
  float offsetY = size/10.0 * sin(angles[c]);


  // draw 10 circles
  for (int i=0; i<numCircle; i++) {
    float scaleFactor = 1 - (i/float(numCircle));
    fill(s*360, 100, 100, 75);
    circle(x + offsetX, y + offsetY, (s*size)* scaleFactor);
  }
}

void keyReleased() {
  go = ! go;
}
