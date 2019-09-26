//musiques et sons
import processing.sound.*;
SoundFile musique;
SoundFile ouch;
SoundFile ouille;
SoundFile bravo;
SoundFile yes;


String path;
Balle fleur;
float frameCompteur = frameCount;    //nombre de frames 
int vie = 5;                         //nombre de vie par game 
int score = 0;                      //score au départ
float x;
float y;
int level ;
int j = 50;                         //variable pour la sensibilité lorsqu'on attrape un agent
int k = 10;                           
//images
PImage Romain;
PImage Maxime;
PImage Pierre;
PImage Romann;
PImage Simon;
PImage Ciel;
//listes agents
ArrayList<Ball> romain;
ArrayList<Bad> maxime;
ArrayList<Bonus> simon;
ArrayList<Malus> romann ;
//liste niveau
ArrayList<Level> etapes;
//niveaux
int currentLevelID  ;
Level currentLevel ;
boolean GAMEOVER = false;        //si gameover = faux alors on peut jouer
boolean displayMenu = true;      //affichage du menu 


float timer = 0;
boolean lecture = false;        //musique 

void setup() {

  //fond ciel :
  fullScreen(P2D);
  background(0);
  //fond et images 
  Ciel = loadImage("ciel.png");
  musique = new SoundFile(this, "arcade.wav");
  ouch = new SoundFile(this, "ouch.wav");
  ouille = new SoundFile(this, "ouille.wav");
  bravo = new SoundFile(this, "bravo.wav");
  yes = new SoundFile(this, "yes.wav");
  fleur = new Balle();
  //sons
  Maxime= loadImage("Maxime.png");
  Simon = loadImage("Simon.png");
  Romann = loadImage("Romann.png");
  Romain= loadImage("Romain.png");
  Pierre = loadImage("Pierre.png");
  //"liste" de rangements des agents + niveaux
  romain = new ArrayList<Ball>();
  maxime = new ArrayList<Bad>();
  simon = new ArrayList<Bonus>();
  romann = new ArrayList <Malus>();
  etapes = new ArrayList<Level>();

  //liste des étapes / niveaux 
  etapes.add(new Level(200, 300, 200, 400, 300, 30, 10, 3, 1));
  currentLevel = etapes.get(currentLevelID);
  etapes.add(new Level(220, 250, 250, 350, 450, 25, 15, 5, 2));
  etapes.add(new Level(240, 210, 300, 250, 700, 20, 20, 4, 3));
  etapes.add(new Level(260, 190, 350, 200, 850, 19, 25, 3, 5));
  etapes.add(new Level(280, 210, 400, 150, 850, 17, 28, 2, 7));
  etapes.add(new Level(300, 230, 500, 50, 1200, 15, 30, 1, 10));

  println(etapes.size());
  println(currentLevelID);

  imageMode(CENTER);
  noCursor();
  frameRate(60);
}


void draw() {

  timer +=0.03; 
  image(Ciel, width/2, height/2, width, height);

  if (lecture == false) {
    musique.loop();                        //lecture de la musique 
    lecture= true;
  }

  if (displayMenu == true) {
    //affichage du menu
    textAlign(LEFT, CENTER);
    fill(random(255), random(255), random(255));
    textSize(90);
    text(" press r and let's go", 500, 950);
    textSize(40);
    fill(255, 255, 255);
    text("les règles:tu es pierre,élève de A1E, certains de tes camarades sont tes potes,d'autres tes ennemis", 0, 250);
    textSize(150);
    fill(random(255), random(255), random(255));
    text("A1E GAME", 400, 120);
    image(Romain, 400, 350, 100, 100);
    textSize(35); 
    fill(240, 35, 180);
    text("ici Romain, il est gentil: tu dois l'attraper, il te fait gagner 50 points", 530, 350); 
    fill(35, 156, 234);
    image(Maxime, 500, 450, 100, 100);
    text("ici Maxime, c'est un méchant! - 1 de point de vie en si tu l'attrapes", 530, 450);
    image(Simon, 400, 550, 100, 100);
    fill(240, 35, 180);
    text("ici BONUS SIMON: dur a attraper, mais il te fait gagner 100 points", 530, 550);
    image(Romann, 500, 650, 100, 100);
    fill(35, 156, 234);
    text("ici MALUS ROMANN: il est rouge, ne l'attrape pas! sinon -2 vie,-200 points", 530, 650);
    noStroke();
    strokeWeight(1);
  } else {


    if (GAMEOVER== false) {                // quand game over est faux, toutes les étapes des classes doivent être effectives 

      fleur.update();

      fleur.display();

      //trainee();

      romain();

      maxime();

      simon();

      romann();

      defaite();

      texte();
    } else {                             

      victoire();
    }
  }
}

void keyPressed() {
  if (key == 'm' || key == 'M') {                      //quand m est pressé --> le jeu peut démarrer 
    GAMEOVER = false;
    displayMenu = true;
    currentLevelID = 0;
    background(0);
    fleur = new Balle();

    romain = new ArrayList<Ball>();
    maxime = new ArrayList<Bad>();
    simon = new ArrayList<Bonus>();
    romann = new ArrayList <Malus>();
  }

  if (key == 'r' || key == 'R') {
    GAMEOVER = false;
    displayMenu = false;
    score = 0;
    currentLevelID=0;
    vie = 5;
    background(0);
    fleur = new Balle();
  }
}


