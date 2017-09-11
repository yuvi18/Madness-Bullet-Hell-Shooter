class Person {
  float diameter;
  int x;
  int y;
  float pColor;
  Person(int tempX, int tempY, float tempPColor, float tempDiameter) {
    diameter = tempDiameter;
    x= tempX;
    y=tempY;
    pColor=tempPColor;
  }
  void setXandY(int tempX, int tempY) {
    thePlayer.x=tempX;
    thePlayer.y = tempY;
  }
  void draw() {
    fill(pColor);
    ellipse(x, y, diameter, diameter);
  }
}