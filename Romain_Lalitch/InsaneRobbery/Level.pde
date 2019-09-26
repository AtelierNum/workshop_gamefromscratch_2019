//création de la classe niveau qui permet d'instaurer un système de niveaux dans le jeu

class Level {
 
//appelation des variables utilisées dans le constructeur  
  public int ennemyRatePop;
  public int ennemyDamages;
  public int score;

//constructeur de la classe niveau
//plusieurs paramètre seront à rentrer lorsque les différents niveaux seront crées
  public Level( int ennemyRatePop, int ennemyDamages, int score){
   
    this.ennemyRatePop = ennemyRatePop;
    this.ennemyDamages = ennemyDamages;
    this.score = score;
   
  }
  
}
