/*
  DCI: Creative Coding 101
  lesson2: MultiNightRider
  
  This sketch is inspired by the Nightrider sketch.
  What if we do not have on rectangle moving backward and foreward
  But fill the whole screen with them.
  ... and make them all a different color
  ... and give them a stagrd begin position
  
  For more processing information:
  https://processing.org/reference/
*/

int rectangleSize = 50;        // size of rectangle
int colorStep = 0;             // this decides the color offset per square
int numRows = 12;              // number of rows or squares
int[] xArray = new int[0];     // array for the x positions of the squares
int[] dirArray = new int[0];   // array for the directions of the squares
/* 
  For more information on what is an array look here:
  https://processing.org/tutorials/arrays/
  https://www.youtube.com/watch?v=NptnmWvkbTw&list=PLRqwX-V7Uu6bO9RKxHObluh-aPgrrvb4a
*/

// --> SETUP
void setup() {
  size(960, 540);
  
  // fill arrays with initial values
  for(int i=0;i<numRows;i++){
    xArray = append(xArray,rectangleSize);
    dirArray = append(dirArray,1);
  }

  // set framerate
  frameRate(25);
  
  // do not use stroke
  noStroke();
  
  // use HSB colors instead of RGB
  colorMode(HSB,360,255,255);
}

// --> DRAW
void draw() {
  
  // draw transparent rectangle
  fill(0,0,0, 15);
  rect(0, 0, width, height);

  // loop throug all the squares
  for (int i=0; i<xArray.length; i++) {
    
    // set y position of the square
    int y = i* rectangleSize;

    // set the hue 
    // using the %360 means it wil stay whithin the range of 0-360
    int h = (colorStep + (i*20) )%360;
    
    // draw square
    fill(h, 255, 255);
    square(xArray[i],y, rectangleSize);

    // move a square
    xArray[i] = xArray[i] + (dirArray[i] * rectangleSize);
    
    // change direction of square
    if ( xArray[i] > width-rectangleSize) {
      dirArray[i] = -1;
      
    } else if (xArray[i] < 0) {
      dirArray[i] = 1;
    }
    
  }
  
  // step through teh colors so that every square slowly changes its color
  colorStep = colorStep + 10;
}
