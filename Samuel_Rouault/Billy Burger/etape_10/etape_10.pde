//Toutes les ArrayList
ArrayList<Auto> auto = new ArrayList<Auto>(); //Arraylist pour les agents nourriture
ArrayList<Ennemi> ennemi = new ArrayList<Ennemi>(); //Arraylist pour les agents ennemies
ArrayList<Level> level = new ArrayList<Level>(); //Arraylist pour les level
ArrayList<Coeur> coeur = new ArrayList<Coeur>(); //Arraylist pour les coeur
ArrayList<Malus> malus = new ArrayList<Malus>();//Arraylist pour les malus d'inversion

//Varriable pour calculer la distance entre le joueur et les ennemies
float dn = 0;
float de = 0;

//Variable du score et des vies
int score = 0;
int vies = 4;

//Variable de level
int curentlevelID = 0;
Level curentlevel;

//Variable pour restart le jeu
boolean pause = true;
int exit = 0;

//Variable pour le malus
public boolean invert = true;

//Images du jeu
PImage player;
PImage burger;
PImage bonusvie;
PImage bouteille;
PImage apple;
PImage fond;

//Sons du jeu
public boolean stop = true;
public boolean stopmusic = true;
import processing.sound.*;

SoundFile cri;
SoundFile explosion;
SoundFile victoire;
SoundFile bonuscoeur;
SoundFile gameover;
SoundFile inversion;
SoundFile musique;

//Déclaration d'un objet qui est le joueur
Ball myBall;

