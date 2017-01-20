/*******************************************
 * Assignment 5
 * Name: Sarah Sujin Kay
 * E-mail: skay@haverford.edu
 * Course: CS 110 - Section 01
 * Submitted: 3/31/2016

This is a sketch of a sea turtle in an aquarium. The aquarium
background has corals and underwater plants, which were both 
designed using recursion. The sea turtle swims around the tank, 
and it has additional movement in its fins. The turtle's movement
follows an invisible target that is randomly placed and updated, 
so that the turtle appears to swim more natrually. 

In addition, the turtle should (hopefully) react to other creatures 
in the aquarium. If it gets too close to another creature, the 
turtle will get scared and hide its head within its shell. 
 ********************************************/
 
// The array of objects 
AnimatedObject[] objs = new AnimatedObject[20];
// image file will be loaded in setup()
PImage img;

// Setup the sketch 
void setup() {
  size(800, 600);
  // Recursively drawn background from image provided by you
  img = loadImage("background.jpg");

  // initialize all the objects
  for (int i=0; i < objs.length; i++) {
    objs[i] = new SkayObj(random(height/20, width/16));
  }
}

// The main draw loop
void draw() {  
  // display the tank background
  img.resize(width, height);
  image(img, 0, 0); 
  
  // draw and animate each of the objects
  for (int i=0; i<objs.length; i++) {
    objs[i].react(objs);
    objs[i].display();
    objs[i].move();
    objs[i].signature(width/1.5, height/15);
  }
}

/***************************************
 DO NOT MODIFY FROM HERE ...
****************************************/
// A super class for animated objects 
abstract class AnimatedObject {
  
  // Location fields inherited by all subclass 
  float x;
  float y;
  
  // Size parameter inherited by subclass 
  float size = 50;
  
  /** Constructors
   *  You are required to implement two construtors.
   */
  
  // Displays the object 
  abstract void display();
  
  // Advances the object's animation by one frame
  abstract void move();
 
 // Display a signature block with name of creature
  abstract void signature(float w, float h);

 /** Extra credit: up to 20 points.
  *  Modifies the object based on the other objects.
  *  Note that you are not allowed any drawing commands in this method 
  *  @param objs an array of AnimatedObject objects in the environment
  */
  void react(AnimatedObject[] objs) { }

  // Methods that provide access to class data fields 
  float getX() {return x;}
  float getY() {return y;}
  float getSize() {return size;}
}

/**************************************
 ... TO HERE
***************************************/
