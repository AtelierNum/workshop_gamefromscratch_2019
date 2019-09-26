class Player {
  //Variables
  float ballX;
  float ballY;
  
  boolean bonus = false;
  int bonusTime = 300;
  
  boolean hurtAble = true;
  int hurtTime = 60;
  int blink = 255;
  int blinkTime = 10;
  
  float fall;
  
  PImage player;

  //Initialize the variables
  Player() {
    ballX = 150;
    ballY = height/2;
    player = loadImage("data/images/plane_0.png");
  }

  //Display the ball
  void display() {
    tint(255, 255, 255, blink);
    noStroke();
      image(player, ballX, ballY, 200, 100);
    
    //Hit lag
    if (hurtAble == false){
     hurtTime -= 1;
     blinkTime -= 1;
     if (blinkTime > 5 && blinkTime < 10) {blink = 255;}
     if (blinkTime > 0 && blinkTime < 5) {blink = 85;}
     if (blinkTime <= 0) {blinkTime = 10;}
    } else {
       blink = 255;
       blinkTime = 10;
    }
    
    if (hurtTime <= 0) {
      hurtAble = true;
      hurtTime = 60;
    }
    
    
  }

  //Move the Player
  void move() {
      ballX = 150;
      if (lifePoints > 0 && fuel > 0) {ballY = lerp(ballY, mouseY, 0.07); fall = 0;}
      
      if (lifePoints > 0 && fuel > 0 && ballY >= height - 30) {ballY = height - 30;}
      
      if (lifePoints <= 0 || fuel <= 0) { 
        fall += 0.05; ballY += fall * fall; 
        
      }
      
      if (bonus) { 
        //Time of the bonus
        bonusTime--;
        
      } else {bonusTime = 300;}
      if (bonusTime <= 0) {
        bonusTime = 300;
        bonus = false;
      }
      
      
    }
}
