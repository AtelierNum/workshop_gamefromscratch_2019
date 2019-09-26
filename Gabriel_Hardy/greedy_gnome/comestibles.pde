class Yolo {//Données de yolo
  float x =0;
  float y=0;
  float xoff=0;
  float yoff=0;
  float r=50;

  Yolo(float _x, float _y) {//Constructeur de yolo
    xoff = random(14);
    yoff= random(21);
    x = _x;
    y= _y;
  }



  void disp() {//Apparence de yolo
    image(cristal, x, y, 100, 100);
    ;
  }
  void rand() {//Yolo se deplace de manière aléatoire
    xoff = xoff + 0.01;
    yoff = yoff + 0.1;
    x = x + (noise(xoff)*10 - 5);
    y = y + map(noise(yoff), 0, 1, -5, 5);
  }
  void wrap() {//Si yolo sort d'un coté l'écran elle réaparait de l'autre coté
    if (x<0-r) {
      x = width+r;
    }
    if (x>width+r) {
      x=0-r;
    }
    if (y<0-r) {
      y=height+r;
    }
    if (y>height+r) {
      y=0-r;
    }
  }
}
