void pixelSort(PImage img){
  color c;                                                // values for looking at pixels
  float r, g, b;                                          //  initialize here to avoid re-creating each px
  ArrayList<Integer> rColor = new ArrayList<Integer>();   // store red colors
  ArrayList<Integer>rPos = new ArrayList<Integer>();      // store red positions in the px array
  ArrayList<Integer> gColor = new ArrayList<Integer>();   // ditto green
  ArrayList<Integer>gPos = new ArrayList<Integer>();
  ArrayList<Integer> bColor = new ArrayList<Integer>();   // ditto blue
  ArrayList<Integer>bPos = new ArrayList<Integer>();
  
  img.loadPixels();
  for (int i=0; i<img.pixels.length; i++) {
    // get current color values
    c = img.pixels[i];
    r = c >> 16 & 0xFF;
    g = c >> 8 & 0xFF;
    b = c & 0xFF;
  
    // get the highest value in the color
    int greatest = highestColor(r, g, b);

    // put into appropriate arrays
    switch (greatest) {
      case 1:
        rColor.add(c);
        rPos.add(i);
        break;
      case 2:
        gColor.add(c);
        gPos.add(i);
        break;
      case 3:
        bColor.add(c);
        bPos.add(i);
        break;
    }
    
    // update us on our progress every 10%
    if (i > 0 && i % (img.pixels.length/10) == 0) {
      println("  " + nfc(i) + "\t/ " + nfc(img.pixels.length));
    }
  }
  
  // let us know the statistics of our gathering!
  println("\nSTATISTICS:");
  println("  Red:   " + nfc(rColor.size()) + "px");
  println("  Green: " + nfc(gColor.size()) + "px");
  println("  Blue:  " + nfc(bColor.size()) + "px\n");
  
  // sort ArrayLists using Java Collections
  println("Sorting arrays (may take a while)...");
  print("  red...");
  Collections.sort(rColor);
  print(" green...");
  Collections.sort(gColor);
  print(" blue...\n");
  Collections.sort(bColor);
  
  // put back in place
  println("Putting pixels back into image...");
  for (int i=0; i<rPos.size(); i++) {
    img.pixels[rPos.get(i)] = (color)rColor.get(i);
  }
  for (int i=0; i<gPos.size(); i++) {
    img.pixels[gPos.get(i)] = (color)gColor.get(i);
  }
  for (int i=0; i<bPos.size(); i++) {
    img.pixels[bPos.get(i)] = (color)bColor.get(i);
  }
  
  //update our pixels
  img.updatePixels();
  
}

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

/// Soft Tint 
void addSoftTint(PImage img, color tintColor) {
  
  //img.loadPixels();

  PImage tintLayer = get();
  
  for (int i=0; i < tintLayer.height; ++i) {
    for (int j=0; j < tintLayer.width; ++j) {  
      int loc = i*tintLayer.width + j;
      tintLayer.pixels[loc] = tintColor;

    }
  }
  
  image(img, 0, 0);
  image(tintLayer, 0, 0);
  blend(tintLayer, 0, 0, img.width, img.height, 0, 0, img.width, img.height, MULTIPLY);
  
  img = get();
  //img.updatePixels();

}
