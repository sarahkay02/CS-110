/********************************************
 * Assignment 6
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 4/14/2016
 
 This is a sketch of a coffee mug, with a collage of Crater Lake
 printed on it. The original picture is in the center of the mug, 
 with modified versions around it. The four image processing 
 techniques that I used are: tinting (Simple Filter), Obamicon-style
 (Image Segmentation), sharpen (Area-Based Filter), and rectangle
 pointillism (Image visualization). 
 ********************************************/
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

//matrix for convolution: img3
float [][] matrix = { {-1, -1, -1}, 
                      {-1, 12, -1}, 
                      {-1, -1, -1} };

void setup () {
  //canvas
  size(1800, 1200);
  background(203, 208, 245);

  //draw coffee mug
  drawMug();

  //load images
  img1 = loadImage("craterlake.jpg");
  img2 = loadImage("craterlake.jpg");
  img3 = loadImage("craterlake.jpg");
  img4 = loadImage("craterlake.jpg");
  img5 = loadImage("craterlake.jpg");

  //load images onto mug
  imageMode(CENTER);

  //TOP LEFT: img1
  //purple-pink tint (simple filter)
  /** Code adapted from Prof. Xu's "blackWhite" example in class **/
  img1.loadPixels();
  for (int i=0; i < img1.pixels.length; i++) {
    color c = img1.pixels[i];
    img1.pixels[i] = color(red(c), green(c)*.3, blue(c));
  }
  img1.updatePixels();

  //specify location and size
  pushMatrix();
  translate(width/3, height/3);
  rotate(-PI/25);
  img1.resize(width/5, height/4);
  image(img1, 0, 0);
  popMatrix();

  //TOP RIGHT: img2
  //pointillism with rectangles (image visualization)
  /** Code adapted from Prof. Xu's "pointillism" example in class **/
  //specify location and size
  pushMatrix();
  translate(width*.58, height/3);
  rotate(PI/25);
  img2.resize(width/5, height/4);
  image(img2, 0, 0);
  img2.loadPixels(); 
  for (int i=0; i<14000; i++) {
    addRectPoint(int(random(img2.width)), int(random(img2.height)));
  }
  img2.updatePixels();
  popMatrix();

  //BOTTOM LEFT: img3
  //convolution filter: sharpen (area-based filter) 
  /** Code adapted from a mix of both Prof. Xu's "convolution.pde" example in class,
   and Daniel Shiffman's "Sharpen" tutorial on processing.org **/
  //specify location and size  
  pushMatrix();
  translate(width/3, height*.7);
  rotate(PI/25);
  img3.loadPixels();
  for (int y = 0; y <img3.height; y++) {
    for (int x = 0; x < img3.width; x++ ) {
      img3.pixels[x + y*img3.width] = convolution(x, y, img3);
    }
  }
  img3.updatePixels();

  image(img3, 0, 0, width/5, height/4);
  popMatrix(); 

  //BOTTOM RIGHT: img4
  //posterize, obamicon-style but with different shades of "nature" colors
  /** Code adapted from "obamicon" example in the Processing textbook (pg 387) **/
  color green = color(5, 93, 50);
  color brown = color(144, 129, 80);
  color turquoise = color(83, 173, 179);
  color sand = color(221, 198, 171);

  img4.loadPixels();
  for (int i=0; i < img4.pixels.length; i++) {
    color c = img4.pixels[i];
    float total = red(c)+green(c)+blue(c);
    //darkest colored pixels will be brown
    if (total < 180) {
      img4.pixels[i] = color(brown);
    }
    //2nd darkest pixels will be green
    else if (total < 300) {
      img4.pixels[i] = color(green);
    }
    //lighter pixels will be turquoise
    else if (total < 490) {
      img4.pixels[i] = color(turquoise);
    }
    //lightest pixels will be sandy
    else {
      img4.pixels[i] = color(sand);
    }
  }
  img4.updatePixels();

  //specify location and size
  pushMatrix();
  translate(width*.58, height*.7);
  rotate(-PI/25);
  img4.resize(width/5, height/4);
  image(img4, 0, 0);
  popMatrix();

  //CENTER: img5
  img5.resize(width/4, height/4);
  image(img5, width/2.2, height/1.95);
}

void draw() {
}

void drawMug () {
  //draw coffee mug
  smooth();
  stroke(160);
  strokeWeight(3);
  fill(255);
  ellipse(width/2.2, height*.9, width/2, height/7);
  rectMode(CENTER);
  noStroke();
  rect(width/2.2, height/2, width/2, height*.8);
  stroke(160);
  line(width*.705, height*.1, width*.705, height*.9);
  line(width*.204, height*.1, width*.204, height*.9);
  fill(246, 246, 240);
  ellipse(width/2.2, height/10, width/2, height/7);

  //draw mug handle
  stroke(160);
  strokeWeight(3);
  fill(255);
  arc(width*.707, height/2, width/3, height/1.75, -PI/2, PI/2);
  fill(203, 201, 245);
  arc(width*.707, height/2, width/5, height/2.5, -PI/2, PI/2);

  //label the mug
  PFont font;
  font = loadFont("LucidaCalligraphy-Italic-44.vlw");
  textFont(font);
  fill(111, 5, 220);
  text("Crater Lake, Oregon", width/3, height*.9);
}

void addRectPoint (int x, int y) {
  int i = x + y*img2.width;
  color c = img2.pixels[i];
  fill(c);
  noStroke();
  rectMode(CENTER);
  rect(x-img2.width/2, y-img2.height/2, 10, 10);
}

color convolution(int x, int y, PImage img) {
  int halfSize = matrix.length/2;
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-halfSize;
      int newY = y+j-halfSize;
      int idx = img3.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img3.pixels.length-1);
      // Calculate the convolution
      r += (red(img3.pixels[idx]) * matrix[i][j]);
      g += (green(img3.pixels[idx]) * matrix[i][j]);
      b += (blue(img3.pixels[idx]) * matrix[i][j]);
    }
  }
  return color(r, g, b);
}

void keyPressed() {
  //save screenshot of sketch
  if (key == 's') {
    save("photocollage.jpg");
    save("photocollage.png");
  }
}
