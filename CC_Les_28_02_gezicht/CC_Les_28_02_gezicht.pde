/*
  CC_les_28_02_gezicht
  
  A sketch that draw an image  multiple times in a grid
  In interactis with the mouse.
*/

// --> Variables
PImage img;          // object to old the image
int size = 80;       // size of grid element
int maxSteps;        // number of rows/columns in th egrid

// --> Setup is run once
void setup() {
  size(600, 600);
  
  // load the image
  img = loadImage("portrait.jpg");
  
  // calculate how many rows/collumns we need to fill the screen
  maxSteps =  width / size ;
  
  // draw image from the center
  imageMode(CENTER);
  
  // set color mode
  colorMode(HSB,360,100,100);
}

// -> Draw loop
void draw() { 
  background(0);
 
  // i = i+1 is the same as i++
  for (int i=0; i<maxSteps; i++) {
    for (int j=0; j<maxSteps; j++) {
      
      // calculate the xy position of ythe image in the grid
      // based on one for loop for the horizontal position and
      // one for loop for the vertical position
      int x = size/2 +  i * size;
      int y = size/2 +  j * size;
      
      // Get the distance of the image to the mouse
      float d = dist(x,y,mouseX,mouseY);
      // conver the distance to a value between 1 and 0.1
      float s = map(d,0,width,1,0.1);
      
      // these are the houses..
      // draw the image using a function
      drawElement(x, y, s);
    }
  }
} // END draw loop

// This is a custom function that I wrote
// this is the blueprint for the house
void drawElement(int x, int y, float size) {
  // set color based on size variable
  tint(size*360,100,100);
  image(img,x,y,(img.width*0.3)*size ,(img.height*0.3)*size );
}
