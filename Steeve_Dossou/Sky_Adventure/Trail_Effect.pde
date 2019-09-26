class TrailFx{
  //Variables
  float expX;
  float expY;
  float movement;
  float expSize;
  float expFade = 255;
  color expColor;
  
  TrailFx(float _expX, float _expY, float _movement,float _expSize, float color1, float color2, float color3){
    expX = _expX;
    expY = _expY;
    movement = _movement;
    expSize = _expSize;
    expColor = color(color1, color2, color3);
  }
  
  void display(){
    expFade -= 20;
    expX += movement;
    fill(expColor, expFade);
    noStroke();
    ellipse(expX, expY, expSize, expSize);
    
  }
}
