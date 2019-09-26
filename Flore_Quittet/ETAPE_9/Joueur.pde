class Joueur
{
  float Xm = mouseX;
  float Ym = mouseY;

  float Xb = 500;
  float Yb = 500;

  float R = 50;

  void update(float SpeedJoueur)
  {
    Xm = mouseX;
    Ym = mouseY;
    Xb = lerp (Xb, Xm, 0.2-SpeedJoueur); // (origine, cible, coef)  0=<coef<=1
    Yb = lerp (Yb, Ym, 0.2-SpeedJoueur); // (origine, cible, coef)  0=<coef<=1
  }
  void display(int SizeJoueur)
  {
    fill(0, 120, 120);
    image(Joueur,Xb, Yb, 25 + SizeJoueur, 25 + SizeJoueur);
  }
}
