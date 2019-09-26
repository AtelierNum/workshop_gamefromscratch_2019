class Red {

  float xoff = random(999);
  float yoff = random(300);

  float xpoz ;
  float ypoz ;



  Red(float _xpos, float _ypos) {
    xpoz = _xpos;
    ypoz = _ypos;
  }

  void move() {
    xoff = xoff + .01;
    yoff = yoff + .01;

    xpoz = xpoz + (noise(xoff)*10 - 5);
    ypoz = ypoz + map(noise(yoff), 0, 1, -5, 5);
  }


  void display() {
    fill(255, 0, 0);
    image(arbitre,xpoz, ypoz, 20, 20);
  }

  void wrap() {
    if (xpoz>width) {
      xpoz=0;
    } 
    if (xpoz<0) {
      xpoz=width;
    }
    if (ypoz>height) {
      ypoz=0;
    } 
    if (ypoz<0) {
      ypoz=height;
    }
  }
}
