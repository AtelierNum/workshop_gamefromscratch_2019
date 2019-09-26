//Ici, sont codées les données des entités que le joueur devra ramasser afin de gagner des points
//Ces dernières apparaissent sous la forme de notes blees

class Auto {

  //Data
  public float xpos;
  public float ypos;
  public float r = 30;
  color white = color(255, 255, 255);

  public float xoff = random(100);
  public float yoff = random(100);

  Auto(float _xpos, float  _ypos) {
    xpos = _xpos;
    ypos = _ypos;

   
  }


  Auto() {
  }
  void display() {
    //Ellipse

    imageMode(CENTER);
    image(notebleue, xpos, ypos, 130, 130);
  }



  //Pop
  void pop() {
    xpos += random(0, 1);
    ypos += random(0, 1);
  }



  //Mouvement
  void moveit() {
    xoff = xoff+0.005;
    yoff = yoff+0.005;

    xpos = xpos + (noise(xoff) * 10 - 5) * 2;
    ypos = ypos + (noise(yoff) * 10 - 5) * 2;
  }
  //Side to Side
  void wrap() {
    if (xpos> width +r*0.5)
      xpos = 0-r*0.5;
    if (ypos > height +r*0.5)
      ypos = 0-r*0.5;
    if (xpos< 0 -r*0.5)
      xpos = width+r*0.5;
    if (ypos< 0 - r*0.5)
      ypos = height+r*0.5;
  }
}
