//Classe contenant les données des "bonus de vie"

class Lives {

  //Data
  public float xlpos;
  public float ylpos;
  public float rl = 10;
  color green = color(89, 250, 66);

  public float xloff = random(100);
  public float yloff = random(100);

  Lives(float _xlpos, float  _ylpos) {
    xlpos = _xlpos;
    ylpos = _ylpos;
  }


  Lives() {
  }
  void disp() {
    //Rect
    fill(green);
    noStroke();
    rect(xlpos, ylpos, 25, 25);
  }



  //Pop
  void POP() {
    xlpos += random(0, 1);
    ylpos += random(0, 1);
  }



  //Mouvement
  void movee() {
    xloff = xloff+0.005;
    yloff = yloff+0.005;

    xlpos = xlpos + (noise(xloff) * 10 - 5);
    ylpos = ylpos + map(noise(yloff), 0, 1, -5, 5) ;
  }
  //Side to Side
  void wrapp() {
    if (xlpos> width +rl*0.5)
      xlpos = 0-rl*0.5;
    if (ylpos > height +rl*0.5)
      ylpos = 0-rl*0.5;
    if (xlpos< 0 -rl*0.5)
      xlpos = width+rl*0.5;
    if (ylpos< 0 - rl*0.5)
      ylpos = height+rl*0.5;
  }
}
