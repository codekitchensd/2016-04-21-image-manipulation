
PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(960, 639, P3D); 
  img  = loadImage("flower.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
  
  print(img.width, img.height);
  img.loadPixels();

  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
      
      // Change purple to white
      if (colorDistance(color(106, 40, 212), currentColor) < 100.0) {
        img.pixels[loc] = color(255,255,255);
      }

      // Streak
      //if (i > 375 && j > 600 && i < 450) {
      // int loc2 = i * img.width + 600;
      // color c = img.pixels[loc2];
      // img.pixels[loc] = c; 
      //}
 
    }
  }
  img.updatePixels();
}  

float colorDistance(color inC1, color inC2) {
  
  float r2 = (float) Math.pow( red(inC1) - red(inC2), 2);
  float g2 = (float) Math.pow( green(inC1) - green(inC2), 2);
  float b2 = (float) Math.pow( blue(inC1) - blue(inC2), 2);
  
  float delta = (float) Math.sqrt( r2 + g2 + b2 );
  
  return delta;
}

void draw() {

  image(img, 0, 0);
  
}

  