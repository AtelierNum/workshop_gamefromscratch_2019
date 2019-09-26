 //Dans le jeu les bonus (=objets à récolter pour gagner 5 fois plus de points) sont représentés par des alvéoles. Celles-ci seront appelées bonus dans le code

class bonus {
  float xb;
  float yb;
  float xoffb = 10;
  float yoffb = 0;

  float r = 50;


  bonus(float _xb, float _yb) {
    xoffb = random(9999);
    yoffb = random(9999);
    xb = _xb;
    yb = _yb;
    
   ruche = loadImage("ruche.png");
    
    
  }


  void update() {

    //mouvement bonus
    xoffb= xoffb + 0.01;
    yoffb = yoffb + 0.01;
    xb += map(noise(xoffb), 0, 1, -20, 20);
    yb += map(noise(yoffb), 0, 1, -20, 20);
  }

  void display() {

    //dessin bonus 
    imageMode(CENTER);
    image(ruche,xb, yb, r, r);
  }

  void wrap () {

    //disparition + réapparition des bonus au limites de l'écran
    if (xb>width + r*0.5) {
      xb = 0 - r*0.5;
    }

    if (xb<0 - r*0.5) {
      xb = width +r*0.5;
    }

    if (yb>height + r*0.5) {
      yb = 0 - r*0.5;
    }

    if (yb<0 - r*0.5) {
      yb = height +r*0.5;
    }
  }
}
