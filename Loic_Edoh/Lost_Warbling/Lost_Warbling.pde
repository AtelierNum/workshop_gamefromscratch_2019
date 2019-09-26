//Le code est composé de 6 classes où sont stockées les données de la "nourriture
//, du joueur, des ennemis, du système de niveaux, des bonus de vie, et des malus;


//Variables
public ArrayList<Auto> ia = new ArrayList <Auto>();
public ArrayList<Ennemi> en = new ArrayList <Ennemi>();
public ArrayList<Lives> life = new ArrayList <Lives>();
public ArrayList<Mal> malus = new ArrayList <Mal>();
public ArrayList<Level> level = new ArrayList<Level>();
public float d = 0;
public int score;
public int but ;
public int niveau = 1;
public boolean pause = false;
public boolean stop = true;
public boolean stopk = true;
public boolean reverse = false;
public int vie = 3;

int fadeIn;
int nextLevelWait = 100;
Ball ball;
Level currentlevel;
int currentlevelID;

//Images
PImage socoskin;
PImage notebleue;
PImage noterouge;

//Sons
import processing.sound.*;
SoundFile larsen;
SoundFile socosong;
SoundFile hit;
SoundFile malusound;
SoundFile lifesound;
SoundFile levelupsound;
SoundFile eatsound;
SoundFile Killa;

//Init
void setup() {
  //Paramètres fenêtre
  fullScreen(P2D);
  background(0);


  ball = new Ball();

  frameRate(60);

  notebleue = loadImage("Nourriture.png");
  socoskin = loadImage("Skin socopiaf.png");
  noterouge = loadImage("yolo.png");

  larsen = new SoundFile(this, "larsen.mp3");
  larsen.amp(1);
  socosong = new SoundFile(this, "socosong.wav");
  hit = new SoundFile(this, "hitsound.wav");
  malusound = new SoundFile(this, "malusound.wav");
  malusound.amp(0.05);
  lifesound = new SoundFile(this, "lifesound.wav");
  lifesound.amp(0.2);
  levelupsound = new SoundFile(this, "levelupsound.wav");
  levelupsound.amp(0.4);
  eatsound = new SoundFile(this, "eatsound.wav");
  eatsound.amp(0.2);
  Killa = new SoundFile(this, "Killa.wav");
  Killa.amp(1);
  if (stopk) {
    Killa.play();
    Killa.loop();
    stopk = false;
  }

  //Paramètres des 10 niveaux du jeu

  level.add(new Level(60, 10, 150, 5, 10, 0, 10, 0, 100));
  currentlevel = level.get(currentlevelID);
  level.add(new Level(70, 20, 140, 10, 10, 0, 10, 0, 150));
  level.add(new Level(80, 20, 140, 15, 400, 2, 10, 0, 200));
  level.add(new Level(90, 30, 130, 20, 450, 2, 1000, 1, 250));
  level.add(new Level(100, 30, 120, 25, 450, 3, 800, 2, 300));
  level.add(new Level(110, 30, 120, 30, 400, 4, 600, 3, 350));
  level.add(new Level(120, 30, 110, 35, 400, 5, 650, 3, 400));
  level.add(new Level(130, 30, 110, 40, 350, 6, 500, 3, 400));
  level.add(new Level(140, 30, 100, 45, 350, 7, 550, 4, 400));
  level.add(new Level(150, 35, 100, 45, 300, 8, 500, 5, 400));
  //Le niveau 11 est, en réalité, l'écran de victoire
  level.add(new Level(60, 0, 240, 0, 800, 0, 100, 0, 100));
}

//Effet graphique de "traînée"
void trainee(int Val) {
  fill(0, 0, 0, Val);
  noStroke();
  rect(0, 0, width, height);
}

