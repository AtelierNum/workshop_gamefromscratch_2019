class BonusB {
  float xoff = 0.0;
  float yoff = 10.0;
  float xpos;
  float ypos;

  BonusB(float xpos, float ypos) {
    xoff = xpos;
    yoff = ypos;
  }

  void display() {
    fill(255, 0, 215);
    noStroke();
    image(Bob,xoff, yoff, 40, 40);
  }
  
}
