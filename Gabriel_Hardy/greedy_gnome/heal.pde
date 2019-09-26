class Heal {//Données de heal
  float xh =0;
  float yh=0;
  float xoffh=0;
  float yoffh=0;
  float rh=45;

  Heal(float _xh, float _yh) {//Constructeur de heal
    xoffh = random(14);
    yoffh= random(21);
    xh = _xh;
    yh =_yh;
  }



  void disph() {//Apparence de heal
    image(cross, xh, yh, 100, 100);
    ;
  }
  void randh() {//Heal se déplace aléatoirement
    xoffh = xoffh + 0.01;
    yoffh = yoffh + 0.1;
    xh = xh + (noise(xoffh)*10 - 5);
    yh= yh + map(noise(yoffh), 0, 1, -5, 5);
  }
  void wraph() {//Si heal sort d'un coté l'écran il réaparait de l'autre coté
    if (xh<0-rh) {
      xh = width+rh;
    }
    if (xh>width+rh) {
      xh=0-rh;
    }
    if (yh<0-rh) {
      yh=height+rh;
    }
    if (yh>height+rh) {
      yh=0-rh;
    }
  }
}
