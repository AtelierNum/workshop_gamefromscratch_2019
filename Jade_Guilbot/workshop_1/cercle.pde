//Dans le jeu le cercle (=personnge principal, joué par le joueur) est représenté par une abeille. Celle-ci sera appelées cercle dans le code

class cercle {
  float X;
  float Y;
  float a = mouseX;
  float b = mouseY;




  cercle() {

    abeille = loadImage("abeille.png");
  }

  void update() {

    //mouvement cercle
    X = lerp(X, mouseX, 0.1);
    Y = lerp(Y, mouseY, 0.1);
  }

  void display() {

    //dessin cercle
    imageMode(CENTER);
    image(abeille, X, Y, 70, 70);
  }
}
