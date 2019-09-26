//inportation de la biblioteque pour le song

import processing.sound.*;
SoundFile explosion;
SoundFile game;


// declaration des ArrayList

ArrayList<object> objects = new ArrayList<object>();
ArrayList<ennemi> ennemis = new ArrayList<ennemi>();
ArrayList<boum> boums = new ArrayList<boum>();
ArrayList<life> lifes = new ArrayList<life>();
ArrayList<level> levels = new ArrayList<level>();

PImage bouclier;


//creation de la class pour les vies
class life {

  float xlife;
  float ylife;
  float lifex;
  float lifey;


  life() {

    xlife = random(width);
    ylife = random(height);

    lifex = random(9999);
    lifey = random(9999);
  }

  // cohordoner pour l'emplacement des vie
  void updatelife() {
    lifex += 0.01;
    lifey += 0.01;

    xlife += map(noise(lifex), 0, 1, -5, 5)  ;
    ylife += map(noise(lifey), 0, 1, -5, 5) ;
  }
  void displaylife() {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    strokeWeight(3);
    image(bouclier, xlife, ylife, 100, 100);
  }
  void respawnlife() {

    if ( xlife > width + 1 ) {
      xlife = 0;
    }
    if (xlife < 0 - 1) {
      xlife = width;
    }
    if ( ylife > height + 1 ) {
      ylife = 0;
    }
    if ( ylife < 0 - 1 ) {
      ylife =height;
    }
  }
}

PImage bonbe;

// création de la class pour les bonus bonbe;
class boum {

  float xboum;
  float yboum;
  float boumx;
  float boumy;


  boum() {

    xboum = random(width);
    yboum = random(height);

    boumx = random(9999);
    boumy = random(9999);
  }


  void updateboum() {
    boumx += 0.01;
    boumy += 0.01;

    xboum += map(noise(boumx), 0, 1, -5, 5)  ;
    yboum += map(noise(boumy), 0, 1, -5, 5) ;
  }
  void displayboum() {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    strokeWeight(3);
    image(bonbe, xboum, yboum, 75, 75);
  }
  void respawnboum() {

    if ( xboum > width + 1 ) {
      xboum = 0;
    }
    if (xboum < 0 - 1) {
      xboum = width;
    }
    if ( yboum > height + 1 ) {
      yboum = 0;
    }
    if ( yboum < 0 - 1 ) {
      yboum =height;
    }
  }
}

// class pour le personnage joueur
PImage chevalier;

class circle {


  float posx;
  float posy;
  circle() {
  }
  void updateball() {
    posx = lerp(posx, mouseX, 0.05);
    posy =lerp(posy, mouseY, 0.05);
  }
  void displayball() {
    fill(0, 0, 255);
    stroke(0, 255, 0);
    strokeWeight(15);
    image(chevalier, posx, posy, 200, 200);
  }
}
// class pour les ennemis
PImage gobelin;

class ennemi {


  float xennemi;
  float yennemi;
  float xmechant;
  float ymechant;


  ennemi() {

    xennemi = random(width);
    yennemi = random(height);

    xmechant = random(9999);
    ymechant = random(9999);
  }


  void updateEnnemi() {
    xmechant += 0.01;
    ymechant += 0.01;

    xennemi += map(noise(xmechant), 0, 1, -5, 5)  ;
    yennemi += map(noise(ymechant), 0, 1, -5, 5) ;
  }
  void displayEnnemi() {
    fill(255, 0, 0);
    stroke(0, 0, 255);
    strokeWeight(3);
    image(gobelin, xennemi, yennemi, 100, 100);
  }
  void respawnEnnemi() {

    if ( xennemi > width + 1 ) {
      xennemi = 0;
    }
    if (xennemi < 0 - 1) {
      xennemi = width;
    }
    if ( yennemi > height + 1 ) {
      yennemi = 0;
    }
    if ( yennemi < 0 - 1 ) {
      yennemi =height;
    }
  }
}

// class pour les courone
PImage courone;
class object {

  float xpos;
  float ypos;

  float xnoise;
  float ynoise;


  object() {

    xpos = random(height);
    ypos = random(width);

    xnoise = random(9999);
    ynoise = random(9999);
  }


  void update() {
    xnoise += 0.01;
    ynoise += 0.01;

    xpos += map(noise(xnoise), 0, 1, -5, 5)  ;
    ypos += map(noise(ynoise), 0, 1, -5, 5) ;
  }
  void display() {
    fill(0, 255, 0);
    stroke(255, 0, 0);
    strokeWeight(3);
    image(courone, xpos, ypos, 100, 100);
  }
  void respawn() {

    if ( xpos > width + 1 ) {
      xpos = 0;
    }
    if (xpos < 0 - 1) {
      xpos = width;
    }
    if ( ypos > height + 1 ) {
      ypos = 0;
    }
    if ( ypos < 0 - 1 ) {
      ypos =height;
    }
  }
}

