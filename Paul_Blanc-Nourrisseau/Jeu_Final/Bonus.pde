class Bonus {
  float xoff = 0.0;
  float yoff = 10.0;

  Bonus(float xpos, float ypos) {
    xoff = xpos;
    yoff = ypos;
  }

  void display() {
    fill(255, 215, 0);
    noStroke();
    image(Bo,xoff, yoff, 40, 40);
  }
}
