class Foe {
  float xoff = random(999);
  float yoff = random(999);
  float xpos ;
  float ypos ;
  float r = 200;
  

  Foe(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  void move() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    xpos = xpos + (noise(xoff)*10 - 5);
    ypos = ypos + map(noise(yoff), 0, 1, -5, 5);
  }

  void dessin() {
    image(yakuza,xpos, ypos, r, r);
  }

  void wrap() {
    //xpos bouge d'un bout à l'autre de l'écran
    if (xpos > width+r*0.5) {
      xpos = 0-r*0.5;
    } 
    if (xpos < 0-r*.05) {
      xpos = width+r*0.5;
    }
    if (ypos > height+r*0.5) {
      ypos = 0-r*0.5;
    }
    if (ypos < 0-r*0.5) {
      ypos = height+r*0.5;
    }
  }
}
