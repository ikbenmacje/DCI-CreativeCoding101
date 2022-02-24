/**********************************************************
 SAVE SKETCH TO ANIMATION
 
 Step 1.
 Set the framerate of your sketch to the framerate or your animation
 with the command frameRate(30).
 
 Step 2.
 Put at the bottom of your draw loop the saveFrame("frames/frame######.tiff") fuction.
 This will save every drawn frame to an image in the frames folder in your sketch folder
 Press ctrl+k (windows) or Command+K (osx) to open sketch folder
 
 Step 3.
 Run the sketch as long as you want the animation to be...
 
 Step 4.
 Stop the sketch.
 
 Step 5.
 Go to the menubar and the go to Tools -> Movie Maker
 Select de folder with the images you just made.
 Optional: change frameRate / Compression
 Optional: add sound to animation
 Then press: "Create Movie.." and choose name and location of file.
 
 
 *********************************************************/


float noiseOffset = 0;                 // for moving through the noise
color theBackground = color(250, 239, 121);         // set color background
color theArcs =  color(0);          // set color for objects

// SETUP call this ONCE on startup
void setup() {
  size(600, 600);
  noStroke();
  background(theBackground);
  
  //Step 1.
  // my movie is going to be 30 frames per second
  // so I set my frameRate also to 30 frames per second
  frameRate(30);
}

// DRAW call this over and over again
void draw() {
 
  // instead of a backgorund we draw a
  // semi transparent rectangle
  fill(theBackground,10);
  rect(0,0,width,height);

  // first loop for x position
  for (int i=0; i<10; i++) {
    // second loop for y position
    for (int j=0; j<10; j++) {
      // calculate the x & y psoition of the object
      // we heva 10 rows and 10 columns
      int x = 75 + i * 50;
      int y = 75 + j * 50;
      
      // set the color for the object
      fill(theArcs);
      pushMatrix();
      // translate to the location of the object
      translate(x,y);                    
      // create a noise value
      // https://processing.org/reference/noise_.html
      // https://www.youtube.com/watch?v=8ZEMLCnn8v0
      float n = noise(x,y,noiseOffset);  
      // map the noise value (between 0-1) to an angle
      // https://processing.org/reference/map_.html
      float angle = map(n,0,1,0,360);
      // do the rotation
      rotate(radians(angle));
      // draw the arc
      arc(0,0,30,30,0,radians(270));
      popMatrix();
      
    }
  }
  // move through the noise
  noiseOffset += 0.008;
  
  // Step 3.
  // save what we draw on screen to a file
  // we save as tiff which is a large fiel, but uncompressed so the saving goes quick
  saveFrame("frames/frame####.tiff");
}
