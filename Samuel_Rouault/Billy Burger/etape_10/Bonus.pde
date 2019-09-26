//Class qui va gérer le bonus coeur qui rends une vie au joueur
//Quand le coeur passe d'un côté de l'écran il ne revient pas de l'autre côté pour augmenter la difficulté
class Coeur {

  float xoff = random(100);
  float yoff = random(100);
  float xpos = 0;
  float ypos = 0;

  Coeur(float xpos, float ypos){
    this.xpos = xpos;
    this.ypos = ypos;
  }

  //Apparition du coeur
  void coeur() {
    image(bonusvie,xpos, ypos,80,80);
  }
  //Déplacement du coeur
  void movecoeur() {
    xoff = xoff +0.005;
    yoff = yoff +0.004;
    xpos = xpos +(noise(xoff)*40 - 20);
    ypos = ypos +(noise(yoff)*40 - 20);
  }
}  
//Fin de la class
