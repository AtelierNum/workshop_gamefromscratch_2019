// classe cercle : notre personnage que l'on contrôle
class Cercle {
  float xpos;
  float ypos;
  float r;



  // constructeur = initialisation des datas de notre personage
  Cercle() {
   
    this.xpos = mouseX;
    this.ypos = mouseY;
   this.r=70;
    
    spritecercle=loadImage("banane wankil.png");
    
  
  }

  // calculer la nouvelle position de notre personage
  void update() {
    xpos = lerp(xpos, mouseX, 1);
    ypos = lerp(ypos, mouseY, 1);
  }

  // afficher notre personage 
  void display() {
  
  
    imageMode(CENTER);
    image(spritecercle,xpos,ypos,250,125);
    
    

  
  }
}
