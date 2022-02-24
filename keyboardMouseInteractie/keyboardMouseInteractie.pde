// een boolean is een variable die waar of niet waar is
boolean showMe = false;
// houdt bij hoevaak je op de muis hebt geklikt
int mouseClickCounter = 0;
// een array met kleuren
color colors[] = { #F4EEEA, #9A9B9D, #8C452E, #E14529, #212129};

void setup() {
  size(640, 480);
}

void draw() {

  background(colors[4]);
  
  // geef feedback hoevaak je op de muis hebt geklikt
  fill(colors[1]);
  text("je hebt: "+mouseClickCounter+" keer op de muis geklikt", 20, 20);

  // deze tekst is zichtbaar afhankelijk of "showMe" wel of niet waar is
  if (showMe == true) {
    pushStyle();
    fill(colors[0]);
    textAlign(CENTER); // lijn de tekstt uit vanaf het midden
    textSize(18);      // maak de grootte van de tekst 18 pixels
    text("deze tekst wordt zichtbaar/onzichtbaar met de q toets op je keyboard", width/2, height/2);
    popStyle();
  }
  
  pushMatrix();
  translate(mouseX,mouseY); // verplaats het blokje met de muis
  rectMode(CENTER); // teken het vierkantje vantuit het midden
  fill(colors[3]);
  rect(0,0,70,70);
  popMatrix();
  
  // teken een cirkel die groter wordn naarmate je meer op de muis klikt
  int diameter = 4 + (mouseClickCounter * 4);
  fill(colors[2]);
  circle(width/2,height-70,diameter);
  
} // END draw

void keyPressed() {
  if (key == 'w') {
    println("Je hebt op de letter w gedrukt");
  }
}

void keyReleased() {
  if (key == 'q') {
    println("Je hebt op de letter q gedrukt");
    if (showMe == false) { 
      showMe = true;
    } else if (showMe == true) { 
      showMe = false;
    }
  }
}

void mousePressed() {
  println("je hebt de muisknop ingedrukt");
}

void mouseReleased() {
  println("je hebt de muisknop losgelaten");
  mouseClickCounter = mouseClickCounter + 1;
}
