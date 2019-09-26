class Ball {
  float xoff = 0.0;
  float yoff = 10.0;
  float xpos;
  float ypos;


  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
  }

  void update(int SpdBall) {
    xoff = xoff +0.01;
    yoff = yoff + 0.01;
    xpos = xpos +map(noise(xoff), 0, 1, -5 - SpdBall, 5 + SpdBall);
    ypos = ypos +map(noise(yoff), 0, 1, -5 - SpdBall, 5 + SpdBall);
  }

  void display(int SizeBall) {
    fill(0, 0, 250);
    noStroke();
    image(B,xpos, ypos, 50+SizeBall, 50+SizeBall);
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
