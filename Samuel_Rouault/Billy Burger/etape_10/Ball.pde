//Class qui gére le personnage du joueur
//Le joueur se déplace à la souris
class Ball {
  float xcercle = width/2;
  float ycercle = height/2;
  float inversionx = 0;
  float inversiony = 0;

  Ball() {
  }

  void display() { 

    //Apparition du joueur
    image(player, xcercle, ycercle, 80, 80);
  }

  void update() {
    //Calcul de la position du cercle en fonction de la position de la souris
    xcercle = lerp(xcercle, mouseX + inversionx, 0.15);
    ycercle = lerp(ycercle, mouseY + inversiony, 0.15);
  }
}
//Fin de la class
