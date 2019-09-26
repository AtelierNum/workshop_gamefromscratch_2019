// classe ennemis = objets à "pas manger"
class Ennemi {
  float xoffb = 0.0;
  float yoffb = 10.0;
  float xposb ;
  float yposb ;
  float r = 10;

  // constructeur = initialisation des datas de notre ennemis
  Ennemi(float xposb, float yposb) {
    this.xposb = xposb;
    this.yposb = yposb;
    this.xoffb = random(9999);
    this.yoffb = random(9999);
  }

  // calculer la nouvelle position de notre agent
  void update() {
    xoffb = xoffb + .02;
    yoffb = yoffb + .02;
    xposb = xposb + map(noise(xoffb), 0, 1, - 5, 5);
    yposb = yposb + map(noise(yoffb), 0, 1, -5, 5);
  }

  // afficher notre agent 
  void display() {
    noStroke();        
   fill(150, 0, 0,random(100));

    ellipse(xposb, yposb, 15, 15);

    fill(random(150,255), 0, 0,random(100,255));

    ellipse(xposb, yposb, random(35,50), random(35,50));

    fill(0,0,0);

    ellipse(xposb, yposb, 10, 10);
  }

  // faire en sorte que notre personage réapparaisse à l'opposé lorsqu'il sort de l'écran
  void wrap() {
    if (xposb> width + r*0.5) {
      xposb = 0-r*0.5;
    }
    if (xposb< 0 - r*0.5) {
      xposb = width + r*0.5;
    }
    if (yposb> height + r*0.5) {
      yposb = 0 - r*0.5;
    }
    if (yposb< 0 - r*0.5) {
      yposb = height + r*0.5;
    }
  }
}
