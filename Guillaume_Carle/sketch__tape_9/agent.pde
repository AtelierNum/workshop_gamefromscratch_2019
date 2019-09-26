// classe agents = objets à "manger"
class Agent {
  float xoff = 0.0;
  float yoff = 10.0*score;
  float xpos ;
  float ypos ;
  float r = 30;
 

  // constructeur = initialisation des datas de notre agennt
  Agent(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
  
  spriteagent=loadImage("YouTube_monetization.png");
  }


  // calculer la nouvelle position de notre agent
  void update() {
    xoff = xoff + .01;
    yoff = yoff + .01;
    xpos = xpos + (noise(xoff)*10 - 5);
    ypos = ypos + map(noise(yoff) ,0, 1, -5, 5);
  }
  // afficher notre enemi 
  void display() {
    
 
imageMode(CENTER);
    image(spriteagent,xpos,ypos,40,40);
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