//Dessin
void draw () {

  fill(255);
  textSize(50);
  textAlign(TOP, LEFT);
  text("SCORE :" + score + "/" + currentlevel.score, 8, 40);
  text("NIVEAU :" + (currentlevelID+1), 8, 80);
  fill(255);

  text("VIES :" + vie, 1700, 40);

  ball.display();
  ball.move();

  //Comportement notes bleues
  for (int i = 0; i < ia.size(); i++) {
    Auto auto = ia.get(i);
    auto.display();
    auto.pop();
    auto.moveit();
    auto.wrap();

    //Calcul distance
    d = dist(ball.x, ball.y, auto.xpos, auto.ypos);

    //Marquer des points
    if (d < 50) {
      ia.remove(i) ;
      score = score + 10 ;

      eatsound.play();
    }
  }
  //Comportement Ennemis
  for (int i = 0; i < en.size(); i++) {
    Ennemi ennemi = en.get(i);
    ennemi.displaye();
    ennemi.popp();
    ennemi.iliketomoveit();
    ennemi.Wrap();

    //Calcul distance
    d = dist(ball.x, ball.y, ennemi.Xpos, ennemi.Ypos);


    //Perdre des vies
    if (d < 35) {
      en.remove(i) ;
      vie = vie - 1 ;
     
        hit.play();
      
    }
  }

  //Comportement vies
  for (int i = 0; i < life.size(); i++) {
    Lives lif = life.get(i);
    lif.disp();
    lif.POP();
    lif.movee();
    lif.wrapp();

    //Calcul distance
    d = dist(ball.x, ball.y, lif.xlpos, lif.ylpos);


    //Gagner des vies: Les vies retirent aussi tous les malus ^résents à l'écran
    if (d < 30) {
      life.remove(i) ;
      malus.clear();
      vie = vie + 1 ;

      lifesound.play();
    }
  }

  //Comportement Malus
  for (int i = 0; i < malus.size(); i++) {
    Mal mal = malus.get(i);
    mal.disp();
    mal.POp();
    mal.moveee();
    mal.wrappp();

    //Calcul distance
    d = dist(ball.x, ball.y, mal.xmpos, mal.ympos);

    //Effet: les malus retirent des notes bleues et
    //ajoutent des notes rouges
    if (d < 35) {
      malus.remove(i) ;
      ia.clear();
      for (int j = 0; j < 2; j++) {      
        en.add(new Ennemi(random(width), random(height)));
      }


      malusound.play();
    }
  }

  //Ajout notes bleues
  if (ia.size() < currentlevel.autoLimit && frameCount% currentlevel.autoRatePop == 0 && pause == false ) {
    for (int i = 0; i < 1; i++) {
      ia.add(new Auto(random(width), random(height)));
    }
  }
  //Ajout Ennemis
  if ( en.size() < currentlevel.ennemiLimit && frameCount% currentlevel.ennemiRatePop == 0 && pause == false) {
    for (int i = 0; i < 1; i++) {
      en.add(new Ennemi(random(width), random(height)));
    }
  }
  //Ajout Vies
  if ( life.size() < currentlevel.lifeLimit && frameCount% currentlevel.lifeRatePop == 0 && pause == false) {
    for (int i = 0; i < 1; i++) {
      life.add(new Lives(random(width), random(height)));
    }
  }

  //Ajout Malus
  if ( malus.size() < currentlevel.malusLimit && frameCount% currentlevel.malusRatePop == 0 && pause == false) {
    for (int i = 0; i < 1; i++) {
      malus.add(new Mal(random(width), random(height)));
    }
  }

  //Passage de niveau
  if (score >= currentlevel.score) {

    ia.clear();
    en.clear();
    life.clear();
    malus.clear();

    //Feedback Level up : Le joueur est notifié du changement de niveau
    pause = true;

    if (fadeIn<255) {
      fadeIn +=10;
      if (!levelupsound.isPlaying()) {
        levelupsound.play();
      }
    }

    nextLevelWait --;
    fill(255, 0, 255, fadeIn);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    textSize(200);
    textAlign(CENTER);
    text("NEXT LEVEL", width/2, height/2);

    if (nextLevelWait <= 0) {
      pause = false;
      fadeIn = 0;
      score = 0;
      currentlevelID ++ ;
      currentlevel = level.get(currentlevelID);
      nextLevelWait = 100;
    }
  }

  //Victoire : Le jeu s'arrête. Plus de générations d'instances
  if (currentlevelID >= 10) {

    ia.clear();
    en.clear();
    life.clear();
    malus.clear();
    background(0);
    fill(random(255), random(255), random(255));
    textSize(200);
    textAlign(CENTER);
    text("VICTOIRE", width/2, height/2);
    //La musique du jeu s'arrête, la musique de victoire commence
    if (stop) {
      Killa.stop();
      socosong.play();
      stop = false;
    }
  }

  //Game Over : Le jeu s'arrête. Plus de générations d'instances
  if (vie <= 0) {
    pause = true;
    ia.clear();
    en.clear();
    life.clear();
    malus.clear();
    background(0);
    fill(255, 0, 0);
    textSize(200);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    //La musique du jeu s'arrête, la musique de défaite commence
    if (stop) {
      Killa.stop();
      larsen.play();
      stop = false;
    }

    //Click to restart : On recommence. Le jeu est réinitialisé
    if (mousePressed) {
      pause = false;
      score = 0;
      currentlevelID = 0;
      currentlevel = level.get(currentlevelID);
      vie = 3;
      //La musique de défaite s'arrête, celle du jeu reprend
      larsen.stop();
      stop = true;
      Killa.play();
      Killa.loop();
      stopk = false;
      stopk = true;
    }
  }

  //Effet lumineux
  trainee(50);
}
