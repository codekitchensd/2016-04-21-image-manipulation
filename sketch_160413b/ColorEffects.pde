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

/// Increase or decrease the contrast. Amount between -255 and 255. 
void adjustContrast(PImage img, float amount) {
  float factor = (259 * (amount + 255)) / (255 * (259 - amount));
  
  img.loadPixels();

  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
      
      int newRed   = clamp( (int) (factor * (red(currentColor) - 128) + 128), 0, 255);
      int newGreen = clamp( (int) (factor * (green(currentColor) - 128) + 128), 0, 255);
      int newBlue  = clamp( (int) (factor * (blue(currentColor) - 128) + 128), 0, 255);
      
      img.pixels[loc] = color(newRed, newGreen, newBlue);

    }
  }
  img.updatePixels();

}

/// Increase or decrease the brightness. Amount between -255 and 255. 
void adjustBrightness(PImage img, float amount) {
  float factor = (259 * (amount + 255)) / (255 * (259 - amount));
  
  img.loadPixels();

  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
      
      int newRed   = clamp( (int) (red(currentColor) + amount), 0, 255);
      int newGreen = clamp( (int) (green(currentColor) + amount), 0, 255);
      int newBlue  = clamp( (int) (blue(currentColor) + amount), 0, 255);
      
      img.pixels[loc] = color(newRed, newGreen, newBlue);

    }
  }
  img.updatePixels();
  
}

/// Multiply Solid Color 
void multiplyTint(PImage img, color tintColor) {
  
  img.loadPixels();

  for (int i=0; i < img.height; ++i) {
    for (int j=0; j < img.width; ++j) {  
      int loc = i*img.width + j;
      color currentColor = img.pixels[loc];
      
      int mRed = (int)((red(currentColor) * red(tintColor))/255);
      int mGreen = (int)((green(currentColor) * green(tintColor))/255);
      int mBlue = (int)((blue(currentColor) * blue(tintColor))/255);

      img.pixels[loc] = color(mRed, mGreen, mBlue);
    }
  }

  img.updatePixels();

}