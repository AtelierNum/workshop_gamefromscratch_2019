// classe agents = objets à "manger"
class Bonus {
  float xoff = 0.0;
  float yoff = 15.0;
  float xpos ;
  float ypos ;
  float r = 20;
  
  

  // constructeur = initialisation des datas de notre agennt
  Bonus(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
    
    spritebonus=loadImage("laink le boss.png");
  }

  // calculer la nouvelle position de notre agent
  void update() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    xpos = xpos + (noise(xoff)*15 - 3);
    ypos = ypos + map(noise(yoff), 0, 1, -3, 3);
  }
  // afficher notre enemi 
  void display() {
  imageMode(CENTER);
    image(spritebonus,xpos,ypos,70,35);
  }
  // faire en sorte que notre personage réapparaisse à l'opposé lorsqu'il sort de l'écran
  void wrap() {
    if (xpos> width + r*0.5) {
      xpos = 0-r*0.5;
    }
    if (xpos< 0 - r*0.5) {
      xpos = width + r*0.5;
    }
    if (ypos> height + r*0.5) {
      ypos = 0 - r*0.5;
    }
    if (ypos< 0 - r*0.5) {
      ypos = height + r*0.5;
    }
  }

}
