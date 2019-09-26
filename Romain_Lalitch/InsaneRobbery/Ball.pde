//création de la classe Ball qui suit notre souris
class Ball {

//création des variables qui vont être utilisées dans cet onglet
  float x;
  float y;
  float a = mouseX;
  float b = mouseY;
  int w = 50;
  int c = 50;

//constructeur de la classe Ball, aucun paramètre à rentrer
  Ball() {
    
  }


//fonction gérant le déplacement de ce que l'on dirige
  void update() {
    a = mouseX;
    b = mouseY;
    x = lerp(x, a, .1);
    y = lerp(y, b, .1);
  }

//fonction gérant l'apsect graphique, la position et les dimensions de l'objet que l'on dirige
  void display() {

    noFill();
    stroke(210, 210, 210);
    strokeWeight(15);
    image(teteVoleur, x, y, w, c);
  }
}
