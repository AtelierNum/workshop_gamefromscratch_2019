
Cercle c; // personage qui s'appelle 'c'
ArrayList<Agent> agents; // agents à manger rangés dans un tableau qui s'appelle 'agents'
ArrayList<Ennemi> ennemis;
ArrayList<Level> level= new ArrayList<Level>();

int Score = 0;
PImage photo;
int currentlevelID=0;
Level currentLvl;
PImage Soleil;

import processing.sound.*;
SoundFile musique;
SoundFile etoile;
SoundFile trounoir;


float timer = 0;

void setup() { // initialisation de notre programme
  size(600, 600); 
  musique = new SoundFile(this, "light-1.wav");
  musique.play();
  photo = loadImage("Fond.jpg");
  Soleil = loadImage("soleilfois2.jpg");
  noCursor();
  c = new Cercle(); // on créée nôtre personage en faisant appel au constructeur

  level.add(new Level(100, 90, 10));
  level.add(new Level(101, 80, 25));
  level.add(new Level(103, 70, 40));
  level.add(new Level(105, 50, 50));
  currentLvl = level.get(currentlevelID);


  agents = new ArrayList<Agent>(); // on initialise le tableau 
  // on ajoute des instances de notre classe "Agent" dans les cases de notre tableau
  for (int i = 0; i < 5; i++) {
    agents.add(new Agent(random(width), random(height)));
  }
  ennemis = new ArrayList<Ennemi>(); // on initialise le tableau 
  // on ajoute des instances de notre classe "Ennemi" dans les cases de notre tableau
  for (int k = 0; k < 5; k++) {
    ennemis.add(new Ennemi(random(width), random(height)));
  }

  imageMode(CENTER);
}


void draw() { // boucle d'éxecution de nôtre programme
  if (!musique.isPlaying()) { 
    musique.loop();
  }

  timer +=0.01 ;
  image(photo, width/2, height/2);
  //fill(255);
  //textSize(20);
  //text("Level :" + currentlevelID, 0, 590);


  fill(255, 0, 0);
  textSize(20);
  text("Score :" + Score, 5, 20);
  // appeler les fonctionalités de notre personnage
  c.display();
  c.update(0.05);

  if (frameCount%100 == 0) {
    agents.add(new Agent(random(width), random(height)));
  }
  // boucle for permettant de gérer les fonctionalités de nos agents
  for (int i = 0; i < agents.size(); i++) {

    Agent a = agents.get(i); // on stocke l'instance rangé dans la case "i" de notre tableau dans une variable appelée "a"
    // on appelle les fonctionalités de la classe agent sur la variable "a"
    a.update();
    a.display();
    a.wrap();

    // on vérifie si notre personnage et l'agent "a" sont proches l'un de l'autre
    if (dist(a.xpos, a.ypos, c.xpos, c.ypos) < c.r *0.5) {
      etoile = new SoundFile(this, "lightsonbien.wav"); //son quand tu mange un agent 
      etoile.play();
      agents.remove(i); // si c'est bien le cas on supprime l'agent "a" càd la case "i" de notre tableau
      Score++;
      if (ennemis.size() > 0) {
        ennemis.remove(0);
      }
    }
  }
  if (frameCount%80 == 0) {
    ennemis.add(new Ennemi(random(width), random(height)));
  }
  for (int k = 0; k < ennemis.size(); k++) {

    Ennemi b = ennemis.get(k); // on stocke l'instance rangé dans la case "i" de notre tableau dans une variable appelée "b"
    // on appelle les fonctionalités de la classe agent sur la variable "b"
    b.update();
    b.display();
    b.wrap();

    // on vérifie si notre personnage et l'agent "a" sont proches l'un de l'autre
    if (dist(b.xposb, b.yposb, c.xpos, c.ypos) < c.r *0.5) { 
      trounoir = new SoundFile(this, "lightennemis.wav");
      trounoir.play();
      ennemis.remove(k);
      Score = Score -2 ;
    }
  }
  if (Score<0) {
    ennemis.clear();
    agents.clear();
    textSize(70);
    fill(#FC0000);
    image(photo, width/2, height/2);
    text("Looser", width*0.05, height*0.5);
  }
  if (Score>49) {
    ennemis.clear();
    agents.clear();
    textSize(70);
    fill(255, 247, 5);
    image(photo, width/2, height/2);
    text("Win", width*0.05, height*0.5);
  }
}




// classe cercle : notre personnage que l'on contrôle
class Cercle {
  float xpos;
  float ypos;
  float r;

  float xMouse;
  float yMouse;

  // constructeur = initialisation des datas de notre personage
  Cercle() {
    this.xpos = mouseX;
    this.ypos = mouseY;
    this.r = random(40, 45);
  }

  // calculer la nouvelle position de notre personage
  void update(float ease) {

    if (Score >39) { 
      xMouse = mouseY;
      yMouse = mouseX;
    } else { 
      xMouse = mouseX;
      yMouse = mouseY;
    }
    xpos = lerp(xpos, xMouse, ease); // easing
    ypos = lerp(ypos, yMouse, ease);
  }

  // afficher notre personage 
  void display() {
    fill(#FFEA00, random(50, 55));
    stroke(#FFB700);
    strokeWeight(5);
    ellipse(xpos, ypos, r, r);

    stroke(#FFEA00);
    strokeWeight(abs(sin(timer))*5);
    ellipse(xpos, ypos, r-10, r-10);
    // image(img, xpos, ypos, r,r);
  }
}
