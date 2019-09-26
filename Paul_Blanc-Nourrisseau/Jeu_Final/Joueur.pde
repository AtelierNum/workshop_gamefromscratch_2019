class joueur {

  float Xm = mouseX;
  float Ym = mouseY;

  float X = 0;
  float Y = 0;
  float r = 50;



  void update() {
    Xm = mouseX;
    Ym = mouseY;
    X = X + (Xm - X)/10;  // on peut utiliser la fonction lerp(X,Y,Z)
    Y = Y + (Ym - Y)/10;
  }
  void display() {

    stroke(255, 255, 255);
    strokeWeight(10);
    noFill();
    image(D,X, Y, r, r);
  }
}
