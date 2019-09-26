// classe agents = objets à "manger"
class Agent {
  float xoff = 0.0;
  float yoff = 10.0;
  float xpos ;
  float ypos ;
  float r = 10;

  // constructeur = initialisation des datas de notre agennt
  Agent(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
  }

  // calculer la nouvelle position de notre agent
  void update() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    xpos = xpos + (noise(xoff)*10 - 5);
    ypos = ypos + map(noise(yoff), 0, 1, -5, 5);
  }

  // afficher notre agent 
  void display() {
    noStroke();
    fill(#FFEA00, random(100));

    ellipse(xpos, ypos, 15, 15);

    fill(#FFEA00, random(50, 55));

    ellipse(xpos, ypos, random(35, 50), random(35, 50));

    fill(#FFEA00);

    ellipse(xpos, ypos, 10, 10);
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
