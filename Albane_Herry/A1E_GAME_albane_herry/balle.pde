
class Balle {


  float x;
  float y;
  color couleur;
  

void display() {
    
    //fill(random(255), random(255), random(255));
    image(Pierre,x, y, 150,150);
    
  }

  void update() {

    x = lerp(x, mouseX, 0.30);
    y = lerp(y, mouseY, 0.30);
  }
}
