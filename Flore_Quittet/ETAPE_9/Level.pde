class Level
{
  public int NbPopBall;
  public int NbPopEnnemis;
  public int SizeBall;
  public int SizeEnnemis;
  public int SpeedBall;
  public int SpeedEnnemis;
  public int SizeJoueur;
  public float SpeedJoueur;

  //constructeur
  public Level(int NbPopBall, int NbPopEnnemis, int SizeBall, int SizeEnnemis, int SpeedBall, int SpeedEnnemis, int SizeJoueur, float SpeedJoueur)
  {
    this.NbPopBall = NbPopBall;
    this.NbPopEnnemis = NbPopEnnemis;
    this.SizeBall = SizeBall;
    this.SizeEnnemis = SizeEnnemis;
    this.SpeedBall = SpeedBall;
    this.SpeedEnnemis = SpeedEnnemis;
    this.SizeJoueur = SizeJoueur;
    this.SpeedJoueur=SpeedJoueur;
    
  }
}
