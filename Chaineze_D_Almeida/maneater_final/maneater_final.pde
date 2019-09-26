import processing.video.*;
Movie introMov;


ArrayList<Ball>multiple = new ArrayList <Ball>();
ArrayList<Foe>multiples = new ArrayList <Foe>();
ArrayList<Bonus>multipless = new ArrayList <Bonus>();
ArrayList<Weapons>multi = new ArrayList <Weapons>();


import processing.sound.*;




//variables
float X;
float Y;
float size = 50;
float d;
int level = 1;
int score;
int aim = 25;
int gameState = 1;
int a = 0;

//variables son
SoundFile backgroundMusic;
SoundFile crunch;
SoundFile fail;
SoundFile levelup;
SoundFile sword;

//variables images
PImage background;
PImage player;
PImage yakuza;
PImage weeb;
PImage humans;
PImage gameover;
PImage victory;
PImage weapons;
Ball b;

boolean intro = true;


void setup() {
  //size(width , height);
  fullScreen();

  introMov = new Movie(this, "CINEMATIQUE_INTRO2.mov");
  introMov.play();

  backgroundMusic = new SoundFile (this, "background.wav");
  //backgroundMusic.loop();
  crunch = new SoundFile (this, "crunch1.wav");
  fail = new SoundFile (this, "failed.wav");
  levelup = new SoundFile (this, "levelup1.wav");
  sword = new SoundFile (this, "sword1.wav");


  background = loadImage("background.png");
  player = loadImage("player.png");
  yakuza = loadImage("foe.png");
  weeb = loadImage("bonus.png");
  humans = loadImage("humans.png");
  gameover = loadImage("game over.png");
  victory = loadImage("victory.png");
  weapons = loadImage("katana.png");
  imageMode(CENTER);
  // backgroundMusic.loop();
}


void draw() {

  if (intro) {

    image(introMov, width/2, height/2, width, height);
    
    textAlign(CENTER, BOTTOM);
    text("Press a key to skip", width/2, height);
  } else {
    if(backgroundMusic.isPlaying() != true) {
       backgroundMusic.play(); 
    }

    image(background, width/2, height/2);

    //humans
    if (frameCount%(60+(level*3)) == 0) {

      for (int i=0; i<1; i++) {
        multiple.add(new Ball(random(width), random(height)));
      }
    }
    //Comportement des instances humains de la liste "ball"
    for (int i=0; i<multiple.size(); i++) { 
      Ball b = multiple.get(i);
      b.move();
      b.dessin();
      b.wrap();

      //Calcul de la distance entre la souris et chacun des agents
      if (dist(X, Y, multiple.get(i).xpos, multiple.get(i).ypos)<90) {
        multiple.remove(i);
        score+=level;
        crunch.play();
      }
    }

    //foe
    if (frameCount%120-(level) == 0) {

      for (int i=0; i<1; i++) {
        multiples.add(new Foe(random(width), random(height)));
      }
    }
    //Comportement des instances ennemies de la liste "foe"
    for (int i=0; i<multiples.size(); i++) { 
      Foe b = multiples.get(i);
      b.move();
      b.dessin();
      b.wrap();

      //Calcul de la distance entre la souris et chacun des agents
      if (dist(X, Y, multiples.get(i).xpos, multiples.get(i).ypos)<90) {
        multiples.remove(i);
        score-=level;
        fail.play();
      }
    }

    //bonus
    if (frameCount%540 == 0) {
      for (int i=0; i<1; i++) {
        multipless.add(new Bonus(random(width), random(height)));
      }
    }
    //Comportement des instances bonus de la liste "bonus"
    for (int i=0; i<multipless.size(); i++) { 
      Bonus f = multipless.get(i);
      f.move();
      f.dessin();
      f.wrap();

      //Calcul de la distance entre la souris et chacun des agents
      if (dist(X, Y, multipless.get(i).xpos, multipless.get(i).ypos)<90) {
        multipless.remove(i);
        score+=3;
        levelup.play();
      }
    }

    //weapons
    if (frameCount%660 == 0) {

      for (int i=0; i<1; i++) {
        multi.add(new Weapons(random(width), random(height)));
      }
    }
    //Comportement des instances katanas de la liste "weapons"
    for (int i=0; i<multi.size(); i++) { 
      Weapons b = multi.get(i);
      b.move();
      b.dessin();
      b.wrap();

      //Calcul de la distance entre la souris et chacun des agents
      if (dist(X, Y, multi.get(i).xpos, multi.get(i).ypos)<30) {
        multi.remove(i);
        score-=3;
        sword.play();
      }
    }


    trail();
    //Animation de la boule contôlée par le joueur

    X = lerp(X, mouseX, 0.1);
    Y = lerp(Y, mouseY, 0.1);
    noStroke();
    fill(230);
    image(player, X, Y, 190, 190);

    if (score == aim) {
      score = 0;
      level++;
      aim*=level;
    }

    //GAME OVER
    if (score < 0) {
      multipless.clear();
      multiples.clear();
      multiple.clear();
      multi.clear();
      image(gameover, width/2, height/2);
      fill(255, 0, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("GAME OVER !", 1500, 400);
      textSize(60);
      textAlign(CENTER, CENTER);
      text("WANNA KICK MORE ASS  ?", 1500, 500);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("PRESS START.", 1500, 560);
    }
    //VICTORY
    if (score >= 50 && level >= 2) {
      multipless.clear();
      multiples.clear();
      multiple.clear();
      multi.clear();
      image(victory, width/2, height/2);
      fill(255, 0, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("VICTORY!", 1500, 400);
      textSize(60);
      textAlign(CENTER, CENTER);
      text("WANNA KICK SOME ASS AGAIN ?", 1500, 500);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("PRESS START.", 1500, 560);
    }

    if (mousePressed) {
      score = 0;
      level=1;
      aim=25;
    }


    fill(255);
    textSize(40);
    textAlign(TOP, RIGHT);
    text("Score:"+ score +"/"+ aim, 860, 40);
    text("Level:"+ level, 860, 80);
  }
}


void keyPressed(){
  intro = false;
  introMov.stop();
}

void trail() {
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
}

void trail(float a) {

  noStroke();
  fill(0, 0, 0, a);
  rect(0, 0, 500, 500);
}

void movieEvent(Movie m) {
  m.read();
}
