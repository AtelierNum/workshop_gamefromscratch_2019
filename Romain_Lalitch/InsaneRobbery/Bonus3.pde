//création de la classe Bonus3 (très similaire à la classe Agent)

class Bonus3 {

  float x = 0.0;
  float y = 10.0;

  float xpos;
  float ypos;

  Bonus3(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.x = random(9999);
    this.y = random(9999);
    
  }

  void position() {





    x = x + .01;
    y = y + .01;

    xpos = xpos + map(noise(x), 0, 1, -70, 70);
    ypos = ypos + map(noise(y), 0, 1, -70, 70);
  }

  void deplacement() {







    fill(255,95,95);
    image(lingot, xpos, ypos, 50,50);
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
  
  
  
  
  
  
  
  
  
