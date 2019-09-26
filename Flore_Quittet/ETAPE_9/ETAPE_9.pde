
PImage Poule;
PImage Joueur;
PImage Aubergine;
PImage Fond;
PImage FondV;
PImage FondD;

import processing.sound.*;
SoundFile V;
SoundFile D;
SoundFile B;
SoundFile E;
SoundFile F;

//classe balls / objet : ball
ArrayList<ball> balls;

//classe Ennemis / objet:ennemis
ArrayList<Ennemis> ennemis;

// classe Level / objet: levels
ArrayList<Level> levels;


Joueur J;

boolean started = false;
int score = 0;

int Vie=5;
int Niveau;
//classe level
int currentLevelID=0;

Level L;

void setup()
{
  fullScreen();
  noCursor();


  //importation des images
  Poule = loadImage("poule.png");
  Joueur = loadImage("joueur.png");
  Aubergine = loadImage("Aubergine.png");
  Fond = loadImage("fond copie.jpg");
  FondV = loadImage("fond de victoire.png");
  FondD = loadImage ("Fond défaite.png");

  // point des image = le centre 
  imageMode(CENTER);


  balls=new ArrayList<ball>();   // création d'une liste boule gentille
  ennemis=new ArrayList<Ennemis>();     // création d'une liste boule ennemis
  levels =new ArrayList<Level>();

  V = new SoundFile(this, "Musique victoire.wav");
  D = new SoundFile(this, "musique défaite.wav");
  B = new SoundFile(this, "Croque 2.wav");
  E = new SoundFile(this, "vomi 1.wav");
  F = new SoundFile(this, "Musique Fond .wav");

  //constructeur level 1 (0+1) 5/10

  levels.add(new Level( 20, -5, 40, 20, -5, -3, 5, 0 )); //-5 speedEnnemis = pas de mouvement


  //constructeur level 2 (1+1) 10/15

  levels.add(new Level( 10, -2, 30, 30, -2, -3, 10, 0.01 )); 



  // constructeur level 3 (2+1) 15/20

  levels.add(new Level( 5, -1, 25, 35, 0, -2, 15, 0.05 ));


  // constructeur level 4 (3+1)  20/25

  levels.add(new Level( 5, 0, 20, 40, 1, -1, 20, 0.07 ));


  //contructeur level 5 (4+1) 25/30

  levels.add(new Level( 0, 1, 10, 45, 4, 0, 30, 0.1 ));

  //contructeur level 6 (5+1) 30/35

  levels.add(new Level( -2, 2, 5, 50, 6, 2, 40, 0.17 ));

  J = new Joueur();          // boule du joueur

  F.amp(0.5);
  F.loop();
}


void draw()
{
  image(Fond, width/2, height/2);

  J.display(levels.get(currentLevelID).SizeJoueur);
  J.update(levels.get(currentLevelID).SpeedJoueur);

  //level 1
  if (score >=0 && score <= 5)
  {
    currentLevelID = 0; 
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 1 sur 6", 1080, 10);
  }

  if (score >=6 && score <= 10)
  {
    currentLevelID=1;
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 2 sur 6", 1080, 10);
  }

  if (score>=11 && score <= 15)
  {
    currentLevelID = 2;
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 3 sur 6", 1080, 10);
  }
  if (score >= 16 && score <=20)
  {
    currentLevelID = 3;
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 4 sur 6", 1080, 10);
  }
  if (score >= 21 && score <= 25)
  {
    currentLevelID= 4;
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 5 sur 6", 1080, 10);
  }

  if (score >= 26 && score <= 30)
  {
    currentLevelID = 5;
    println(Niveau);
    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);  
    text("Niveau 6 sur 6", 1080, 10);
  }


  for (int i = 0; i<balls.size(); i++)  //piche dans le tableau les données pour les créer
  {
    ball a = balls.get(i);

    a.update(levels.get(currentLevelID).SpeedBall);
    a.display(levels.get(currentLevelID).SizeBall);
    a.wrap();

    // calcul de distance boule gentilles/joueurs
    float D = dist(J.Xb, J.Yb, a.xpos, a.ypos);             // Trouver le point de position de la boule 

    if (D<25)
    {
      balls.remove(i);
      score = score+1;
      started = true;
      levels.get(currentLevelID).SizeJoueur =levels.get(currentLevelID).SizeJoueur +5;
      B.play();
    }
  }
  for (int k=0; k<ennemis.size(); k++)
  {
    Ennemis e = ennemis.get(k);
    e.update(levels.get(currentLevelID).SpeedEnnemis);
    e.display(levels.get(currentLevelID).SizeEnnemis );
    e.wrap();

    //calcule distance ennemis/joueur
    float Di = dist(J.Xb, J.Yb, e.Xpos, e.Ypos);

    //création du score/des vies en moins/plus d'ennemis
    if (Di<25)
    {
      ennemis.remove(k);
      Vie=Vie-1;
      E.play();
    }

    // création du game over
    if (Vie==0 )
    {
      background(290, 100, 46);
      fill (255);
      textSize (60);
      textAlign(CENTER, CENTER);

      D.play();
      D.amp(0.5);
      image(FondD, width/2, height/2);
      text("GAME OVER", 180, 70);
      F.stop();
      stop();
    }

    //créaton du VICTOIRE
    if (score == 30)
    {
      background(290, 100, 46);
      fill (255);
      textSize (60);
      textAlign(CENTER, CENTER);
      image(FondV, width/2, height/2);
      text("VICTOIRE", 650, 700);
      V.play();
      V.amp(0.3);
      F.stop();
      stop();
    }


    // écriture du nombre de vie
    println (Vie);

    fill (255);
    textSize (20);
    textAlign (LEFT, TOP);
    text("Vie : "+Vie, 10, 10);
  }


  //pop

  if (frameCount %(120 - levels.get(currentLevelID).NbPopBall) == 0)
  {
    for (int i = 0; i<1; i++)      //boucle for = 1  nouvelles boulles 
    {
      ball a;
      a = new ball(random(width), random(height));
      balls.add(a);
    }
  }
  if (frameCount %(120 - levels.get(currentLevelID).NbPopEnnemis) == 30)  //modulo=pourcentage  / 30 =valeur du modulo
  {
    for (int k=0; k<1; k++)
    {
      Ennemis e;
      e= new Ennemis(random(width), random(height));
      ennemis.add(e);
    }
  }

  // écriture du score
  println (score);

  fill (255);
  textSize (20);
  textAlign (CENTER, TOP);
  text("score: "+score, width/2, 50);
}

// création de la fonction
void traine(float a) // création de la fonction
{
  fill(0, 0, 0, a);       // effet de transparence
  rect(0, 0, width, height); // rectangle transparent
}
