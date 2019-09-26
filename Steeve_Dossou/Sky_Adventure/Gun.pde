class Gun{
  //Variables
  float bulletX;
  float bulletY;
  
  float bulletSize = 20;
  
  float bulletSpeed;
  PImage bullet;

  //Create Event
  Gun(float xR, float yR, float _aiSpeed){
    bulletX = xR;
    bulletY = yR;
    bulletSpeed = _aiSpeed;
    bullet = loadImage("data/images/bullet.png");
  }
  
  //Move the Ai randomly
  void move(){
    bulletX += bulletSpeed;
  }
  
  //Display the Ai
  void display(){
    noStroke();
    image(bullet, bulletX, bulletY, 120, 80);
  }
}
