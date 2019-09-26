class White {

  float xoff = random(999);
  float yoff = random(300);

  float xpos ;
  float ypos ;
 


  White(float _xpos, float _ypos) {
    xpos = _xpos;
    ypos = _ypos;
  }

  void move() {
    xoff = xoff + .01;
    yoff = yoff + .01;

    xpos = xpos + (noise(xoff)*10 - 5);
    ypos = ypos + map(noise(yoff), 0, 1, -5, 5);
  }


  void display() {
    fill(255);
    image(gilbert,xpos, ypos, 30, 30);
  }

  void wrap() {
    if (xpos>width) {
      xpos=0;
    } 
    if (xpos<0) {
      xpos=width;
    }
    if (ypos>height) {
      ypos=0;
    } 
    if (ypos<0) {
      ypos=height;
    }
  }
}
