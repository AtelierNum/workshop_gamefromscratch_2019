//création de la classe Bonus1 (très similaire à la classe Agent)

class Bonus1 {

  float x = 0.0;
  float y = 10.0;

  float xpos;
  float ypos;

  Bonus1(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.x = random(9999);
    this.y = random(9999);
   
  }

  void position() {





    x = x + .01;
    y = y + .01;

    xpos = xpos + map(noise(x), 0, 1, -25, 25);
    ypos = ypos + map(noise(y), 0, 1, -25, 25);
  }

  void deplacement() {







    fill(0,200,50);
    image(diamant, xpos, ypos, 50, 50);
  }

  void warp() {
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
