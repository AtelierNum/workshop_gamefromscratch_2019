class Malus {

  float xpos;
  float ypos;
  float noisex;
  float noisey;

  Malus(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.noisex = random(9999);
    this.noisey = random(9999);
  
  }
  void update() {


    noisex = noisex + 0.03;
    noisey = noisey + 0.03;
    xpos += map(noise(noisex), 0, 1, -10, 10) ;
    ypos += map(noise(noisey), 0, 1, -10, 1) ;
  }

  void display() {
   // fill(0, 25);
    //rect(0, 0, 1000, 1000);
    fill(0,230,71);
    noStroke(); 
    image(Romann,xpos, ypos, 70, 70);
  }

  void wrap() {
    if (xpos>width) {
      xpos = 0;
    }
    if (xpos<0) {
      xpos = width;
    }

    if (ypos>height) {
      ypos = 0;
    }

    if (ypos<0) {
      ypos = height;
    }
  }
}
