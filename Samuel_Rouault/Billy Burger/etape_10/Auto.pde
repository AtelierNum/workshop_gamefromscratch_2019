//Class qui gére les burgers que le joueur doit manger
class Auto {

  float xoff = random(100);
  float yoff = random(100);
  float xpos = 0;
  float ypos = 0;
  float r = 80;

  Auto(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  //Apparition du joueur
  void auto() {
    image(burger, xpos, ypos, r, r);
  }
  //Déplacement du joueur
  void move() {
    xoff = xoff +0.004;
    yoff = yoff +0.005;
    xpos = xpos +(noise(xoff)*10 - 5);
    ypos = ypos + map(+noise(yoff), 0, 1, -5, 5);
  }
  //Passage d'un côté à l'autre de l'écran
  void wrap() {
    if (xpos > width + r*0.5)
      xpos = 0 - r*0.5;
    if (xpos < 0 - r*0.5)
      xpos = width + r*0.5;
    if (ypos > width + r*0.5)
      ypos = 0 - r*0.5;
    if (ypos < 0 - r*0.5)
      ypos = width + r*0.5;
  }
}  
//Fin de la class
