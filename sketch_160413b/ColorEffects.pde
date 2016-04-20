void replaceColor(PImage img, color startColor, color endColor, float threshold) {
  
  img.loadPixels();

  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
      
      // Change purple to white
      if (colorDistance(startColor, currentColor) < threshold) {
        img.pixels[loc] = endColor;
      }

      // Streak
      if (i > 375 && j > 600 && i < 450) {
        int loc2 = i * img.width + 600;
        color c = img.pixels[loc2];
        img.pixels[loc] = c; 
      }
 
    }
  }
  img.updatePixels();
  
}