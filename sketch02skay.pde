/*******************************************
 * Assignment 2
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 2/10/2016
 
 This sketch depicts a beach horizon with sand, ocean, and sky. This sketch is
 interactive; when the mouse is clicked above the horizon line, clouds appear.
 When clicked in the water, randomly-colored sailboats are drawn. Lastly, when
 clicked in the sand, palm trees are drawn. To give the appearance of perspective,
 the objects shrink in size as the mouse clicks approach the horizon. Everything
 is scaled so that the image will remain proportionate, regardless of canvas size.
 Iteration was used to draw the waves in the water.  
 ********************************************/

//define variables
float horizon;             //horizon line
float scaleCloud;          //cloud scale
float scaleBoat;           //boat scale
float scaleTree;           //palm tree scale
int x;                     //initial position (x, y)
int y;
float waves;               //waves in water

void setup() {
  //canvas
  size(2000, 1200);

  //sky
  noStroke();
  noFill();
  background(122, 209, 252);

  //sun, proportional to sky 
  horizon = height/2.5;
  noStroke(); 
  fill(255, 252, 112);
  smooth();
  ellipse(width/4, horizon/2, horizon/3, horizon/3);

  //water
  noStroke();
  fill(49, 7, 190);
  rect(0, horizon, width, height);

  //beach
  noStroke();
  fill(236, 235, 168);
  rect(0, horizon*1.4, width, height);

  //waves
  float waves = horizon;
  while (waves < horizon*1.4) {
    stroke(60, 120, 246);
    strokeWeight(height/400);
    noFill();
    line(0, waves, width, waves);
    waves = waves + height/100;
  }
  
  //signature
  noStroke();
  fill(105, 37, 227);
  textSize(35);
  text("Sujin Kay, CS110-01 Spring 2016", width/14, height/10);
  stroke(105, 37, 227);
}

void draw() {
  //leave empty
}

//use mouse position to decide whether to draw in sky, water, or ground
void mousePressed() {
  if (mouseY <= horizon) {

    //set scale factor for clouds in sky 
    float scaleCloud = ((mouseY - horizon)/3);     
    drawCloud(mouseX, mouseY, scaleCloud);
  } 
  
  else if (mouseY <= horizon*1.4) {

    //set scale factor for boats in water
    float scaleBoat = ((mouseY - horizon));       
    drawBoat(mouseX, mouseY, scaleBoat);
  } 
  
  else if (mouseY > horizon*1.4) {
    if (mouseX <= width/2) {
 
      //set scale factor for trees on sand
      float scaleTree = ((mouseY - horizon)/6);
      
      //draw trees leaning towards the center, depending on mouse position
      drawTreeLeft(mouseX, mouseY, scaleTree);
    }
    
    else {
      float scaleTree = ((mouseY - horizon)/6);
      drawTreeRight(mouseX, mouseY, scaleTree);
    }
  }
}

//draw clouds
void drawCloud (int x, int y, float scaleCloud) {
  noStroke();
  fill(255);
  ellipse(x, y, 1.1*scaleCloud, scaleCloud);
  ellipse(x-.8*scaleCloud, y-.04*scaleCloud, 1.3*scaleCloud, scaleCloud); 
  ellipse(x-1.2*scaleCloud, y-.4*scaleCloud, 1.4*scaleCloud, scaleCloud); 
  ellipse(x-.4*scaleCloud, y-.6*scaleCloud, 1.2*scaleCloud, scaleCloud); 
  ellipse(x+.2*scaleCloud, y-.4*scaleCloud, 1.3*scaleCloud, .8*scaleCloud);
}

//draw boats
void drawBoat (int x, int y, float scaleBoat) {
  //body
  noStroke();
  fill(115, 101, 66);
  arc(x, y-.26*scaleBoat, scaleBoat, .55*scaleBoat, 0, 3.14);

  //mast
  stroke(115, 101, 66);
  strokeCap(ROUND);
  strokeWeight(.05*scaleBoat);
  noFill();
  line(x, y-.26*scaleBoat, x, y-1.2*scaleBoat);

  //sails
  stroke(255);
  strokeWeight(.02*scaleBoat);
  fill (random(255), random(255), random(255));
  triangle(x+.03*scaleBoat, y-.4*scaleBoat, x+.03*scaleBoat, y-1.16*scaleBoat, x+.4*scaleBoat, y-.4*scaleBoat);
  triangle(x-.03*scaleBoat, y-.4*scaleBoat, x-.03*scaleBoat, y-scaleBoat, x-.4*scaleBoat, y-.4*scaleBoat);
}

