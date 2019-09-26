class Agent {

  float xpos ;  
  float ypos ;



  Agent() {
    xpos = random(width);
    ypos =random(height);
  }

  void move() {

    xpos = lerp(xpos, mouseX, 0.09);
    ypos = lerp(ypos, mouseY, 0.09);
    
    fill(0, 0, 0, 0.01);
   
  }


  void display() {
   
    fill(0, 0, 255);
    image(rugbyman,xpos, ypos, 50, 50);
   
  }
}
