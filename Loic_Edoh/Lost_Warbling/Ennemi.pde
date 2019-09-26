//Ici, sont codées les données des entités que le joueur devra éviter au risque de perdre des points de vie

class Ennemi{
   
  //Data
  public float Xpos;
  public float Ypos;
  public float R = 30;
  color red = color(255,0,0);

  public float Xoff = random(100);
  public float Yoff = random(100);

  Ennemi(float _Xpos, float  _Ypos) {
    Xpos = _Xpos;
    Ypos = _Ypos;
    
   
    
  }
  
  Ennemi() {
  }
  void displaye() {
    //Ellipse
    imageMode(CENTER);
    image(noterouge, Xpos, Ypos, 450, 450);
  }
  
  
  
  
  //Popp
  void popp() {
    Xpos += random(0, 1);
    Ypos += random(0, 1);
  }
  
  
  
 //Mouvement
  void iliketomoveit() {
    Xoff = Xoff+0.005;
    Yoff = Yoff+0.005;
    
  
    Xpos = Xpos + (noise(Xoff) * 10 - 5) * 3;
    Ypos = Ypos + (noise(Yoff) * 10 - 5) * 3;
  
  }
   //Side to Side
  void Wrap() {
    if (Xpos> width +R*0.5)
      Xpos = 0-R*0.5;
    if (Ypos > height +R*0.5)
      Ypos = 0-R*0.5;
    if (Xpos< 0 -R*0.5)
      Xpos = width+R*0.5;
    if (Ypos< 0 - R*0.5)
      Ypos = height+R*0.5;
  }
  
}
