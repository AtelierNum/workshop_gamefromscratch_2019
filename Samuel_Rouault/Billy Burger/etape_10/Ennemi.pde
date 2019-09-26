//Class qui va gérer nos ennemis qui sont les pommes
class Ennemi {

  float xoff = random(100);
  float yoff = random(100);
  float xpos = 0;
  float ypos = 0;
  float r = 80;
  int speed = 10;

  Ennemi(float xpos, float ypos, int speed) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
  }

  //Faire apparaitre la pomme
  void ennemi() {
    image(apple, xpos, ypos, r, r);
  }
  //Déplacement de la pomme
  void move() {
    xoff = xoff +0.005;
    yoff = yoff +0.004;
    xpos = xpos +(noise(xoff)*speed - speed/2);
    ypos = ypos +(noise(yoff)*speed - speed/2);
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
