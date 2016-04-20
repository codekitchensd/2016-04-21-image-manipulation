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