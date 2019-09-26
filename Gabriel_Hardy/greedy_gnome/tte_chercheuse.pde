class TC {//Données de 
  float X=0;
  float Y=0;
  TC(float _X, float _Y) {//Constructeur de tête chercheuse
    X=_X;
    Y=_Y;
  }
  void displayt() {//Apparence de tête chercheuse
    image(sainteboule, X, Y, 300, 300);
    if (score==scoremax) {//Si le score maximum est atteint tête chercheuse est déplacée en dehors de l'écran et arrète de suivre la souris
      X=900;
      Y=900;
    } else {//Sinon tête chercheuse suis les coordonnées de la souris de façon plus lente que la Boule
      X=lerp(X, mouseX, 0.01);
      Y=lerp(Y, mouseY, 0.01);
    }
    if (life==0) {//Si la vie arrive à 0 tête chercheuse est déplacée en dehors de l'écran et arrète de suivre la souris
      X=900;
      Y=900;
    }
  }
}
