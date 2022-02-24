import processing.pdf.*;

PFont font;

int mode = 2;
int fontSize = 64;

boolean doPDFrecord = false;

String feedURL= "http://feeds.nos.nl/nosnieuwsalgemeen";
String headLine;
String[] headLineWords;

// COLOR Pallete
color[] palette = {#C7C506,#F66451,#EA0BB8,#002450,#34827F,#C7C506,#F66451,#EA0BB8};
color bg = palette[0];



// --> SETUP
void setup(){
  size(600,900);
   
  //printArray(PFont.list());
  font = createFont("Futura-Medium",fontSize);
  textFont(font);
  textSize(64);
  
  headLine =  getRandomHeadline();
  headLineWords = split(headLine," ");
  println(headLine);

}

// --> DRAW
void draw(){
   // save PDF
  if(doPDFrecord){
    beginRecord(PDF, "poster-#####.pdf");
    // if we do not set it explicitly here
    // it is not done in the PDF
    textFont(font);
    textSize(64);
  }
  
  
  
  // draw background
  background(bg);
  
  // draw poster
  if(mode ==0){
    // just display the text
    text(headLine,20,20,width-20,height-20);
    
  }
  else if(mode ==1){
    
    // calculate line height
    int lineSpacing = (height-fontSize) / headLineWords.length;
    
    // loop through all the words
    for(int i=0; i<headLineWords.length; i++){
      // calculate noise value
      float n = noise(i/10.0,headLineWords[i].length()/10.0);
      // calculate x position based on noise
      float x = n * (width-textWidth(headLineWords[i]));
      // calculate y position
      float y = fontSize + i * lineSpacing;
      //draw the word
      text(headLineWords[i], x,y);
    }
   
  }
  else if(mode == 2){
    
    // calculate line height
    int lineSpacing = (height-fontSize) / headLineWords.length;
    
    // loop through all the words
    for(int i=0; i<headLineWords.length; i++){
      // calculate noise value
      float n = noise(i/10.0,headLineWords[i].length()/10.0);
      // calculate x position based on noise
      float x = n * (width-textWidth(headLineWords[i]));
      // calculate y positio
      float y = fontSize + i * lineSpacing;
      
      //draw shapes
      float nc = noise(headLineWords.length/10.0);
      int ci = int(map(nc,0,1,0,palette.length-1));
      
      // set color (white if same color as background)
      color theFill = palette[ci];
      if(palette[ci] == bg){
        theFill =color(255);
      }
      
      // draw the rectangles
      fill(theFill);
      noStroke();
      float sc = 0.8;
      rect(0,y-fontSize*sc,x-10,fontSize*sc);
      rect(10+x+textWidth(headLineWords[i]),y-fontSize*sc,width,fontSize*sc);
      
      //draw the word
      fill(255);
      text(headLineWords[i], x,y);
    }
   
  }
  
   // save PDF
  if(doPDFrecord){
    endRecord();
    doPDFrecord = false;
  }
}



// Get a random headline from the NOS news
String getRandomHeadline(){
  
  XML xml = loadXML(feedURL);
  XML[] items = xml.getChildren("channel/item");
  
  int r = int(random(0,items.length));
  XML titleXML = items[r].getChild("title");
  String title = titleXML.getContent();
 
  return title;

}

/*
 Here all the keyboard interactions are being handled
*/
void keyReleased(){
  
  // Get a random new headline
  if(key == 'q'){
    headLine =  getRandomHeadline();
    println(headLine);
    // divide sentence in words put the words in an array
    headLineWords = split(headLine," ");
    bg = palette[int(random(0,palette.length))];
  }
  
  // switch to next display mode
  if(key == 'w'){
    mode += 1;
    mode = mode%3;
    println(mode);
  }
  
  // save as PDF
  if(key == 'e'){
    doPDFrecord = true;
    println("save PDF");
  }
}
