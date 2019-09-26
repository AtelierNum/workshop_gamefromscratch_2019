//Class qui gére le malus en forme de bouteille
//Ce malus va changer la position du joueur par rapport à celle de la souris
class Malus {

  float xoff = random(100);
  float yoff = random(100);
  float xpos = 0;
  float ypos = 0;

  Malus(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
  }

  //TApparition de la bouteille
  void malus() {
    image(bouteille, xpos, ypos, 40, 100);
  }
  //Déplacement de la bouteille
  void movemalus() {
    xoff = xoff +0.005;
    yoff = yoff +0.004;
    xpos = xpos +(noise(xoff)*40 - 20);
    ypos = ypos +(noise(yoff)*40 - 20);
  }
}  
//Fin de la class
