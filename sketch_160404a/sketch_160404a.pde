PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(960, 639, P3D); 
  img  = loadImage("flower.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
}

void draw() {
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = 2* (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
}


//PImage img;
//int pointillize = 36;

//void setup() {
//  size(960, 639);
//  img = loadImage("flower.jpg");
//  background(0);
//  smooth();
//}

//void draw() {
//  //Pick a random point
//  int x = int(random(img.width));
//  int y = int(random(img.height));
//  int loc  = x + y*img.width;
  
//  // Look up the RGB color in the source image
//  loadPixels();
//  color c = img.pixels[loc];
//  //float r = red(img.pixels[loc]);
//  //float g = green(img.pixels[loc]);
//  //float b = blue(img.pixels[loc]);
//  float r = c >> 16 & 0xFF;
//  float g = c >> 8 & 0xFF;
//  float b = c & 0xFF;
  
//  noStroke();
  
//  // Draw an ellips at that location with that color
//  fill(r,g,b,100);
//  ellipse(x,y,pointillize, pointillize);
//}



//import gab.opencv.*;
//import org.opencv.core.Core;

//void setup() {
//  size(400, 400);
//  stroke(255);
  
//  println(Core.VERSION);
//  println(Core.NATIVE_LIBRARY_NAME);
//}

//void draw(){
//  line(150, 25, mouseX, mouseY);
//}

//void mousePressed() {
//  saveFrame("output.png");
//  background(192, 64, 0);
//}