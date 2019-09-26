class Boule {//Données de la Boule
  float xpos=1;
  float ypos=1;
  public int r = 40;
  boolean hit = true;//Innitialisation du boolean "hit"
  Boule() {//Constructeur de la boule
    xpos = width/2;
    ypos = height/2;
    r = 60;
  }



  void display() {
    if (hit==false) {//Boolean "hit" a une durée de 60 frames
      if (frameCount%60 == 0) {
        hit = true;
      }
    }
    if (life>0) {//Tant que les vies ne sont pas à 0 la boule est visible

      image(sprite2, xpos, ypos, 130, 130);
    }
  }
  void mouv() {//La Boule suit las coordonnées de la souris de façon décalée
    xpos=lerp(xpos, mouseX, 0.07);
    ypos=lerp(ypos, mouseY, 0.07);
  }
}
