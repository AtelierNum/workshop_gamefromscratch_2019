class Ball {

  float xpos;
  float ypos;
  float noisex;
  float noisey;

  Ball(float xpos, float ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.noisex = random(9999);
    this.noisey = random(9999);
   
  }
  void update() {


    noisex = noisex + 0.03;
    noisey = noisey + 0.03;
    xpos += map(noise(noisex), 0, 1, -5, 5) ;
    ypos += map(noise(noisey), 0, 1, -5, 5) ;
  }

  void display() {
   // fill(0, 25);
    //rect(0, 0, 1000, 1000);
    fill(255,255,255);
    noStroke(); 
    image(Romain, xpos, ypos, 100,100);
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
