/********************************************
 * Assignment 7, PART 2
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 4/27/2016
 
 This sketch is a data visualization of the statistics for
 the top 50 countries in the world that had the highest GDP
 per capita (measured in current US$) values in the year 2014.
 A large skyscraper is drawn, and each country is represented
 by one of the windows on the building. 
 
 The countries are organized in ascending order
 (i.e., the bottom left window represents the country with the 
 50th highest GDP/capita, and the top right window represents
 the country with the highest GDP/capita). I put the countries 
 with the highest values at the top of the building in order to
 mimic "executive floors", to represent high productivity and
 good economic health. Likewise, countries with lowest values are
 placed at the "basement floors".
 
 Interaction: to view the statistics (GDP/capita, annual % growth,
 and annual GDP/capita growth) for each country, hover the mouse
 over any window, and it will light up (as if that country's members
 are working hard in their office). At the same time, that country's
 statistics will be printed on the cloud next to the building. 
 ********************************************/

String[] data;
Item[] items;
float[] growthItems;

void setup() {
  //canvas
  size(1400, 1200);
  background(179, 215, 236);

  //draw the background
  drawBuilding();
  drawCloud();

  //load data from file as an array of strings
  /* Code adapted from Prof. Xu's class example, "parse2" */
  data = loadStrings("Cleaned Data.csv");

  //create object array
  //length-1 because we are throwing away line 0
  items = new Item[data.length-1];

  //fill object array
  for (int i=1; i < data.length; i++) {

    //split each line into pieces on ","
    String[] pieces = data[i].split(",");

    //start -1 because we started i at 1 to skip 
    items[i-1] = new Item(pieces[0], int(pieces[1]), float(pieces[2]), float(pieces[3]));
  }

  //sort in descending order of GDP/capita values
  selectionSortGDP(items);

  //calculate the values for annual growth in GDP/capita
  //set growthItems to growth of all items
  growthItems = growth(items);

  //prints the data into sentences in the console 
  //change "i < items.length" to 50 to get top 50 countries only
  //also uncomment String msg to print

  //for (int i=0; i < 50; i++) {
  //  println(items[i]);
  //}

  //print title at top of screen
  textAlign(CENTER);
  textSize(width/35);
  fill(22, 47, 131);
  text("2014 Wor d GDP per capita data", width*.474, height/20);

  //print signature at bottom of screen
  textAlign(LEFT);
  textSize(width/40);
  fill(0);
  text("Sujin Kay,", width*.65, height*.9);
  text("CS110-01 Spring 2016", width*.65, height*.94);
}

void draw () { 
  int I = 0;

  //draw windows on the building
  //draw from top to bottom, right to left
  //10 windows per row
  for (float j = height*.275; j < height*.97; j = j+height/13.33) { 

    //5 windows per column
    for (float i = width*.545; i > width*.23; i = i-width/13) {
      stroke(0);
      fill(235);
      rect(i, j, width/18, height/16);

      //if mouse hovers over a window, it will light up (yellow)
      if (dist(mouseX, mouseY, i, j) < width/40) {
        stroke(0);
        fill(235, 225, 140);
        rect(i, j, width/18, height/16);

        //country's statistics will pop up in the cloud when mouse hovers over its respective window
        //redraw the cloud each time so that the words don't overlap
        drawCloud();

        textAlign(LEFT);
        fill(106, 44, 251);
        textSize(width/40);
        text(items[I].getCountry(), width*.68, height/3.7); 
        fill(122, 100, 246);
        textSize(width/50);
        text("GDP/capita (current US$): " + items[I].getGDP(), width*.62, height/3.1);
        fill(156, 128, 246);
        text("Annual % growth: " + items[I].getPercent(), width*.64, height/2.75);
        fill(187, 149, 246);
        text("Annual change in GDP: " + growthItems[I], width*.64, height/2.48);
      }
      //increment to next set of data
      I++;
    }
  }
}

void drawBuilding() {
  // grass
  fill(57, 145, 93);
  rect(0, height*.96, width, height);

  //building top
  stroke(0);
  strokeWeight(3);
  fill(150);
  triangle(width/2.54, height/14, width/2.56, height/14, width/2.55, height/80);
  rectMode(CENTER);
  rect(width/2.55, height*.57, width/18, height);
  rect(width/2.55, height*.64, width/4.2, height);
  rect(width/2.55, height*.65, width/3.6, height);

  //main building
  rect(width/2.55, height*.72, width/2.4, height);
}

void drawCloud() {
  //cloud
  noStroke();
  fill(255);
  ellipse(width*.81, height/4.2, width/8, height/12);
  ellipse(width*.7, height/3.9, width/6, height/10);
  ellipse(width*.9, height/3.5, width/5, height/8);
  arc(width*.602, height/2.8, width/3, height/6, -PI/2, PI/2);
  ellipse(width*.79, height/2.35, width/4.5, height/10);
  ellipse(width*.94, height/2.7, width/5, height/8);
  ellipse(width*.8, height/3, width/6, height/6);
}


//sort everything in descending order of GDP/capita values
/* Code adapted from selectionSort example in the Processing class textbook */
void selectionSortGDP (Item[] A) {
  int highest;
  for (int i=0; i < A.length; i++) {
    //find position of the largest element
    highest = i;
    for (int j = i+1; j < A.length; j++) {
      if (A[j].getGDP() > A[highest].getGDP()) {
        highest = j;
      }
    }

    //swap the contents of A[i] and A[highest]
    Item temp = A[i];
    A[i] = A[highest];
    A[highest]= temp;
  }
}

//get annual growth in US$
float[] growth(Item [] B) {
  //divide percent by 100, then multiply by GDP/capita
  float growth[] = new float[B.length-1];
  for (int i=0; i < B.length-1; i++) {
    float percent = items[i].getPercent();
    float gdp = items[i].getGDP();
    growth[i] = (percent/100)*gdp;
  }
  return growth;
}

void keyPressed() {
  //save screenshot of sketch
  if (key == 's') {
    save("screenshot.jpg");
    save("screenshot.png");
  }
}

