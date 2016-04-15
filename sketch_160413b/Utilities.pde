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