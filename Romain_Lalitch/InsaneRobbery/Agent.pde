//création de la classe Agent qui va permettre de créer autant d'agents que l'on veut sans recopier les mêmes lignes de code

class Agent {

//création de variables qui vont être utilisées dans cet onglet  
  float x = 0.0;
  float y = 10.0;

  float xpos;
  float ypos;

//constructeur de la classe pour lequel nous devons rentrer 2 paramètres de type nombre décimal
  Agent(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.x = random(9999);
    this.y = random(9999);
    
  }

//fonction gérant le déplacement des Agents
  void position() {





    x = x + .01;
    y = y + .01;

    xpos = xpos + map(noise(x), 0, 1, -5, 5);
    ypos = ypos + map(noise(y), 0, 1, -5, 5);
  }

//fonction gérant l'aspect graphique, la position et les dimentions des Agents
  void deplacement() {
    image(liasse, xpos, ypos, 50, 50);
  }

//fonction permettant aux Agents de ne pas disparaître de la fenêtre mais de réapparaître de l'autre côté de la fenêtre
  void warp() {
    if (xpos > width) {
      xpos = 0;
    }

    if (xpos < 0) {
      xpos = width;
    }

    if (ypos > height) {
      ypos = 0;
    }

    if (ypos < 0) {
      ypos = height;
    }
  }
}
