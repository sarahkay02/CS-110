/*******************************************
 * Assignment 3
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 2/25/2016
 
 This is a sketch of a Ferris wheel at night. The color of the cars change randomly and continuously.
 When the mouse is clicked in the sky, fireworks of random colors and sizes are drawn. All shapes are drawn using 
 parametrized functions, used to specify location, size, and color.
 ********************************************/

//declare global variables
int i;
float x;
float y;
float scaleCar;
float scaleSignature;
float horizon;
float angle;
int steps;
float radius;
float diameter;
float starWidth;
float starHeight;
int totalShapeCount;
color Yellow;
color Pearl;
color Random;
color Random2;
color Lavender;
color Glow;

void setup () {
  //canvas
  size(1800, 900);

  //night sky
  background(25, 37, 97);

  //ground
  horizon = height*.8;
  noStroke();
  fill(41, 91, 21);
  rect(0, horizon, width, height);

  //set color functions
  Yellow = color(234, 240, 149);
  Pearl = color(247, 242, 221);
  Lavender = color(150, 159, 235);
  Glow = color(189, 252, 253, 30); 

  //set size of stars
  drawStars(random(width), random(0, height*.75), random(width/380, width/381), random(height/270, height/271), Yellow); 

  //set size for moon
  radius = (height/9);
  drawMoon(width/6, height/7.5, radius, Glow);

  //set size for spokes
  radius = (height/3);
  drawSpokes(width/2, height/2.4, radius, Pearl);

  //set size for base poles
  radius = (height/2);
  drawBase(width/2, height/2.4, radius, Pearl);

  //set size of circles
  diameter = (height/1.5);
  drawCircles(width/2, height/2.4, diameter, Pearl);

  //set size of signature
  float scaleSignature = (height/10);
  drawSignature(width/14, height/1.1, scaleSignature, scaleSignature, Lavender);
}

void draw () {  
  //set color functions
  Random = color(random(255), random(255), random(255));
  Random2 = color(random(255), random(255), random(255));

  //set size of cars
  float scaleCar = (height/3);
  drawCars(width/2, height/2.4, scaleCar, scaleCar, Random); 
  drawCars2(width/2, height/2.4, scaleCar, scaleCar, Random2);
}

void mousePressed () {
  //set size of fireworks
  if (mouseY <= horizon) {
    Random = color(random(255), random(255), random(255));
    drawFireworks(mouseX, mouseY, int(random(height/25, height/10)), Random);
  }
}

//draw stars in sky, randomly spaced and sized
void drawStars(float x, float y, float starWidth, float starHeight, color Yellow) {
  int totalShapeCount = 120;
  int i=0;
  while (i<totalShapeCount) {
    fill(Yellow);
    noStroke();
    x = random(width);
    y = random(0, height*.75);
    starWidth = random(width/380, width/381);
    starHeight = random(height/270, height/271);
    rect(x, y, starWidth, starHeight);
    i = i+1;
  }
}

//draw moon in sky
void drawMoon(float centerx, float centery, float radius, color Glow) {
  while (radius > 3.0) {
    fill(Glow);
    noStroke();
    ellipse(centerx, centery, radius, radius);
    radius = radius*.95;
  }
}   

//draw fireworks only when mouse is pressed in sky
void drawFireworks(float centerx, float centery, float radius, color Random) {
  int steps = 40;
  float angle = 2*PI/steps; 
  for (int i=0; i<steps; i++) {
    float x = sin(angle*i)*radius + centerx;
    float y = cos(angle*i)*radius + centery; 
    stroke(Random);
    line(centerx, centery, x, y);
  }
}

//draw wheel spokes
void drawSpokes (float centerx, float centery, float radius, color Pearl) {
  //draw 20 spokes, evenly spaced
  int steps = 20; 
  float angle = 2*PI/steps;  
  for (int i=0; i<steps; i++) {   
    float x = centerx + cos(angle*i)*radius;   
    float y = centery + sin(angle*i)*radius;    
    noFill();
    stroke(Pearl); 
    strokeWeight(2);
    line(centerx, centery, x, y);
  }
}

//draw base of wheel
void drawBase (float centerx, float centery, float radius, color Pearl) {
  //draw 2 spokes as base of wheel
  int steps = 6; 
  float angle = PI/steps;  
  for (int i=2; i<5; i=i+2) {   
    float x = centerx + cos(angle*i)*radius;   
    float y = centery + sin(angle*i)*radius;    
    noFill();
    stroke(Pearl);
    strokeCap(SQUARE); 
    strokeWeight(12);
    line(centerx, centery, x, y);
  }
}

//draw circles inside wheel as structure support
void drawCircles(float centerx, float centery, float diameter, color Pearl) {
  //increasing space between circles
  for (float i=diameter; i>180; i=i*.6) {
    noFill();
    stroke(Pearl);
    strokeWeight(2);
    ellipse(centerx, centery, i, i);
  }
}

//draw oval cars (pods where people sit)
void drawCars (float centerx, float centery, float scaleCarx, float scaleCary, color Random) {
  //draw 10 cars, evenly spaced, with every other car a different color
  int steps = 20; 
  float angle = 2*PI/steps;  
  for (int i=0; i<steps; i=i+2) {   
    float x = centerx + cos(angle*i)*scaleCarx;   
    float y = centery + sin(angle*i)*scaleCary;    
    smooth();
    fill(Random);
    noStroke();
    frameRate(2);
    ellipse(x, y, scaleCarx/4.2, scaleCary/5);
  }
}

//draw circular cars
void drawCars2 (float centerx, float centery, float scaleCarx, float scaleCary, color Random2) {
  //draw 10 cars, evenly spaced, every other car a different color
  int steps = 20; 
  float angle = 2*PI/steps;
  for (int i=1; i<steps; i=i+2) {   
    float x = centerx + cos(angle*i)*scaleCarx;   
    float y = centery + sin(angle*i)*scaleCary;    
    smooth();
    fill(Random2);
    noStroke();
    frameRate(2);
    ellipse(x, y, scaleCarx/4.5, scaleCary/4.5);
  }
}

//draw signature
void drawSignature (float x, float y, float scaleSignaturex, float scaleSignaturey, color Lavender) {
  fill(Lavender);
  noStroke();
  textSize(35);
  text("Sujin Kay, CS110-01 Spring 2016", x, y) ;
}

void keyPressed() {
  //save screenshot of sketch
  if (key == 's') {
    save("screenshot.jpg");
    save("screenshot.png");
  }
}

