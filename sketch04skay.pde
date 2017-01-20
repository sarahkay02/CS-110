/********************************************
 * Assignment 4
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 3/17/2016
 
 This is an interactive sketch of a pot of soup being made. 
 If the mouse is clicked above the pot, either carrots or 
 potatoes (a maximum of 5 each) are drawn and will fall into
 the soup. Once the objects reach the soup pot, they will 
 disappear into the soup. Classes were used to draw the ingredients.  
 ********************************************/

//an array of all the dynamically created objects
Carrot [] carrots;
Potato [] potatoes;

//an index into the Carrot array to show where to save the next new object
int idxCarrots = 0;
int idxPotatoes = 0;

//max number of carrots and potatoes that can be drawn at once
int maxCarrots = 5;
int maxPotatoes = 5;

void setup () {
  //canvas
  size(1800, 1200);

  //max number of carrots that can be displayed at once
  carrots = new Carrot[5];
  potatoes = new Potato[5];
}

void draw () {
  //wall and countertop
  background(183, 220, 283);
  noStroke();
  fill(119, 94, 59);
  rect(0, height*.6, width, height);

  //soup container 
  drawSoup(); 

  //recipe
  drawRecipe();

  //signature
  //set size of signature
  float scaleSignature = (width/35);
  drawSignature(width/14, height/1.1, scaleSignature);

  //use a for-loop to display all ingredients and advance their animations
  //test each element of the arrays to see if it's an object or empty
  for (int i=0; i<maxCarrots; i++) {
    if (carrots[i] !=null) {
      carrots[i].display();
      carrots[i].step();
    }
  }
  for (int i = 0; i<maxPotatoes; i++) {
    if (potatoes[i] !=null) {
      potatoes[i].display();
      potatoes[i].step();
    }
  }
}

void drawSoup() {
  //draw pot handles (behind pot)
  stroke(50);
  strokeWeight(width/35);
  noFill();
  arc(width/4, height*.8, width/7, height/12, PI/3, PI*1.5);
  arc(width*.75, height*.8, width/7, height/12, -PI/2, PI*.66);

  //draw soup pot
  strokeWeight(3);
  fill(150);
  rect(width/4, height*.6, width/2, height/2);
  ellipse(width/2, height*.6, width/2, height/3);

  //draw pot handles (in front of pot)
  strokeWeight(width/35);
  noFill();
  arc(width/4, height*.8, width/7, height/12, PI/3, PI);
  arc(width*.75, height*.8, width/7, height/12, -PI/3, PI*.66);

  //draw soup
  noStroke();
  fill(215, 204, 154);
  arc(width/2, height*.67, width*.45, height/3, PI, 2*PI);
  arc(width/2, height*.599, width/2, height/3, PI*.14, PI*.86);

  //draw ladel in soup
  stroke(105, 94, 43);
  strokeWeight(3);  
  fill(169, 155, 115);
  beginShape();
  vertex(width*.655, height*.65);
  vertex(width*.758, height*.362);
  vertex(width*.754, height*.348);
  vertex(width*.741, height*.339);
  vertex(width*.73, height*.348);
  vertex(width*.63, height*.65);
  endShape();
}

//draw the recipe on wall
void drawRecipe() {
  stroke(0);
  fill(255);
  rect(width/10, height/10, width/8, height/4);
  textSize(width/75);
  fill(0);
  text("Recipe", width/7, height/7);
  line(width/8, height/6, width/5, height/6);
  line(width/7, height/5.5, width/5, height/5.5);
  line(width/8, height/5, width/5, height/5);
  line(width/8, height/4, width/5, height/4);
  line(width/8, height/3.75, width/5, height/3.75);
  line(width/7, height/3.5, width/5, height/3.5);
  line(width/8, height/3.25, width/5, height/3.25);
}

void mousePressed() {
  //only draw objects if mouse is clicked directly above soup pot
  if (mouseX >= width/4 && mouseX <= width*.75 && mouseY <= height/2) {
    if (mouseX <=width/2) {
      carrots[idxCarrots] = new Carrot(mouseX, mouseY);
      idxCarrots = (idxCarrots+1) % carrots.length;
    } else {
      potatoes[idxPotatoes] = new Potato(mouseX, mouseY);
      idxPotatoes = (idxPotatoes+1) % potatoes.length;
    }
  }
}

//draw signature
void drawSignature (float x, float y, float scaleSignature) {
  fill(255);
  noStroke();
  textSize(scaleSignature);
  text("Sujin Kay, CS110-01 Spring 2016", x, y) ;
}

void keyPressed() {
  //save screenshot of sketch
  if (key == 's') {
    save("screenshot.jpg");
    save("screenshot.png");
  }
}




