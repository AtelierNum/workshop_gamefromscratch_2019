//Création d'une class level

class Level {

  public int autoRatePop;   //Variable qui va gérer le taux de drop des burger
  public int ennemiRatePop; //Variable qui va gérer le taux de drop des pommes
  public int score;         //Variable qui va calculer le score et définir notre condition pour passer d'un niveau à l'autre
  public int coeur;         //Variable qui va gérer le taux de drop de notre coeur qui rendra une vie
  public int inversion;     //Varible qui va gérer ledrop des malus qui change la position du joueur
  public int speed;         //Variable qui va faire varier la vitesse des pommes


  public Level(int autoRatePop, int ennemiRatePop, int score, int coeur, int inversion, int speed) {
    this.autoRatePop = autoRatePop;
    this.ennemiRatePop = ennemiRatePop;
    this.score = score;
    this.coeur = coeur;
    this.inversion = inversion;
    this.speed = speed;
  }
}
