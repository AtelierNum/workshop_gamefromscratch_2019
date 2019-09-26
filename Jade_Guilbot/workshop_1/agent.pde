//Dans le jeu les agents (=objets à récolter pour gagner des points) sont représentés par des fleurs. Celles-ci seront appelées agents dans le code

class Agent {
  float x;
  float y;

  float xoff = 10;
  float yoff = 0;

  float r = 80;


  Agent(float _x, float _y) {
    xoff = random(9999);
    yoff = random(9999);
    x = _x;
    y = _y;

    fleur = loadImage("fleur.png");
  }


  void update(float speed) {

    //mouvement agent 
    xoff = xoff + 0.01;
    yoff = yoff + 0.01;
    x += map(noise(xoff), 0, 1, -speed, speed);
    y += map(noise(yoff), 0, 1, -speed, speed);
  }

  void display() {

    //dessin agent
    imageMode(CENTER);
    image(fleur, x, y, r, r);
  }

  //disparition + réapparition des agents au limites de l'écran
  void wrap () {

    if (x>width + r*0.5) {
      x = 0 - r*0.5;
    }

    if (x<0 - r*0.5) {
      x = width +r*0.5;
    }

    if (y>height + r*0.5) {
      y = 0 - r*0.5;
    }

    if (y<0 - r*0.5) {
      y = height +r*0.5;
    }
  }
}
