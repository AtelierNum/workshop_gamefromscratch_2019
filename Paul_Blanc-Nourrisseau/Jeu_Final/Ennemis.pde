class Ennemi {
  float xoff = 0.0;
  float yoff = 10.0;
  float xpos;
  float ypos;


  Ennemi(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
  }

  void update(int SpdEnnemis) {
    xoff = xoff +0.01;
    yoff = yoff + 0.01;
    xpos = xpos +map(noise(xoff), 0, 1, -5 - SpdEnnemis, 5 + SpdEnnemis);
    ypos = ypos +map(noise(yoff), 0, 1, -5 - SpdEnnemis, 5 + SpdEnnemis);
  }

  void display(int SizeEnnemis) {
    fill(255, 0, 0);
    noStroke();
    image(C,xpos, ypos, 50 + SizeEnnemis, 50 + SizeEnnemis );
  }

  void wrap() {
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos < 0) {
      xpos = width;
    }
    if (ypos > height) {
      ypos = 0;
    }
    if (ypos < 0) {
      ypos = height;
    }
  }
}
