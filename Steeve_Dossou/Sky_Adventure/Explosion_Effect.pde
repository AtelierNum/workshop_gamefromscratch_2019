class ExplosionFx{
  //Variables
  float expX;
  float expY;
  float expSize;
  float expFade = 255;
  float expExpand;
  color expColor;
  
  ExplosionFx(float _expX, float _expY, float _expSize, float color1, float color2, float color3){
    expX = _expX;
    expY = _expY;
    expSize = _expSize;
    expColor = color(color1, color2, color3);
  }
  
  void display(){
    expExpand += 2;
    expFade -= 10;
    fill(expColor, expFade);
    noStroke();
    ellipse(expX, expY, expSize + expExpand, expSize + expExpand);
    
  }
}
