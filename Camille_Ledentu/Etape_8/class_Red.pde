class Red{
  
  float xbop = random(999);
  float ybop = random (898);
  float xposi;
  float yposi;
  float ray = 40;
  
  Red (float xposi, float yposi){
    this.xposi = xposi;
    this.yposi = yposi;
     
  }
  
  void position(){
    xbop = xbop + .01;
    ybop = ybop + .01;
    xposi = xposi + (noise(xbop) *10 - 5);
    yposi = yposi + map(noise(ybop), 0, 1, -5, 5 );
  }
  
   void dessin() {
     
    fill(180,0,180);
    stroke(0);
    image(cigarette,xposi, yposi, ray, ray);
   }
   
   void condition() {            //xposi et yposi bouge de droite à gauche

    if (xposi > width + ray*0.5) {
      xposi = 0 - ray*0.5;
    }
    if (xposi < 0 - ray*0.5) {
      xposi = width + ray*0.5;
    }
    if (yposi > height + ray*0.5) {
      yposi = 0 - ray*0.5;
    }
    if (yposi < 0-ray*0.5) {
      yposi = height + ray*0.5;
    }
   }
}
