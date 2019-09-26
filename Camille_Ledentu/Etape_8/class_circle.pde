class Circle {

  float xoff = random(999);
  float yoff = random(899);
  float xpos;
  float ypos;
  float r = 70;
  
  Circle (float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void update() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    xpos = xpos + (noise(xoff) *10 - 5);
    ypos = ypos + map(noise(yoff), 0, 1, -5, 5 );
  }

  void display() {
    fill(255);
    stroke(0);
    image(pomme,xpos, ypos, r, r);
  }

  void wrap() {            //xpos bouge de droite à gauche

    if (xpos > width + r*0.5) {
      xpos = 0 - r*0.5;
    }
    if (xpos < 0 - r*0.5) {
      xpos = width + r*0.5;
    }
    if (ypos > height + r*0.5) {
      ypos = 0 - r*0.5;
    }
    if (ypos < 0-r*0.5) {
      ypos = height + r*0.5;
    }
  }
  
}
