class Coord {
  public int x;
  public int y;
  
  public Coord( int iX, int iY) {
    this.x = iX;
    this.y = iY;
  }
  
  public String toString() {
    return "{ x: " + this.x + ", y: " + this.y + " }";
  }
}

float colorDistance(color inC1, color inC2) {
  
  float r2 = (float) Math.pow( red(inC1) - red(inC2), 2);
  float g2 = (float) Math.pow( green(inC1) - green(inC2), 2);
  float b2 = (float) Math.pow( blue(inC1) - blue(inC2), 2);
  
  float delta = (float) Math.sqrt( r2 + g2 + b2 );
  
  return delta;
}

// Color Safe Range Clamp
color basicColorClamp(color c) {
   return color(clamp(red(c), 0, 255), clamp(green(c), 0, 255), clamp(blue(c), 0, 255));
}

// Clamp functions, float and int
public static float clamp(float val, float min, float max) {
    return Math.max(min, Math.min(max, val));
}

public static int clamp(int val, int min, int max) {
    return Math.max(min, Math.min(max, val));
}

//color multiplyColor (color a, color b) {
  
//  float r1 = a >> 16 & 0xFF;
//  float g1 = a >> 8 & 0xFF;
//  float b1 = a & 0xFF;
  
//  float r2 = b >> 16 & 0xFF;
//  float g2 = b >> 8 & 0xFF;
//  float b2 = b & 0xFF;
  
//  return color(r1*r2, g1*g2, b1*b2);
//}