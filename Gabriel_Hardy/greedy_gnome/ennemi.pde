class Enemi {//Données de ennemi
  float xe =0;
  float ye=0;
  float xoffe=0;
  float yoffe=0;


  Enemi(float _xe, float _ye) {//Constructeur de ennemi
    xoffe = random(14);
    yoffe= random(21);
    xe = _xe;
    ye= _ye;
  }



  void dispe() {//Si le boolean malus est activé la taille des ennemis augmente
    if (malus == true) {
      re = 85;
    } else {
      re = 45;
    }

    image(boulerouge, xe, ye, re, re);
    ;//Apparence de ennemi
  }
  void rande() {//Gros calibre se deplace de manière aléatoire, sa vitesse maximale peut varier en fonction de Eporate

    xoffe = xoffe + 0.01;
    yoffe = yoffe + 0.01;
    xe = xe + ((noise(xoffe)*10 - 5)*Epoprate);
    ye = ye + ((noise(yoffe)*10 - 5)*Epoprate);
    ;
  }
  void wrape() {//Si ennemi sort d'un coté l'écran il réaparait de l'autre coté
    if (xe<0-re) {
      xe = width+re;
    }
    if (xe>width+re) {
      xe=0-re;
    }
    if (ye<0-re) {
      ye=height+re;
    }
    if (ye>height+re) {
      ye=0-re;
    }
  }
}
