/**
 * Recursion
 * 
 * Using recursion means that you create a function that calls itself.
 * It is important to program an escape condition. Otherwise you create
 * an endless loop.
 */

// Array used as a color palette 
color[] colors = {color(73,10,61), color(189,21,80), color(233,127,2), color(248,202,0), color(138,155,15)};
int c = 0;

void setup() {
  size(800, 600);    // set size of the sketch
  noStroke();        // do not draw a outline
  noLoop();          // do use loop run draw only one time
}

void draw() {
  background(0);    // draw a black background
  
  // call the recursion function
  drawRecursive(width/2, height/2, 10);
}

// Recursion function
void drawRecursive(int x, int y, int level) {

  int s = level * 65;
  
  blendMode(ADD);
  
  // draw a circles
  c = c%5;
  fill(colors[c],40);
  ellipse(x, y, s, s);

  // when the level is more the 1 call the function again
  if (level > 1) {
    level = level -1;
    c += 1;
    drawRecursive(x, y, level);
    
  }
}
