class Ennemis
{
  
  
  // positionnement de départ
  float Xoff=0.0; 
  float Yoff=10.0;

  // position des balles x,y
  float Xpos; 
  float Ypos;

  float Re = 30;

  //constructeur
  Ennemis(float Xpos, float Ypos)
  {
    this.Xpos=Xpos;     //data de notre classe / montre qqch
    this.Ypos=Ypos;
    this.Xoff = random(9999);
    this.Yoff = random(9999);
  }
  void update (int SpeedEnnemis)
  {
    Xoff = Xoff + .01;
    Yoff= Yoff+.01;

    //speed
    Xpos = Xpos + map(noise(Xoff), 0, 1, -5-SpeedEnnemis, 5+SpeedEnnemis);
    Ypos = Ypos + map(noise(Yoff), 0, 1, -5-SpeedEnnemis, 5+SpeedEnnemis);
  }

  void display (int SizeEnnemis)
  {
    fill(144,40,59);
    image(Poule, Xpos, Ypos, Re + SizeEnnemis, Re + SizeEnnemis);      ///
  }

  void wrap ()
  {
    if (Xpos > width+Re*0.5)
    {
      Xpos=0-Re*0.5;
    }

    if (Xpos<0-Re*0.5) 
    {
      Xpos=width+Re*0.5;
    }

    if (Ypos > height+Re*0.5)
    {
      Ypos=0-Re*0.5;
    }

    if (Ypos < 0-Re*0.5)
    {
      Ypos=height+Re*0.5;
    }
  }
}
