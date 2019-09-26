//Dans le jeu les ennemis (=objets à évitier pour pour ne pas perdre de points) sont représentés par des bouteilles d'insecticide. Celles-ci seront appelées ennemi dans le code

class Ennemi {
  float xe;
  float ye;
  float xoffe = 10;
  float yoffe = 0;

  float r = 70;


  Ennemi(float _xe, float _ye) {

    poison = loadImage("poison.png"); 

    xoffe = random(9999);
    yoffe = random(9999);
    xe = _xe;
    ye = _ye;
  }


  void update(float speed) {

    //mouvement ennemis
    xoffe = xoffe + 0.01;
    yoffe = yoffe + 0.01;
    xe += map(noise(xoffe), 0, 1, -speed, speed);
    ye += map(noise(yoffe), 0, 1, -speed, speed);
  }

  void display() {

    //dessin ennemis
    imageMode(CENTER);
    image(poison, xe, ye, r, r);
  }

  void wrap () {

    //disparition + réapparition des ennemis au limites de l'écran
    if (xe>width + r*0.5) {
      xe = 0 - r*0.5;
    }

    if (xe<0 - r*0.5) {
      xe = width +r*0.5;
    }

    if (ye>height + r*0.5) {
      ye = 0 - r*0.5;
    }

    if (ye<0 - r*0.5) {
      ye = height +r*0.5;
    }
  }
}
