class Boule {

  float X = 500;     
  float Y = 500;
  
  float Xcible = mouseY;
  float Ycible = mouseX;
  
  Boule(){
    
  
  }

  void forme() {

    X = lerp (X, mouseX, 0.07);
    Y = lerp (Y, mouseY, 0.07);
    image(mouton, X, Y,80,80);

  }
}