void romain() {
  if (frameCount%currentLevel.romainTemps == 0 && romain.size()<currentLevel.romainMax ) {     //pour le temps de pop selon les règles des étapes
    for (int i=0; i<2; i++) {
      romain.add(new Ball(random(width), random(height)));
    }
  }

  for (int i = 0; i < romain.size(); i++) {                                                 //pour suivre et rendre effectives les étapes de la classe de l'agent
    Ball a = romain.get(i);
    a.update();
    a.display();
    a.wrap();

    if (dist(fleur.x, fleur.y, romain.get(i).xpos, romain.get(i).ypos) < j) {             //si on touche cet agent avec notre balle
      romain.remove(i);                                                                 //il disparaît
      score+=50;                                                                       //le score augmente de 50 
      yes.play();                                                                      //un son pré-enregistré est joué
    }
  }
}
//même procédé pour les agents Maxime, les bonus Simon et les malus Romann ( les conséquences et temps de pop sont différents)
void maxime() {
  if (frameCount% currentLevel.maximeTemps == 0 && maxime.size()<currentLevel.maximeMax) {
    for (int i=0; i<2; i++) {
      maxime.add(new Bad(random(width), random(height)));
    }
  }

  for (int i = 0; i < maxime.size(); i++) {
    Bad f = maxime.get(i);
    f.update();
    f.display();
    f.wrap();

    if (dist(fleur.x, fleur.y, maxime.get(i).xpos, maxime.get(i).ypos) < j) {
      maxime.remove(i);
      vie--;
      ouch.play();
    }
  }
}
void simon() {
  if (frameCount%currentLevel.simonTemps == 0 && simon.size()<currentLevel.simonMax) {
    for (int i=0; i<1; i++) {
      simon.add(new Bonus(random(width), random(height)));
    }
  }

  for (int i = 0; i < simon.size(); i++) {
    Bonus u = simon.get(i);
    u.update();
    u.display();
    u.wrap();

    if (dist(fleur.x, fleur.y, simon.get(i).xpos, simon.get(i).ypos) < j) {
      simon.remove(i);
      score+=100;
      bravo.play();
    }
  }
}

void romann() {
  if (frameCount%currentLevel.romannTemps == 0 && romann.size()<currentLevel.romannMax) {
    for (int i=0; i<1; i++) {
      romann.add(new Malus(random(width), random(height)));
    }
  }

  for (int i = 0; i < romann.size(); i++) {
    Malus u = romann.get(i);
    u.update();
    u.display();
    u.wrap();

    if (dist(fleur.x, fleur.y, romann.get(i).xpos, romann.get(i).ypos) < j) {
      romann.remove(i);
      vie-=2;
      score-=200;
      ouille.play();
    }
  }

  if (score >= currentLevel.score ) {                                              //lorsque le score est supérieur au score objectif de l'étape
    if ( currentLevelID < etapes.size()-1) {                
      timer = 0;
      currentLevelID++;                                                         //le niveau augmente, l'objectif de score avec
      println(currentLevelID);
      currentLevel = etapes.get(currentLevelID);
      romain.clear();                                                            //les agents du niveau précédent s'effacent
      maxime.clear();
      romann.clear();
      simon.clear();
      score = 0;
    } else if (score >= 1200) {                              // si le score est inférieur a l'objectif final, gameover est vrai, on ne peut jamais gagné sans atteindre 1200
      println("gameover");
      GAMEOVER = true;
    }
  }
}

//pour l'affichage du game over
void defaite() {
  if (vie <= 0) {                            // si on a plus de vie 
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    text("GAME OVER", 600, 200);
    textSize(100);
    fill(255, 255, 255);
    text("tap m to go to menu", 600, 600);
  }
}
//affichage de victoire
void victoire() { 

  background(0);
  textSize(200);
  text("YOU", 1200, 200);
  text("WIN", 1200, 400);
  textSize(100);
  text("tap m to go to menu", 1200, 600);
}
//affichage des autres paramètres 
void texte() {
  fill(255);
  textAlign(CENTER, TOP);
  textSize(40);
  text("Score : " +score, width/2, 20);

  fill(255, 100, 100);
  textAlign(LEFT, TOP);
  textSize(60);
  text("Vie x" +vie, 0, 0);

  fill(255, 100, 100);
  textAlign(RIGHT, TOP);
  textSize(60);
  text("Goal : " + currentLevel.score, width, 0);

  //affichage d'une phrase pour prévenir lorsqu'on passe un niveau 
  if (timer < PI) {
    if (currentLevelID > 0) {
      fill(random(255), random(255), random(255), sin(timer)*255);
      textSize(100);
      text("Level " + currentLevelID + "accomplished", 1500, 500);
    }
  }
}

//void trainee() {

//noStroke();
//fill(0, 0, 0, 20);

//rect(0, 0, width, height);
//}
