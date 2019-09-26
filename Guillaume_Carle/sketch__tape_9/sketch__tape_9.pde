import processing.sound.*;
SoundFile musique;
SoundFile sonbonus;
SoundFile malus;
SoundFile manger;


PImage photo;
PImage photo1;
PImage Wow;
PImage spriteenemi;
PImage spriteagent;
PImage spritebonus;
PImage spritecercle;

Cercle c; // personage qui s'appelle 'c'
ArrayList<Agent> agents; // agents à manger rangés dans un tableau qui s'appelle 'agents'
ArrayList<Bonus>bonus;
ArrayList<Enemi> enemis;
ArrayList<Level>levels=new ArrayList<Level>();


int score=0;
;
int currentLevelID=0;
Level currentLvl;

int apoprate;
int epoprate;

boolean pause= false;



void setup() { // initialisation de notre programme//............................................................................................
  fullScreen(); 
  
  imageMode(CENTER);
  fullScreen();
  
 photo1 = loadImage("youtubebugflesdroitdauteur.jpg");
 photo1.resize(width,height);
  
 photo = loadImage("fond wankil.jpg");
 photo.resize(width, height);
 
 Wow= loadImage("wow.jpg");
 Wow.resize(width,height);

  c = new Cercle(); // on créée nôtre personage en faisant appel au constructeur

  agents = new ArrayList<Agent>(); // on initialise le tableau 
  // on ajoute des instances de notre classe "Agent" dans les cases de notre tableau
  for (int i = 0; i < 1; i++) {
    agents.add(new Agent(random(width), random(height)));
  }
  enemis= new ArrayList<Enemi>();
  for (int i=0; i<15; i++) {
    enemis.add(new Enemi(random(width), random(height)));
  }
  bonus= new ArrayList<Bonus>();
  for (int i=0; i<1; i++) {
    bonus.add(new Bonus(random(width), random(height)));
  }

  levels.add(new Level(30, 100));
  levels.add(new Level(30, 80));
  levels.add(new Level(30, 60));
  levels.add(new Level(30, 30));
  levels.add(new Level(30, 10));
  currentLvl = levels.get(currentLevelID);

  musique = new SoundFile(this, "Victory.mp3");
  musique.loop();
}

void draw() { // boucle d'éxecution de nôtre programme//..................................................................................................


 background(photo);
//affichage des textes
  textSize(20);
  fill(255);
  text("YouTube money :"+score, width*0.010, height*0.025);//affichage tu score


  textSize(30);
  fill(50+random(255), 50+random(255), 50+random(255));
  text("Niveau : "+currentLevelID, width*0.010, height*0.050);


  textSize(20);
  fill(255);
  text("la moneytisation : +1", width*0.010, height*0.075);

  textSize(20);
  fill(255, 240, 0);
  text("la démoneytisation: tu es nul", width*0.010, height*0.100);

  textSize(20);
  fill(50+random(255), 50+random(255), 50+random(255));
  text("Le wankul fuyard: +10", width*0.010, height*0.125);

  // appeler les fonctionalités de notre personnage
  c.display();
  c.update();


  // creation des niveaux
  if (score>0&& score<25) {
    currentLevelID=0;
    currentLvl = levels.get(currentLevelID);
  } else if (score>25 && score<50) {
    currentLevelID=1;
    currentLvl = levels.get(currentLevelID);
  } else if (score>50 && score<75) {
    currentLevelID=2;
    currentLvl = levels.get(currentLevelID);
  } else if (score>75 && score<100) {
    currentLevelID=3;
    currentLvl = levels.get(currentLevelID);
  }

  //réglage du taux d'apparition
  if (frameCount%  currentLvl.epoprate==0 && pause==false) {// spon aléaoire ben fonction des frames
    enemis.add(new Enemi(random(width), random(height)));
  }

  if (frameCount% currentLvl.apoprate==0) {
    agents.add(new Agent(random(width), random(height)));
  } 
  if (frameCount%900==0) {
    bonus.add(new Bonus(random(width), random(height)));
  }
  // boucle for permettant de gérer les fonctionalités de nos agents
  for (int i = 0; i < agents.size(); i++) {


    Agent a = agents.get(i); // on stocke l'instance rangé dans la case "i" de notre tableau dans une variable appelée "a"
    // on appelle les fonctionalités de la classe agent sur la variable "a"
    a.update();
    a.display();
    a.wrap();

    // on vérifie si notre personnage et l'agent "a" sont proches l'un de l'autre
    if (dist(a.xpos, a.ypos, c.xpos, c.ypos) < c.r *0.7) {
      manger = new SoundFile(this, "manger.mp3");
      manger.play();
      
      agents.remove(i);
      score++;// si c'est bien le cas on supprime l'agent "a" càd la case "i" de notre tableau
    }
  }

  for (int i = 0; i < enemis.size(); i++) {
    Enemi b = enemis.get(i);
    b.update();
    b.display();
    b.wrap();

    if (dist(b.xpos, b.ypos, c.xpos, c.ypos) < c.r *0.6) {
      malus = new SoundFile(this, "sf_canon_01.mp3");
      malus.play();
       
      enemis.remove(i);
      score-=10;
    }
  }

  for ( int i=0; i<bonus. size(); i++) {

    Bonus d=bonus.get(i);
    d.update();
    d.display();
    d.wrap();

    if (dist(d.xpos, d.ypos, c.xpos, c.ypos) <c.r*0.6) {
    sonbonus = new SoundFile(this, "bonus.mp3");
  sonbonus.play();
      
      bonus.remove(i);
      score += 10;
    }
  }

  if (score<0) {

    clear();
     
    background(photo1);
    
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Tu es nul et pauvre", width/2, height*0.80);
  }

  if (score>100) {
    enemis.clear();
    background(Wow);
    pause=true;
   
    textSize(200);
    textAlign(CENTER, CENTER);
    fill(50+random(255), 50+random(255), 50+random(255));
    text("Tu es riche", width/2, height*0.75);
    
      textSize(75);
    textAlign(CENTER, CENTER);
    fill(50+random(255), 50+random(255), 50+random(255));
    text(" tout droit réservé à WankilStudio",width/2,height*0.25);
  }
}
