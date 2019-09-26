class Level {
  public int NbPopBall;
  public int NbPopEnnemis;
  public int SizeBall;
  public int SizeEnnemis;
  public int SpdBall;
  public int SpdEnnemis;
  public int EnnemisDamage;
  public int SizeJoueur;
  // public int score1;
  //public int score2;
  //constructeur
  public Level(int SizeBall, int SizeEnnemis, int SpdBall, int SpdEnnemis, int EnnemisDamage, int SizeJoueur, int NbPopBall, int NbPopEnnemis) {

    this.NbPopBall = NbPopBall;  
    this.NbPopEnnemis = NbPopEnnemis;
    this.SizeBall = SizeBall;
    this.SizeEnnemis = SizeEnnemis;
    this.SpdBall = SpdBall;
    this.SpdEnnemis = SpdEnnemis;
    this.EnnemisDamage = EnnemisDamage;
    this.SizeJoueur = SizeJoueur;
    //this.score1 = score1;
    //this.score2 = score;
  }
}



//int score1, int score2
