/*
    
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'd' to erase your drawing and start with a blank screen
 * 
 */

int c = 0;
color[] colors = {color(73, 10, 61), color(189, 21, 80), color(233, 127, 2), color(248, 202, 0), color(138, 155, 15)};

PImage img;
PImage bgImage;      // display window image

// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(800, 600);

  bgImage = createImage(width, height, RGB);
  resetImage();
  img = loadImage("brush.png");
}


// draw function -- called continuously while the program is running
void draw() {
  
  // note this new kind of arguement to background - an image!
  background(bgImage);
  
  // draw image according to current scale and mouse position
  pushMatrix();
  translate(mouseX, mouseY);
 
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */
  pushStyle();
  tint(colors[c],100);
  imageMode(CENTER);
  image(img,0,0,img.width/7,img.height/7);
  popStyle();
  popMatrix();
  
  
  if(mousePressed){
    loadPixels();
    bgImage.loadPixels();
    bgImage.pixels = pixels;
    bgImage.updatePixels();  
  }
  


}


void resetImage(){
  bgImage = createImage(width, height, RGB);
    bgImage.loadPixels();
    for (int i = 0; i < bgImage.pixels.length; i++) {
      bgImage.pixels[i] = color(255, 255, 255); 
    }
  bgImage.updatePixels();
}

void keyReleased() {
  if (key == 'd') {
    resetImage();
  }
   // save your drawing when you press keyboard 's'
  else if (key=='s') {
    saveFrame("frame###.jpg");
  }
  else if (key == '1') {
    c = 0;
  }
  else if (key == '2') {
    c = 1;
  }
  else if (key == '3') {
    c = 2;
  }
  else if (key == '4') {
    c = 3;
  }
  else if (key == '5') {
    c = 4;
  }
}
