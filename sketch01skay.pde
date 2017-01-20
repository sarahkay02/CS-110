/****************************************
 * Assignment 1
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 1/26/2016

This is a sketch of an acoustic guitar. I chose to create this because 
I really enjoy music, and I often play the guitar as a way to destress. 
I brought my guitar to college and used it as a basic model for this 
assignment. I started out with the more simple designs, using line() and
ellipse() functions, like for the guitar neck and sound hole. I attempted
to create the outline of the guitar body, but couldn't figure out how to
connect multiple curves--the shape just kept looking deformed. I completed
the entire guitar and left the body outline for last. I looked online and
realized that I would need to plot many points (using curveVertex() ) in
order to get a smooth, custom shape. In order to be able to temporarily 
"see" the coordinate plane, I plotted many tiny ellipses, spaced out every
100 units (both horizontally and vertically), as a way of turning the blank
canvas into 'graph paper'. I then plotted many points (with a LOT of trial
and error) until I finally got the top half of the guitar shape. Since the
guitar is horizontally centered on y=500 units, I was able to use simple
calculations to "flip" the top outline to make a reflection, therefore
completing the guitar body. I used 'rgba' from the course website to 
choose all the colors used in this sketch.
********************************************/ 
void setup () { 
  //canvas
  size(2100,1000);
  background(255);

  //guitar body
  smooth();
  stroke(85, 65, 80);
  strokeWeight(4);
  fill(239, 215, 165);
  beginShape();
  curveVertex(1031, 473);
  curveVertex(1031, 473);
  curveVertex(1050, 343);
  curveVertex(1114, 284);
  curveVertex(1177, 273);
  curveVertex(1225, 286);
  curveVertex(1280, 318);
  curveVertex(1310, 324);
  curveVertex(1335, 318);
  curveVertex(1370, 296);
  curveVertex(1400, 275);
  curveVertex(1434, 257);
  curveVertex(1475, 244);
  curveVertex(1520, 240);
  curveVertex(1580, 250);
  curveVertex(1620, 268);
  curveVertex(1654, 300);
  curveVertex(1680, 346);
  curveVertex(1697, 416);
  curveVertex(1703, 500);
    
  curveVertex(1697, 584);
  curveVertex(1680, 654);
  curveVertex(1654, 700);
  curveVertex(1620, 732);
  curveVertex(1580, 750);
  curveVertex(1520, 760);
  curveVertex(1475, 756);
  curveVertex(1434, 743);
  curveVertex(1400, 725);
  curveVertex(1370, 704);
  curveVertex(1335, 682);
  curveVertex(1310, 676);
  curveVertex(1280, 682);
  curveVertex(1225, 714);
  curveVertex(1177, 727);
  curveVertex(1114, 716);
  curveVertex(1050, 657);
  curveVertex(1031, 527);
  curveVertex(1031, 527);
  endShape();

  //sound hole
  smooth();
  stroke(0);
  fill(59,51,7);
  ellipse(1200, 500, 100, 100);
  
  strokeWeight(1);
  noFill();
  ellipse(1200, 500, 120, 120);
  
  strokeWeight(3);
  ellipse(1200, 500, 140, 140);
  
  strokeWeight(1.5);
  ellipse(1200, 500, 160, 160);

  //guitar neck
  fill(45,45,15,245);
  noStroke();
  quad(1130, 530, 1130, 470, 500, 479, 500, 521);

  //nut
  fill(255,230,149);
  noStroke();
  quad(500, 479, 500, 521, 490, 522, 490, 478);

  //headstock
  stroke(127, 100, 61);
  strokeWeight(2);
  fill(85, 65, 8);
  beginShape();
  vertex(490, 478);
  vertex(470, 468);
  vertex(345, 460);
  vertex(345, 541);
  vertex(470, 533);
  vertex(490, 523);
  endShape(CLOSE);

  //tuning posts
  noStroke();
  fill(200);
  ellipse(450, 488, 10, 10);
  ellipse(450, 512, 10, 10);
  ellipse(415, 486, 10, 10);
  ellipse(415, 514, 10, 10);
  ellipse(380, 484, 10, 10);
  ellipse(380, 516, 10, 10);

  //tuning pegs
  noStroke();
  fill(150);
  rect(447, 458, 6, 10);
  arc(450, 458, 20, 22, 3.22, 6.43);
  rect(447, 533, 6, 10);
  arc(450, 543, 20, 22, -.22, 3.12); 
  rect(412, 456, 6, 10);
  arc(415, 456, 20, 22, 3.22, 6.43);
  rect(412, 535, 6, 10);
  arc(415, 545, 20, 22, -.22, 3.12);  
  rect(377, 454, 6, 10);
  arc(380, 454, 20, 22, 3.22, 6.43);
  rect(377, 537, 6, 10);
  arc(380, 547, 20, 22, -.22, 3.12); 
  
  //brand logo
  stroke(235, 200, 137);
  strokeWeight(4);
  noFill();
  curve(262, 408, 360, 475, 360, 525, 458, 592);
  
  //frets
  stroke(247, 247, 204);
  strokeWeight(2);
  noFill();
  line(550, 479, 550, 521);
  line(600, 478, 600, 522); 
  line(650, 478, 650, 522);
  line(696, 477, 696, 523);
  line(740, 477, 740, 523); 
  line(782, 476, 782, 524);
  line(820, 476, 820, 524);
  line(859, 475, 859, 525);
  line(896, 475, 896, 525);
  line(932, 474, 932, 526);
  line(964, 474, 964, 526);
  line(994, 473, 994, 527);
  line(1027, 473, 1027, 527);
  line(1050, 472, 1050, 528);
  line(1071, 472, 1071, 528);
  line(1091, 471, 1091, 529);
  line(1111, 471, 1111, 529);
 
  //position markers (dots on frets)
  noStroke();
  fill(255);
  ellipse(625, 500, 6, 6);
  ellipse(718, 500, 6, 6);
  ellipse(801, 500, 6, 6);
  ellipse(878, 500, 6, 6);
  ellipse(979, 490, 6, 6);
  ellipse(979, 510, 6, 6);
  ellipse(1061, 500, 6, 6);
  ellipse(1101, 500, 6, 6);

  //bridge saddle
  noStroke();
  fill(95, 69, 17);
  curve(1000, 800, 1398, 590, 1398, 410, 1000, 200);

  //bridge and pins
  stroke(255);
  strokeWeight(5);
  noFill();
  line(1410, 462, 1410, 538);

  noStroke();
  fill(255);
  ellipse(1426, 472, 7, 7);
  ellipse(1426, 483, 7, 7);
  ellipse(1426, 494, 7, 7);
  ellipse(1426, 505, 7, 7);
  ellipse(1426, 516, 7, 7);
  ellipse(1426, 528, 7, 7);

  //strings
  stroke(215, 196, 196);
  strokeWeight(1);
  noFill();
  line(500, 485, 1426, 472);
  line(500, 485, 450, 486);

  strokeWeight(1.2);
  line(500, 490, 1426, 483);
  line(500, 490, 416, 487);

  strokeWeight(1.3);
  line(500, 495, 1426, 494);
  line(500,495, 382, 488);

  strokeWeight(1.9);  
  line(500, 501, 1426, 504);
  line(500, 501, 382, 511);

  stroke(215, 192, 155);
  strokeWeight(2.6);
  line(500, 507, 1426, 515); 
  line(500, 507, 416, 510);

  strokeWeight(3);
  line(500, 513, 1426, 527);
  line(500, 513, 450, 508);
  
  //signature
  noStroke();
  fill(105, 37, 227);
  textSize(35);
  text("Sujin Kay, CS110-01 Spring 2016", 100, 910);
  stroke(105, 37, 227);

  save("GUITAR");
}

void draw () {
}