// declaration des variables
circle c;
int score = 0;
int vie = 5;
int curentlevelID = 0;

level curentlevel;
int bonuspop;
int lifepop;

// boolean permetant de lire la musique
boolean lecture = false;
void setup() {
  noCursor();
  fullScreen();
  background(0);
  // declaration de la musique
  explosion =new SoundFile(this, "explosion.mp3");
  game = new SoundFile(this, "game.wav");
  //declaration des niveaux
  levels.add(new level(600, 60, 20, 1, 0, 600, 600));
  levels.add(new level(500, 70, 40, 1, 0, 600, 600));
  levels.add(new level(400, 80, 60, 1, 1, 600, 600));
  levels.add(new level(300, 120, 80, 1, 0, 600, 600));
  levels.add(new level(180, 180, 100, 1, 0, 600, 600));
  levels.add(new level(120, 240, 120, 1, 0, 600, 600));
  levels.add(new level(60, 300, 140, 1, 1, 600, 600));
  levels.add(new level(30, 360, 200, 4, 2, 1000, 1000));


  curentlevel = levels.get(curentlevelID);

  bouclier = loadImage("bouclier.png");
  courone = loadImage("courone.png");
  gobelin = loadImage("goblin.png");
  chevalier = loadImage("chevalier.png");
  bonbe = loadImage("bombe.png");
  c = new circle();
}

void draw() {

  imageMode(CENTER);
  // condition pour la lecture de la musique de font
  if (lecture == false) {
    game.loop();
    lecture =true;
  }


  trainee();
  //gestion de la production de sphere
  if (frameCount% curentlevel.objectratepop ==0) {
    for (int i = 0; i < 1; i++) {
      objects.add(new object());
    }
  }
  if (frameCount%curentlevel.ennemiratepop == 0) {
    for (int a = 0; a < 1; a++) {
      ennemis.add(new ennemi());
    }
  }
  if (bonuspop < curentlevel.boumnumber) {
    if (frameCount% curentlevel.boumratepop == 0 ) {
      for (int d = 0; d < 1; d++) {
        boums.add(new boum());
        bonuspop =bonuspop +1;
      }
    }
  }
  if (lifepop < curentlevel.lifenumber) {
    if (frameCount% curentlevel.liferatepop == 0) {
      for (int e = 0; e < 1; e++) {
        lifes.add(new life());
        lifepop = lifepop +1;
      }
    }
  }

  for (int d = 0; d < lifes . size(); d++) {
    life m = lifes.get(d);
    m.updatelife();
    m.displaylife();
    m.respawnlife();
    // gestion de la disparition des sphére
    float b = dist(c.posx, c.posy, m.xlife, m.ylife);
    if ( b < 25) {
      lifes.remove(d);

      vie = vie + 1;
    }
  }
  for (int d = 0; d < boums . size(); d++) {
    boum e = boums.get(d);
    e.updateboum();
    e.displayboum();
    e.respawnboum();

    float b = dist(c.posx, c.posy, e.xboum, e.yboum);
    if ( b < 25) {
      boums.remove(d);
      ennemis.clear();
      score = score + 10;
      explosion.play();
    }
  }
  for (int i = 0; i < objects . size(); i++) {
    object a = objects.get(i);
    a.update();
    a.display();
    a.respawn();

    float d = dist(c.posx, c.posy, a.xpos, a.ypos);
    if ( d < 25) {
      objects.remove(i);
      score = score +1;
    }
  }
  for (int a = 0; a < ennemis . size(); a++) {
    ennemi b = ennemis.get(a);
    b.updateEnnemi();
    b.displayEnnemi();
    b.respawnEnnemi();

    float d = dist(c.posx, c.posy, b.xennemi, b.yennemi);
    if  (d < 25) {
      ennemis.remove(a);
      vie = vie - 1;
    }
  }

  c.updateball();
  c.displayball();
  textAlign(CENTER, TOP);
  textSize(100);
  text("level :" +curentlevelID, width/2, 1);
  //gestion de l'affichage du texte
  if (score >= curentlevel.point) {
    curentlevelID++;
    curentlevel = levels.get(curentlevelID);
    ennemis.clear();
    objects.clear();
    boums.clear();
    lifes.clear();
    bonuspop = 0 ;
    lifepop = 0;
  }

  if (score >= 0) {
    fill(255);
    text("score : " + score, width/2, 70);
  } 
  if ( score == 199) {
    fill(random(255), random(255), random(255));
    text("WIN", width/2, height/2);
    ennemis.clear();
    objects.clear();
    boums.clear();
    lifes.clear();
  }
  if (vie >= 0 ) {
    text(" vie : " + vie, width/2, 150);
  } else {
    fill(random(255), 0, 0);
    text("GAME OVER", width/2, height/2);
    ennemis.clear();
    objects.clear();
    boums.clear();
    lifes.clear();
  }
}
//fonction pour la trainee
void trainee() {
  noStroke();
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
}
