class Gc {//Données de Gros calibre
  float xg =0;
  float yg=0;
  float xoffg=0;
  float yoffg=0;
  float rg=70;


  Gc(float _xg, float _yg) {//Constructeur de Gros calibre
    xoffg = random(14);
    yoffg= random(21);
    xg = _xg;
    yg= _yg;
  }



  void dispg() {//Apparence de Gros calibre
    image(grosseboule, xg, yg, 150, 150);
    ;
  }
  void randg() {//Gros calibre se deplace de manière aléatoire, sa vitesse maximale peut varier en fonction de Eporateg
    xoffg= xoffg + 0.01;
    yoffg = yoffg + 0.1;
    xg = xg + ((noise(xoffg)*10 - 5)*Eporateg);
    yg = yg + ((noise(yoffg)*10 - 5)*Eporateg);
  }
  void wrapg() {//Si Gros calibre sort d'un coté l'écran il réaparait de l'autre coté
    if (xg<0-rg) {
      xg = width+rg;
    }
    if (xg>width+rg) {
      xg=0-rg;
    }
    if (yg<0-rg) {
      yg=height+rg;
    }
    if (yg>height+rg) {
      yg=0-rg;
    }
  }
}
