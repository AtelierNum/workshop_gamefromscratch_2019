//Le code des niveaux. Il y en a dix en totalité

class Level {

  //Variables

  public int autoRatePop; //Variable d'apparition des notes bleues
  public int autoLimit;  //Variable d'apparition des notes bleues
  public int ennemiRatePop;  //Variable limitant l'apparition des ennemis
  public int ennemiLimit;  //Variable d'apparition des ennemis
  public int lifeRatePop;  //Variable d'apparition des "bonus de vie"
  public int lifeLimit;  //Variable limitant l'apparition des "bonus de vie"
  public int malusRatePop;  //Variable d'apparition des malus
  public int malusLimit;  //Variable limitant l'apparition des malus
  public int score;  //Variable du score

  //Système de levelling
  public Level(
    int autoRatePop, 
    int autoLimit, 
    int ennemiRatePop, 
    int ennemiLimit, 
    int lifeRatePop, 
    int lifeLimit, 
    int malusRatePop, 
    int malusLimit, 
    int score) {
    this.autoRatePop = autoRatePop;
    this.autoLimit = autoLimit;
    this.ennemiRatePop = ennemiRatePop;
    this.ennemiLimit = ennemiLimit;
    this.lifeRatePop = lifeRatePop;
    this.lifeLimit = lifeLimit;
    this.malusRatePop = malusRatePop;
    this.malusLimit = malusLimit;
    this.score = score;
  }
}
