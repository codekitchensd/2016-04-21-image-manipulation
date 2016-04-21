//Allows the use of lists.
import java.util.*;

PGraphics pg;     // Allows for stand alone draw calls
PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system


//A list for collecting mouse down coordinates.
List<Coord> mouseCoords = new ArrayList<Coord>();

void setup() {
  size(960, 639, P3D); 
  pg = createGraphics(width, height);
  img  = loadImage("flower.jpg"); // Load the image

  color purple = color(106, 40, 212);
  color white = color(255);
  
  //replaceColor(img, purple, white, 100.0);
  adjustBrightness(img, 12);
  adjustContrast(img, 60);
  multiplyTint(img, color(244, 234, 189)); // Light Yellow
  //adjustHighlightOutputLevels(img, 117);
  //adjustShadowOutputLevels(img, 117);
  adjustContrast(img, -11);
  adjustMidtoneBalance(img, 13, 18, -7);
  pixelSort(img);
  adjustBrightness(img, -32);
  adjustContrast(img, 20);
}  

void drawStreak() {
  img.loadPixels();
  
  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      
      for (Coord c : mouseCoords) {
        if (j == c.x && i == c.y) {
          //println("match: ", c);
          color pC = img.pixels[loc];
          stroke(pC);
          line(c.x,c.y,img.width, 0);
        }
      }
 
    }
  }
  img.updatePixels();
  
  
}


void customDraw() {
  //clear the background to black
  background(0);
  
  //Start buffer draw
  pg.beginDraw();
  pg.background(0); //clear old
  
  // Draw stuff
  pg.image(img, 0, 0);
  
  pg.endDraw(); //End buffer draw
  
  image(pg, 0, 0); //Draw buffer to main
  
  //Secondary Effect
  pg.beginDraw();
  //effect
  pg.filter(BLUR, 6);
  pg.endDraw();
  
  blendMode(ADD);
  image(pg, 0, 0);
  
}

void draw() {

  image(img, 0, 0);
  
}


void keyPressed() {
   //Left
   if (keyCode == LEFT) {
     //do left key stuff

   }
   //Right
   if (keyCode == RIGHT) {
     //do right key stuff
     customDraw();
   }
   
}

void mousePressed() {
  println("Mouse Pressed");
  mouseCoords.clear();
}

void mouseDragged() {
  mouseCoords.add( new Coord(mouseX, mouseY ) );
}

void mouseReleased() {
  println("Mouse Released");
  
  // If mouse coordinates were captured draw streak.
  if (mouseCoords.size() > 0) {
   drawStreak(); 
  }
}


  