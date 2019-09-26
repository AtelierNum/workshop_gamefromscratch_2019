//Ici, sont codées les données de l'avatar du joueur

class Ball {
  
  //Data
  public float x;
  public float y;

Ball(float _x, float _y){
  x = _x;
  y = _y;
  
  
  
}

  Ball() {
    
  }
  void display() {

    //Ellipse
    imageMode(CENTER);
    image(socoskin,x, y,250,350);
  }
   //Mouvement
  void move() {
    x = lerp(x, mouseX, 0.1);
    y = lerp(y, mouseY, 0.1);
  }
   //Pouvoirs
  
}
