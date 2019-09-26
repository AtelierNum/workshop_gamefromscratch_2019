cercle d;

import processing.sound.*;
SoundFile musique;


ArrayList<Agent> agents = new ArrayList <Agent>();
ArrayList<Ennemi> ennemis = new ArrayList <Ennemi>();
ArrayList<bonus> bns = new ArrayList <bonus>();
ArrayList<Level> lvls = new ArrayList <Level>();

int score = 0;
int currentLevel = 0 ;
int prevLevel = 0;

boolean win = false;

PImage fond;
PImage abeille;
PImage fleur;
PImage poison;
PImage ruche;


void setup() {
  fullScreen();


  // musique fond
  musique = new SoundFile (this, "musique.mp3");
  musique.loop();


  //image fond
  fond = loadImage ("fond.jpg");
  fond.resize(width, height);


  d = new cercle();


  //charactéristique niveau
  lvls.add(new Level(60, 200, 1, 1));
  lvls.add(new Level(60, 180, 2, 2));
  lvls.add(new Level(60, 160, 4, 4));
  lvls.add(new Level(60, 140, 8, 8));
  lvls.add(new Level(60, 120, 10, 10));
  lvls.add(new Level(60, 100, 12, 12));
  lvls.add(new Level(60, 80, 14, 14));
  lvls.add(new Level(60, 60, 16, 16));
  lvls.add(new Level(60, 40, 18, 18));
  lvls.add(new Level(60, 20, 20, 20));
}


void draw() {

  //image fond
  background(fond);

  //suppression de la trainée des images
  trainee() ;

  //affichage des informations
  textSize(20);
  fill(#F00F96);
  text("fleur : +1", width*0.01, height*0.10);
  fill(#FFB829);
  text("alvéole : +5", width*0.01, height*0.13);
  fill(0);
  text("insecticide : -1", width*0.01, height*0.16);




  //jeu perdu
  if (score<0) {

    // affichage texte de défaite
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    textSize(200);
    background(fond);
    text("GAME OVER", width/2, height/2);
  }

  //jeu joué
  else if (win == false) {


    //affichage des informations
    textAlign (LEFT);
    fill(#F00F96);
    text("fleur : +1", width*0.01, height*0.10);
    fill(#FFB829);
    text("alvéole : +5", width*0.01, height*0.13);
    fill(0);
    text("insecticide : -1", width*0.01, height*0.16);


    //mouvement cercle
    d.update();
    d.display();

    //apparition agent/ frames
    if (frameCount%lvls.get(currentLevel).agentPopRate == 0) {
      for (int i=0; i<1; i++) {  
        agents.add(new Agent(random(width), random(height)));
      }
    }

    //mouvement agent
    for (int i=0; i < agents.size(); i++) {
      Agent a = agents.get(i);
      a.update(lvls.get(currentLevel).agentSpeed);
      a.display();
      a.wrap();

      //disparition agent
      if (dist(d.X, d.Y, a.x, a.y)<40) {
        agents.remove(i);
        score ++;
      }
    }

    //apparition ennemi/ frames
    if (frameCount%lvls.get(currentLevel).ennemiPopRate == 0) {
      for (int ie=0; ie<1; ie++) {  
        ennemis.add(new Ennemi(random(width), random(height)));
      }
    }

    //mouvement ennemi
    for (int ie=0; ie < ennemis.size(); ie++) {
      Ennemi e = ennemis.get(ie);
      e.update(lvls.get(currentLevel).ennemiSpeed);
      e.display();
      e.wrap();

      //disparition ennemi
      if (dist(d.X, d.Y, e.xe, e.ye)<40) {
        ennemis.remove(ie);
        score --;
      }
    }

    //apparition bonus/ frames
    if (frameCount%600 == 0) {
      for (int ib=0; ib<1; ib++) {  
        bns.add(new bonus(random(width), random(height)));
      }
    }
    //mouvement bonus
    for (int ib=0; ib < bns.size(); ib++) {
      bonus b = bns.get(ib);
      b.update();
      b.display();
      b.wrap();

      //disparition bonus
      if (dist(d.X, d.Y, b.xb, b.yb)<40) {
        bns.remove(ib);
        score ++;
        score ++;
        score ++;
        score ++;
        score ++;
      }
    }


    //remise à zéro des ennemis et agents
    if (prevLevel != currentLevel) {
      ennemis.clear ();
      agents.clear ();
      prevLevel = currentLevel;
    }

    //score
    fill(#9A07F7);
    textSize(30);
    text("NIVEAU = " + (currentLevel+1), width*0.01, height*0.05);
    text("SCORE = "+ score, width/2, height*0.05);

    //passage de niveau
    if (score >= 0 && score <= 10) {
      currentLevel = 0;
    } else if (score > 10 && score <= 20) {
      currentLevel = 1;
    } else if (score > 20 && score <= 30) {
      currentLevel = 2;
    } else if (score > 30 && score <= 40) {
      currentLevel = 3;
    } else if (score > 40 && score <= 50) {
      currentLevel = 4;
    } else if (score > 50 && score <= 60) {
      currentLevel = 5;
    } else if (score > 60 && score <= 70) {
      currentLevel = 6;
    } else if (score > 70 && score <= 80) {
      currentLevel = 7;
    } else if (score > 80 && score <= 90) {
      currentLevel = 8;
    } else if (score > 90 && score <= 100) {
      currentLevel = 9;
    } else {

      //jeu gagné
      win = true;
    }

    //jeu gagné
  } else if (win == true) {

    //affichage texte de victoire
    textAlign(CENTER, CENTER);
    fill(0, 0, 255);
    textSize(200);
    background(fond);
    text("VICTOIRE !", width/2, height/2);
    textSize(100);
    text("Beeez a bien mangé", width/2, height/1.5);
  }
}

//effacement de la trainée du cercle (abeille)
void trainee() {

  background(fond);
  size(width, height);
  fill(0, 0, 0, 0);
  rect(0, 0, width, height);
}

//jeu recommence = touche espace
void keyPressed() {
  if (key ==' ') {
    score = 0;
    win = false;
    currentLevel = 0;
    agents = new ArrayList <Agent>();
    ennemis = new ArrayList <Ennemi>();
  }
}
