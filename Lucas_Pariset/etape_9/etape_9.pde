import processing.sound.*;
SoundFile stade;
SoundFile winner;
boolean winnerHasPlayed = false;
SoundFile looser;
boolean looserHasPlayed = false;
SoundFile sifflet;
SoundFile pop;

PImage photo;
PImage arbitre;
PImage gilbert;
PImage rugbyman;

Agent myagent;

float x; 
float y;
int score = 0; 
int redcatch =0;
int vies = 0;

ArrayList<White>multiple = new ArrayList<White>();
ArrayList<Red>mechants = new ArrayList<Red>();

ArrayList<Level>lvls = new ArrayList<Level>();
int currentLvlid = 1;
Level currentlevel;

void setup() {
  // les sons dans le jeu
  stade = new SoundFile(this, "stadium.wav");
  pop = new SoundFile(this, "pop.wav");
  sifflet = new SoundFile(this, "sifflet.wav");
  looser = new SoundFile(this, "looser.wav");
  winner = new SoundFile(this, "winner.wav");
  // son d'ambiance stade 
  stade.play();
  stade.loop();


  size(1000, 1000);
  // image de fond
  photo = loadImage("Rugby.jpeg");
  arbitre = loadImage("sifflet.png");
  gilbert = loadImage("ballon.png");
  rugbyman = loadImage("joueur.png");
  background(0);

  lvls.add(new Level(60));
  lvls.add(new Level(50));
  lvls.add(new Level(40));
  lvls.add(new Level(30));
  lvls.add(new Level(20));
  currentlevel = lvls.get(0);

  myagent = new Agent();
  for (int i = 0; i<15; i++) {
    multiple.add(new White(random(width), random(height)));
  }
  for (int i = 0; i<25; i++) {
    mechants.add(new Red(random(width), random(height)));
  }
}

void draw() {
  background(81, 137, 88);
  //placement de l'image de fond 
  image(photo, -300, -4);

  // niveaux
  if (redcatch < 5) {
    if (currentLvlid >=0 && currentLvlid< lvls.size()) {
      if (score >5 && score <10) {
        currentLvlid =1;
      } else if (score >10 && score <20) {
        currentLvlid =2;
      } else if (score >20 && score <30) {
        currentLvlid =3;
      } else if (score >30 && score <40) {
        currentLvlid =4;
      } else if (score >40 && score <50) {
        currentLvlid =5;
      }

      myagent.display();
      myagent.move();
      // l.level();

      // les ecritures dans le jeu

      fill(255);
      textAlign(CENTER);
      textSize(40);
      text("Score : "+score, width/2, 100);

      fill(255);
      textAlign(CENTER, TOP);
      textSize(30);
      text("Niveau : "+currentLvlid, width/10, 100);

      fill(255, 3, 3);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("Vies : "+ vies, width/10, 77);


      if (frameCount%currentlevel.agentPopRate ==0 )
      {
        for (int i=0; i<1; i++) {
          multiple.add(new White(random(width), random(height)));
        }
      }

      if (frameCount%60  ==0  && mechants.size() < 30)
      {
        for (int i=0; i<1; i++) {
          mechants.add(new Red(random(width), random(height)));
        }
      }

      // quand tu manges une bille blache

      for (int i = 0; i<multiple.size(); i++) {
        multiple.get(i).display();
        multiple.get(i).move();
        multiple.get(i).wrap();
        if (dist( myagent.xpos, myagent.ypos, multiple.get(i).xpos, multiple.get(i).ypos) < 25) {
          multiple.remove(i);
          score++;
          pop.play();
        }
      }
      // quand tu manges une bille rouge 

      for (int k = 0; k<mechants.size(); k++) {

        mechants.get(k).display();
        mechants.get(k).move();
        mechants.get(k).wrap();
        if (dist( myagent.xpos, myagent.ypos, mechants.get(k).xpoz, mechants.get(k).ypoz) < 25) {
          mechants.remove(k);
          redcatch++;
          vies--;
          score--;
          sifflet.play();
        }
      }
    } 
    // quand tu finis le jeu 

    else {
      fill(255, 234, 0);
      textAlign(CENTER, CENTER);
      textSize(100);
      text("WIN", width/2, 450);
      if (winnerHasPlayed == false) {
        println("win");
        stade.stop();
        winner.play();
        winnerHasPlayed = true;
      } 
    }
    // quand tu manges 5 billes rouges
  } else {
    fill(255, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("GAME OVER", width/2, 450);
    if (looserHasPlayed == false) {
      stade.stop();
      looser.play();
      looserHasPlayed = true;
    } 
  }
}


void keyPressed() {
  if (key == 'r') {
    currentlevel = lvls.get(0);
    score = 0;
    multiple.clear();
    mechants.clear();
    for (int i = 0; i<10; i++) {
      multiple.add(new White(random(width), random(height)));
    }
    for (int i = 0; i<15; i++) {
      mechants.add(new Red(random(width), random(height)));
    }
  }
}
