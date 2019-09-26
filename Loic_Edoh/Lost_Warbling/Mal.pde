//Classe contenant les données des malus

class Mal {

  //Data
  public float xmpos;
  public float ympos;
  public float rm = 15;
  color red = color(255,0,0);

  public float xmoff = random(100);
  public float ymoff = random(100);

  Mal(float _xmpos, float  _ympos) {
    xmpos = _xmpos;
    ympos = _ympos;
  }


  Mal() {
  }
  void disp() {
    //Rect
    fill(red);
    noStroke();
    rect(xmpos, ympos, 25, 25);
  }



  //Pop
  void POp() {
    xmpos += random(0, 1);
    ympos += random(0, 1);
  }



  //Mouvement
  void moveee() {
    xmoff = xmoff+0.005;
    ymoff = ymoff+0.005;

    xmpos = xmpos + (noise(xmoff) * 10 - 5);
    ympos = ympos + map(noise(ymoff), 0, 1, -5, 5) ;
  }
  //Side to Side
  void wrappp() {
    if (xmpos> width +rm*0.5)
      xmpos = 0-rm*0.5;
    if (ympos > height +rm*0.5)
      ympos = 0-rm*0.5;
    if (xmpos< 0 -rm*0.5)
      xmpos = width+rm*0.5;
    if (ympos< 0 - rm*0.5)
      ympos = height+rm*0.5;
  }
}