//draw palm trees on the left side of beach
void drawTreeLeft (int x, int y, float scaleTree) {
  //trunk
  stroke(85, 65, 8);
  strokeWeight(.03*scaleTree);
  fill(142, 116, 70);
  triangle(x, y, x+.6*scaleTree, y-.8*scaleTree, x-.6*scaleTree, y-.8*scaleTree);
  triangle(x, y-.8*scaleTree, x+.7*scaleTree, y-1.5*scaleTree, x-.4*scaleTree, y-1.6*scaleTree);
  triangle(x, y-1.55*scaleTree, x+.8*scaleTree, y-2.2*scaleTree, x-.2*scaleTree, y-2.4*scaleTree);
  triangle(x+.2*scaleTree, y-2.3*scaleTree, x+scaleTree, y-2.8*scaleTree, x+.05*scaleTree, y-3.1*scaleTree);
  triangle(x+.4*scaleTree, y-3*scaleTree, x+1.2*scaleTree, y-3.4*scaleTree, x+.3*scaleTree, y-3.8*scaleTree);
  triangle(x+.7*scaleTree, y-3.65*scaleTree, x+1.5*scaleTree, y-4.1*scaleTree, x+.6*scaleTree, y-4.5*scaleTree);
  
  //leaves
  stroke(68, 132, 45);
  strokeWeight(.06*scaleTree);
  fill(122, 198, 102);
  
  beginShape();
  vertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+3.1*scaleTree, y+5*scaleTree);
  curveVertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-2.2*scaleTree, y-4*scaleTree);
  curveVertex(x-4.1*scaleTree, y+5*scaleTree);
  vertex(x-2.2*scaleTree, y-4*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-4.4*scaleTree, y+.5*scaleTree);
  curveVertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-1.2*scaleTree, y-6.8*scaleTree);
  curveVertex(x-8*scaleTree, y+.6*scaleTree);
  vertex(x-.9*scaleTree, y-6.5*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+1.6*scaleTree, y+4.5*scaleTree);
  curveVertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+4.6*scaleTree, y-5.2*scaleTree);
  curveVertex(x+5.8*scaleTree, y+4.2*scaleTree);
  vertex(x+4.6*scaleTree, y-5.19*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-6.9*scaleTree, y+2.7*scaleTree);
  curveVertex(x+1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+3.7*scaleTree, y-2.5*scaleTree);
  curveVertex(x+2.6*scaleTree, y+5.3*scaleTree);
  vertex(x+3.69*scaleTree, y-2.5*scaleTree);
  endShape(CLOSE);
  
  //coconuts
  noStroke();
  fill(59, 51, 7);
  ellipse(x+.8*scaleTree, y-4.6*scaleTree, .8*scaleTree, .8*scaleTree);
  ellipse(x+1.5*scaleTree, y-4.4*scaleTree, .8*scaleTree, .8*scaleTree);
  ellipse(x+1.3*scaleTree, y-5.06*scaleTree, .8*scaleTree, .8*scaleTree);
}

//draw trees on the right side of beach
void drawTreeRight (int x, int y, float scaleTree) {
  //trunk
  stroke(85, 65, 8);
  strokeWeight(.03*scaleTree);
  fill(142, 116, 70);
  triangle(x, y, x-.6*scaleTree, y-.8*scaleTree, x+.6*scaleTree, y-.8*scaleTree);
  triangle(x, y-.8*scaleTree, x-.7*scaleTree, y-1.5*scaleTree, x+.4*scaleTree, y-1.6*scaleTree);
  triangle(x, y-1.55*scaleTree, x-.8*scaleTree, y-2.2*scaleTree, x+.2*scaleTree, y-2.4*scaleTree);
  triangle(x-.2*scaleTree, y-2.3*scaleTree, x-scaleTree, y-2.8*scaleTree, x-.05*scaleTree, y-3.1*scaleTree);
  triangle(x-.4*scaleTree, y-3*scaleTree, x-1.2*scaleTree, y-3.4*scaleTree, x-.3*scaleTree, y-3.8*scaleTree);
  triangle(x-.7*scaleTree, y-3.65*scaleTree, x-1.5*scaleTree, y-4.1*scaleTree, x-.6*scaleTree, y-4.5*scaleTree);
 
 //leaves
  stroke(68, 132, 45);
  strokeWeight(.06*scaleTree);
  fill(122, 198, 102);
  
  beginShape();
  vertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-3.1*scaleTree, y+5*scaleTree);
  curveVertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+2.2*scaleTree, y-4*scaleTree);
  curveVertex(x+4.1*scaleTree, y+5*scaleTree);
  vertex(x+2.2*scaleTree, y-4*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+4.4*scaleTree, y+.5*scaleTree);
  curveVertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+1.2*scaleTree, y-6.8*scaleTree);
  curveVertex(x+8*scaleTree, y+.6*scaleTree);
  vertex(x+.9*scaleTree, y-6.5*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-1.6*scaleTree, y+4.5*scaleTree);
  curveVertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-4.6*scaleTree, y-5.2*scaleTree);
  curveVertex(x-5.8*scaleTree, y+4.2*scaleTree);
  vertex(x-4.6*scaleTree, y-5.19*scaleTree);
  endShape(CLOSE);
  
  beginShape();
  vertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x+6.9*scaleTree, y+2.7*scaleTree);
  curveVertex(x-1.2*scaleTree, y-4.4*scaleTree);
  curveVertex(x-3.7*scaleTree, y-2.5*scaleTree);
  curveVertex(x-2.6*scaleTree, y+5.3*scaleTree);
  vertex(x-3.69*scaleTree, y-2.5*scaleTree);
  endShape(CLOSE);

  //coconuts
  noStroke();
  fill(59, 51, 7);
  ellipse(x-.8*scaleTree, y-4.6*scaleTree, .8*scaleTree, .8*scaleTree);
  ellipse(x-1.5*scaleTree, y-4.4*scaleTree, .8*scaleTree, .8*scaleTree);
  ellipse(x-1.3*scaleTree, y-5.06*scaleTree, .8*scaleTree, .8*scaleTree);
}

void keyPressed() {
  //save screenshot of sketch
  if (key == 's') {
    save("screenshot.jpg");
    save("screenshot.png");
  }
}