void setup() {

  //Création des sons
  cri =  new SoundFile(this, "data/sounds/cri.mp3");
  cri.amp(0.2);
  explosion = new SoundFile(this, "data/sounds/explosion.mp3");
  explosion.amp(0.1);
  victoire = new SoundFile(this, "data/sounds/victoire.mp3");
  bonuscoeur = new SoundFile(this, "data/sounds/bonuscoeur.mp3");
  bonuscoeur.amp(0.5);
  gameover = new SoundFile(this, "data/sounds/gameover.mp3");
  inversion = new SoundFile(this, "data/sounds/inversion.mp3");
  musique = new SoundFile(this, "data/sounds/musique.wav");
  musique.amp(0.2);

  //Image
  player = loadImage("data/sprite/player.png");
  burger = loadImage("data/sprite/burger.png");
  player = loadImage("data/sprite/player.png");
  bonusvie = loadImage("data/sprite/bonusvie.png");
  apple = loadImage("data/sprite/apple.png");
  bouteille = loadImage("data/sprite/bouteille.png");
  fond = loadImage("data/sprite/fond.jpg");

  //Création des niveaux
  level.add(new Level(60, 200, 10, 10000, 10000, 10));
  curentlevel = level.get(curentlevelID);
  level.add(new Level(60, 190, 20, 10000, 10000, 20));
  level.add(new Level(60, 170, 30, 10000, 500, 30));
  level.add(new Level(60, 150, 40, 300, 500, 40));
  level.add(new Level(60, 130, 50, 10000, 450, 50));
  level.add(new Level(60, 110, 60, 300, 300, 50));
  level.add(new Level(60, 90, 70, 10000, 200, 60));
  level.add(new Level(60, 70, 80, 300, 200, 60));
  level.add(new Level(60, 50, 90, 10000, 200, 70));
  level.add(new Level(60, 40, 100, 300, 100, 80));
  level.add(new Level(60, 35, 110, 10000, 100, 90));

  //Mise du jeu en plein écran et apparition du joueur
  fullScreen();
  myBall = new Ball();
}
void draw() {

  //println(myBall.inversionx);
  //println(myBall.inversiony);
  //println(myBall.xcercle);
  //println(myBall.ycercle);
  //Gestion du background
  imageMode(CENTER);
  image(fond, width/2, height/2);
  myBall.update();
  myBall.display();

  //Quitter le jeu avec la touche p

  if (key == 'p') {
    exit();
  }
  //Fonction de restart du jeu avec la touche a
  if (key == 'a') {
    pause = false;
    score = 0;
    curentlevelID = 0;
    curentlevel = level.get(curentlevelID);
    vies = 4;
    stop = true;
    musique.stop();
    musique.play();
  }

  //Gestion du score
  fill(255);
  textAlign(LEFT);
  textSize(40);
  text("Score : "+score + "/" +curentlevel.score, 30, 30);

  //Gestion des vies
  fill(255);
  textAlign(RIGHT);
  textSize(40);
  text("Life :" +vies, width -30, 30);

  //Gestion des niveau
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("Level :" +curentlevelID, +width/2, 30);

  //Musique de fond
  if (stopmusic == true) {
    musique.loop();
    stopmusic = false;
  }

  //Gestion du Game Over
  if (vies <=0) {
    ennemi.clear();
    auto.clear();
    malus.clear();
    coeur.clear();
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(80);
    text("GAME OVER", width/2, height/2);
    textAlign(CENTER);
    textSize(50);
    text("CLICK A TO RESTART", width/2, height +300);
    if (stop) {
      musique.stop();
      gameover.play();
      stop = false;
    }
    //Restart une partie avec la touche a
    if (key == 'a') {
      pause = false;
      score = 0;
      curentlevelID = 0;
      curentlevel = level.get(curentlevelID);
      vies = 4;
      stop = true;
      musique.stop();
      musique.play();
    }
  }

  //Gestion des ennemies mangeables
  for (int i = 0; i < auto.size(); i++) {
    Auto myAuto = auto.get(i);
    //println(myAuto.xpos);
    //println(myAuto.ypos);
    myAuto.auto();
    myAuto.move();
    myAuto.wrap();
    //Calcul distance ente le joueur et les ennemies pour les supprimer
    dn =dist(myBall.xcercle, myBall.ycercle, myAuto.xpos, myAuto.ypos);
    if (dn < 40) {
      auto.remove(i);
      explosion.play();
      score = score +1;
    }
  }
  //Gestion de l'apparition des burgers en fonction des paramètres du niveau actuel du niveau
  if (frameCount % curentlevel.autoRatePop == 0) {
    for (int i = 0; i ==0; i++) {
      auto.add(new Auto(random(width), random(height)));
    }
  }
  //Gestion des ennemies
  for (int i = 0; i < ennemi.size(); i++) {
    Ennemi myEnnemi = ennemi.get(i);
    //println(myEnnemi.xpos);
    //println(myEnnemi.ypos);
    myEnnemi.ennemi();
    myEnnemi.move();
    myEnnemi.wrap();
    de =dist(myBall.xcercle, myBall.ycercle, myEnnemi.xpos, myEnnemi.ypos);
    if (de < 40) {
      ennemi.remove(i);
      cri.play();
      vies = vies -1;
    }
  }
  //Gestion de l'apparition des pommes en fonction des paramètres du niveau actuel du niveau
  if (frameCount % curentlevel.ennemiRatePop == 0) {
    for (int i = 0; i ==0; i++) {
      ennemi.add(new Ennemi(random(width), random(height), curentlevel.speed));
    }
  }
  //Gestion du passage de level en fonction du score
  if (score >= curentlevel.score) {
    ennemi.clear();
    auto.clear();
    malus.clear();
    coeur.clear();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(0, 0, width*2, height*2);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(80);
    text("NEXT LEVEL", width/2, height/2);

    if (frameCount % 120 ==0) {
      curentlevelID++;
      curentlevel = level.get(curentlevelID);
    }
  }
  //Ajout de coeur pour récupérer une vie
  for (int i = 0; i < coeur.size(); i++) {
    Coeur myCoeur = coeur.get(i);
    //println(myCoeur.xpos);
    //println(myCoeur.ypos);
    myCoeur.coeur();
    myCoeur.movecoeur();
    //Calcul distance ente le joueur et le coeur
    dn =dist(myBall.xcercle, myBall.ycercle, myCoeur.xpos, myCoeur.ypos);
    if (dn < 40) {
      coeur.remove(i);
      bonuscoeur.play();
      vies = vies +1;
    }
  }
  //Gestion de l'apparition des coeurs en fonction des paramètres du niveau actuel du niveau
  if (frameCount % curentlevel.coeur == 0) {
    for (int i = 0; i ==0; i++) {
      coeur.add(new Coeur(random(width), random(height)));
    }
  }
  //Ecran de victoire qui apparait quand le joueur atteint 101 de score
  if (score >=101) {
    ennemi.clear();
    auto.clear();
    coeur.clear();
    malus.clear();
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text("VICTORY", width/2, width/2);
    textSize(50);
    text("PRESS P TO EXIT THE GAME", width/2, height/2-200);
    text("PRESS A TO RESTART THE GAME", width/2, height/2-400);

    if (stop) {
      musique.stop();
      victoire.play();
      stop = false;
    }
    //Quitter le jeu avec la touche p

    if (key == 'p') {
      exit();
    }
    //Fonction de restart du jeu avec la touche a
    if (key == 'a') {
      pause = false;
      score = 0;
      curentlevelID = 0;
      curentlevel = level.get(curentlevelID);
      vies = 4;
      stop = true;
      musique.stop();
      musique.play();
    }
  }
  //Malus qui va changer la position du joueur qui ne sera plus colé à la souris pendant 3 secondes
  for (int i = 0; i < malus.size(); i++) {
    Malus myMalus = malus.get(i);
    //println(myMalus.xpos);
    //println(myMalus.ypos);
    myMalus.malus();
    myMalus.movemalus();
    //Calcul distance ente le joueur et le coeur
    dn =dist(myBall.xcercle, myBall.ycercle, myMalus.xpos, myMalus.ypos);
    if ((dn < 40)) {
      if (invert == true);
      malus.remove(i);
      inversion.play();
      myBall.inversionx = random(-500, 500);
      myBall.inversiony = random(-500, 500);
    }
    if (invert == true) {
      if (frameCount % 180 == 0) {
        invert = false;
      }
    }
  }
  if (invert == false) {
    myBall.inversionx = (0);
    myBall.inversiony = (0);
    invert = true;
  }

  if (frameCount % curentlevel.inversion == 0) {
    for (int i = 0; i ==0; i++) {
      malus.add(new Malus(random(width), random(height)));
    }
  }
}
