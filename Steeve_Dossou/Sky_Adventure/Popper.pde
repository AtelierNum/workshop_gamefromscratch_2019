class Popper{
  //Variables
  float aiX;
  float aiY;
  
  float aiSize = 40;
  
  color aiColor;
  
  float aiSpeed;
  PImage image;
  

  //Create Event
  Popper(float xR, float yR, float _aiSpeed, float _aiSize, float color1, PImage _image){
    aiX = xR;
    aiY = yR;
    aiSpeed = _aiSpeed;
    aiSize = _aiSize;
    aiColor = color(color1);
    image = _image;
  }
  
  //Move the Ai randomly
  void move(){
    aiX -= aiSpeed;
  }
  
  //Display the Ai
  void display(){
    tint(aiColor);
    noStroke();
    image(image, aiX, aiY, aiSize, aiSize);
  }
}
