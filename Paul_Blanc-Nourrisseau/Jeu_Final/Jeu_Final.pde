int SCORE = 0;
float Xm = mouseX;
float Ym = mouseY;
int v = 3;
int n = 1;
int currentLvlID = 0;

PImage D;
PImage C;
PImage B; 
PImage Bo;
PImage Bob;
PImage Fo;

import processing.sound.*;
SoundFile V;
SoundFile S;
SoundFile P;
SoundFile W;
SoundFile PdT;
SoundFile F;

Level L;
joueur J;

ArrayList<Level> Levels;
ArrayList<Ball> Balls;
ArrayList<Ennemi> Ennemis;
ArrayList<Bonus> bonus;
ArrayList<BonusB> bonusb;

void setup() {

  fullScreen();

  D = loadImage("Sprite Designer.png");
  C = loadImage("Client.png");
  B = loadImage("billet.png");
  Bo = loadImage("Bonus.png");
  Bob = loadImage("potion.png");
  Fo = loadImage("fond.png");
  imageMode(CENTER);

  Levels = new ArrayList<Level>();
  Balls = new ArrayList<Ball>();
  Ennemis = new ArrayList<Ennemi>();
  bonus = new ArrayList<Bonus>();
  bonusb = new ArrayList<BonusB>();

  Levels.add(new Level(0, 0, 0, 0, 0, 0, -25, -25));
  Levels.add(new Level(0, 0, 10, 10, 0, 0, 0, 0));
  Levels.add(new Level(-5, 0, 15, 15, 0, 0, 0, 0));
  Levels.add(new Level(-10, 10, 20, 20, 0, 0, -20, -20));
  Levels.add(new Level(-15, 0, 25, 25, 0, 0, 0, 0));
  Levels.add(new Level(-20, 0, 30, 30, 2, 25, -50, -50));

  V = new SoundFile(this, "yes de l'argent.wav");
  S = new SoundFile(this, "soupire.wav");
  P = new SoundFile(this, "piece.wav");
  W = new SoundFile(this, "Wouhouuu.wav");
  PdT = new SoundFile(this, "j'ai plus de thune.wav");
  F = new SoundFile(this, "music de fond.wav");

  F.loop();

  J = new joueur();
  Fo.resize(width, height);
}

void draw() {
  background(255);

  image(Fo, width/2, height/2); // à enlever si l'ordinateur ne supporte pas car image de trop grande qualité
  
  if (9<SCORE && SCORE<=19) {
    currentLvlID =1;
  }
  if (19<SCORE && SCORE<=29) {
    currentLvlID = 2;
  }
  if (29<SCORE && SCORE<=39) {
    currentLvlID = 3;
    if (SCORE == 30) {
      Ennemis.clear();
    }
  }
  if (39<SCORE && SCORE<=49) {
    currentLvlID = 4;
  }
  if (49<SCORE && SCORE<=59) {
    currentLvlID = 5;
  }
  J.update();
  J.display();

  if (frameCount % 1000 == 0) {
    for (int i = 0; i<1; i++) { 
      Bonus b;
      b = new Bonus(random(width), random(height));
      bonus.add(b);
    }
  }

  if (frameCount % 2000== 0) {
    for (int i = 0; i<1; i++) { 
      BonusB b;
      b = new BonusB(random(width), random(height));
      bonusb.add(b);
    }
  }

  if (frameCount % 100 + Levels.get(currentLvlID).NbPopBall == 0) {
    for (int i = 0; i<1; i++) { 
      Ball b;
      b = new Ball(random(width), random(height));
      Balls.add(b);
    }
  }

  if (frameCount % 100 + Levels.get(currentLvlID).NbPopEnnemis == 0) {
    for (int i = 0; i<1; i++) { 
      Ennemi b;
      b = new Ennemi(random(width), random(height));
      Ennemis.add(b);
    }
  }

  for (int i = 0; i<Balls.size(); i++) {

    Ball a = Balls.get(i);
    a.update(Levels.get(currentLvlID).SpdBall);
    a.display(Levels.get(currentLvlID).SizeBall);
    a.wrap();
    if (abs(a.xpos-J.X)<25 + J.r/2 && abs(a.ypos-J.Y)<25 + J.r/2) {
      P.play();
      Balls.remove(i);
      SCORE ++;
      J.r  = J.r + 5;
    }
  }

  for (int k = 0; k<Ennemis.size(); k++) {

    Ennemi e = Ennemis.get(k);
    e.update(Levels.get(currentLvlID).SpdEnnemis);
    e.display(Levels.get(currentLvlID).SizeEnnemis);
    e.wrap();
    if (abs(e.xpos-J.X)<J.r/2 && abs(e.ypos-J.Y)<J.r/2) {
      Ennemis.remove(k);
      v = v - (1+Levels.get(currentLvlID).EnnemisDamage);
      S.play();
      if ( v < 1) {
        v = 0;
        stop();
        fill(255, 0, 0);
        textAlign(CENTER, CENTER);
        textSize(100);
        text("GAME OVER", width/2, width/2);
        PdT.play();
        F.stop();
      }
    }
  }

  for (int j = 0; j<bonus.size(); j++) {

    Bonus b = bonus.get(j);
    b.display();

    if (abs(b.xoff-J.X)<J.r/2 && abs(b.yoff-J.Y)<J.r/2) {
      bonus.remove(j);
      SCORE = SCORE + 5;
      J.r = J.r + 25;
      W.play();
    }
  }

  for (int h = 0; h<bonusb.size(); h++) {

    BonusB b = bonusb.get(h);
    b.display();
    if (abs(b.xoff-J.X)<J.r/2 && abs(b.yoff-J.Y)<J.r/2) {
      bonusb.remove(h);
      J.r = J.r - 50;
    }
  }

  if (SCORE == 60) {
    stop();
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("VICTOIRE", width/2, width/2);
    V.play();
  }
  println(SCORE);
  println(v);

  fill(0);
  textAlign(CENTER, TOP);
  textSize(50);
  text("SCORE : "+SCORE, width/2, 50);

  fill(255, 0, 0);
  textSize(50);
  text("VIE : "+v, 100, 50);
}
