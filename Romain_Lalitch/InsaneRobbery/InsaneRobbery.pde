//PROBLEME SUITE A L'UTILISATION DE L'IMAGE DE FOND:
//depuis que j'utilise l'image de fond "imageBanque.png, le programme s'est mit à ramer
//j'ai essayé de baisser la taille du fichier au maximum mais ça ne change rien
//j'ai aussi essayé d'augmenter les fps pour que le jeu paraîsse plus fluide mais les valeurs associées au frameCount ne sont plus très significatives



//possibilité d'ajouter du son au programme
import processing.sound.*;

//ennonciation des sons
SoundFile bruitageBillet;
SoundFile bruitageDiamant;
SoundFile bruitageLingot;
SoundFile bruitageSac;
SoundFile sireneDefaite;
SoundFile sireneVie;
SoundFile musique;

//ennonciation des images
PImage diamant;
PImage liasse;
PImage lingot;
PImage sacDeBillet;
PImage tetePolicier;
PImage teteVoleur;
PImage typo;
PImage imageBanque;

//ennonciation des classes Ball, Agent et Ennemies
Ball d;
Agent e;
Ennemies f;

//création de variables utilisée dans cet onglet
float frameCompteur = frameCount;
int vie = 5;
int score = 0;
float dx;
float dy;

int j = 10;
int k = 10;

float q = random(1, 6);

int currentlevelID = 0;
Level currentLevel;
int nivSuivant;

boolean bonus = false;

//création d'ArrayList permettant de créer plusieurs objets de la même classe
ArrayList<Agent> bille;
ArrayList<Ennemies> mechants;
ArrayList<Bonus1> onus;
ArrayList<Bonus2> bonus2;
ArrayList<Bonus3> bonus3;

ArrayList<Level> levels;

boolean displaySplash = true;
boolean gameOver = false;
boolean sireneDefaiteHasPlayed = false;



void setup() {

  fullScreen();
  background(0);
  imageMode(CENTER);

  //instenciation de la classe Ball
  d = new Ball();

  //instenciation des sons
  bruitageBillet = new SoundFile(this, "Son/bruitageBillet.wav");
  bruitageDiamant = new SoundFile(this, "Son/bruitageDiamant.wav");
  bruitageLingot = new SoundFile(this, "Son/bruitageLingot.wav");
  bruitageSac = new SoundFile(this, "Son/bruitageSac.wav");
  sireneDefaite = new SoundFile(this, "Son/sireneDefaite.wav");
  sireneVie= new SoundFile(this, "Son/sireneVie.wav");
  musique = new SoundFile(this, "Son/MusiqueFinale.wav");

  //instenciation des différents objets qui vont être crées grâce aux ArrayList
  bille = new ArrayList<Agent>();
  mechants = new ArrayList<Ennemies>();
  onus = new ArrayList<Bonus1>();
  bonus2 = new ArrayList<Bonus2>();
  bonus3 = new ArrayList<Bonus3>();
  levels = new ArrayList<Level>();

  //instenciation des différents niveaux avec les paramètres à rentrer pour choisir la vitesse d'apparition des Ennemies, leurs dégats et le score à atteindre pour passer au niveau suivant 
  levels.add(new Level( 90, 1, 10));
  currentLevel = levels.get(currentlevelID);
  levels.add(new Level( 80, 1, 25 ));
  levels.add(new Level( 70, 1, 45));
  levels.add(new Level( 70, 2, 60));
  levels.add(new Level( 60, 2, 80));
  levels.add(new Level( 50, 3, 105));

  imageBanque = loadImage("Images/imageBanque.gif");
  liasse = loadImage("Images/liasse.png");
  teteVoleur = loadImage("Images/teteVoleur.png");
  diamant = loadImage("Images/diamant.png");
  sacDeBillet = loadImage("Images/sacDeBillets.png");
  lingot = loadImage("Images/lingot.png");
  tetePolicier = loadImage("Images/tetePolicier.png");
  typo = loadImage("Images/typo.png");
  imageBanque = loadImage("Images/imageBanque.gif");

  image(imageBanque, 960, 540);

  //commande permettant de jouer la musique de fond en boucle
  musique.loop();

  //une fois le programme lancé, il tourne à 60 images par secondes
  //frameRate(240);
}


void draw() {  

  //création d'un écran d'accueil qui lorsqu'il n'est plus affiché laisse place au jeu
  if (displaySplash == true) {
    //instenciation des différentes images



    //lignes permettant de choisir la  disposition des images et du texte sur l'écran d'acceuil
    image(imageBanque, 960, 540);
    image(typo, 900, 180);
    image(teteVoleur, 200, 200, 100, 100);
    image(liasse, 200, 350, 100, 100);
    image(sacDeBillet, 200, 500, 100, 100);
    image(diamant, 200, 650, 100, 100);
    image(lingot, 200, 800, 100, 100);
    image(tetePolicier, 200, 950, 100, 100);
    textSize(50);
    text("PRESS S TO START", 750, 1050);
    textSize(30);
    text("YOU", 250, 200);
    text("TAKE THAT TO INCREASE YOUR SCORE!", 250, 350);
    text("TAKE IT BUT BEWARE TO THE POLICE'S SHOTS, YOU COULD LOSE A LIFE!", 250, 500);
    text("TAKE IT TO INCREASE YOUR SIZE", 250, 650);
    text("THIS IS A LIFE!!", 250, 800);
    text("DON'T GET CAUGHT, DON'T TOUCH THEM", 250, 950);

    if (keyPressed && key=='s') {
      displaySplash =false;
    }
  }
  if (displaySplash == false) {
    background(0);

    //fonctions appelées dans le draw



    image(imageBanque, 960, 540);

    passageNiveau();

    d.update();

    d.display();

    trainee();

    agents();

    mechants();

    bonus();

    bonus2();

    bonus3();

    victoire();

    defaite();

    indicScore(); 

    leave();

    texte();
  }
}



//création de toutes les fonctions afin que le draw soit plus lisible et moins encombré
//il suffit de les appeler dans le draw avec leur nom


//création de la fonction permettant de faire une trainée derrière les objets affichés à l'écran pendant le jeu
//dans mon cas elle ne sert à rien car elle n'est pas appelée dans le draw mais j'ai décidé de la laisser
void trainee() {

  noStroke();
  fill(0, 0, 0, 20);
  fullScreen();
}

//fonction permettant de gérer la vitesse d'apparition des Agents
//elle gère aussi le fait qu'ils disparaissent et fassent un son lorsque l'on passe dessus
//si on en récupère un, le score augmente de 1 point 
void agents() {
  if (frameCount%60 == 0) {
    for (int i=0; i<1; i++) {
      bille.add(new Agent(random(width), random(height)));
    }
  }

  for (int i = 0; i < bille.size(); i++) {
    Agent a = bille.get(i);
    a.position();
    a.deplacement();
    a.warp();

    if (dist(d.x, d.y, bille.get(i).xpos, bille.get(i).ypos) < j) {
      bille.remove(i);
      score++;
      bruitageBillet.play();
    }
  }
}

//fonction permettant de gérer la vitesse d'apparition des Ennemies
//elle gère aussi le fait qu'ils disparaissent et fassent un son lorsque l'on passe dessus
//lorsqu'on en récupère un, on perd une vie
void mechants() {
  if (frameCount%currentLevel.ennemyRatePop == 0) {
    for (int i=0; i<1; i++) {
      mechants.add(new Ennemies(random(width), random(height)));
    }
  }

  for (int i = 0; i < mechants.size(); i++) {
    Ennemies f = mechants.get(i);
    f.position();
    f.deplacement();
    f.warp();

    if (dist(d.x, d.y, mechants.get(i).xpos, mechants.get(i).ypos) < j) {
      mechants.remove(i);
      vie = vie - currentLevel.ennemyDamages;
      sireneVie.play();
    }
  }
}

//fonction permettant de gérer la vitesse d'apparition des Bonus1
//elle gère aussi le fait qu'ils disparaissent et fassent un son lorsque l'on passe dessus
//ici, lorsque le bonus est prit, la taille de notre Ball grossit
//au bout de 300 images, sa taille redevient normale
void bonus() {
  if (frameCount%900 == 0) {
    for (int i=0; i<1; i++) {
      onus.add(new Bonus1(random(width), random(height)));
    }
  }
  for (int i = 0; i < onus.size(); i++) {
    Bonus1 g = onus.get(i);
    g.position();
    g.deplacement();
    g.warp();

    if (dist(d.x, d.y, onus.get(i).xpos, onus.get(i).ypos) < k) {
      onus.remove(i);
      bruitageLingot.play();
      bonus = true;
    }
  }
  if (bonus == true) {
    if (frameCount% 300==0) {
      bonus = false;
    }
  }
  if (bonus == true) {
    j = 60;
    d.w = 200;
    d.c = 200;
  }
  if (bonus == false) {
    j = 20;
    d.w = 100;
    d.c = 100;
  }
}

//fonction permettant de gérer la vitesse d'apparition des Bonus2
//elle gère aussi le fait qu'ils disparaissent et fassent un son lorsque l'on passe dessus
//ici, si le score gagné aléatoirement dépasse 3, on perd une vie
void bonus2() {

  if (frameCount%450 == 0) {
    for (int i=0; i<1; i++) {
      bonus2.add(new Bonus2(random(width), random(height)));
    }
  }

  for (int i = 0; i < bonus2.size(); i++) {
    Bonus2 f = bonus2.get(i);
    f.position();
    f.deplacement();
    f.warp();

    if (dist(d.x, d.y, bonus2.get(i).xpos, bonus2.get(i).ypos) < j) {
      bonus2.remove(i);
      bruitageSac.play();
      score += random(1, 6);
      if (random(1, 6) >= 3) {
        vie --;
      }
    }
  }
}

//fonction permettant de gérer la vitesse d'apparition des Bonus3
//elle gère aussi le fait qu'ils disparaissent et fassent un son lorsque l'on passe dessus
void bonus3() {

  if (frameCount%1500 == 0) {
    for (int i=0; i<1; i++) {
      bonus3.add(new Bonus3(random(width), random(height)));
    }
  }

  for (int i = 0; i < bonus3.size(); i++) {
    Bonus3 p = bonus3.get(i);
    p.position();
    p.deplacement();
    p.warp();

    if (dist(d.x, d.y, bonus3.get(i).xpos, bonus3.get(i).ypos) < j) {
      bonus3.remove(i);
      vie ++;
      bruitageDiamant.play();
    }
  }
}

//fonction permettant de changer de niveau en faisant disparaître tous les Agents, Ennemies et Bonus accumulés durant le jeu
void passageNiveau() {
  if (score >= currentLevel.score) {
    currentlevelID++;
    currentLevel = levels.get(currentlevelID);
    bille.clear();
    mechants.clear();
    onus.clear();
    bonus2.clear();
    bonus3.clear();
  }
}

//fonction permettant d'afficher un écran de défaite si les vies sont à 0 ou moins
void defaite() {
  if (vie <= 0) {

    background(0);
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER", width/2, height/2);
    textSize(50);
    text("PRESS E TO EXIT", width/2, 950);
    text("PRESS R TO RESTART", width/2, height/4);
    musique.stop();
    if (keyPressed && key =='r') {
      displaySplash = true;

      bille = new ArrayList<Agent>();
      mechants = new ArrayList<Ennemies>();
      onus = new ArrayList<Bonus1>();
      bonus2 = new ArrayList<Bonus2>();
      bonus3 = new ArrayList<Bonus3>();
      vie = 5;
      score = 0;
      currentlevelID = 0;
      musique.play();
    }




    if (sireneDefaiteHasPlayed == false) {
      sireneDefaite.play();
      sireneDefaiteHasPlayed = true;
    }
  }
}

//fonction qui permet d'afficher un écran de victoire si le score arrive à 105 ou le dépasse
void victoire() {
  if (score >= 105) {
    textAlign(CENTER, CENTER);
    background(255);
    textSize(150);
    fill(0);
    text("VICTOIRE", width/2, height/2);
    textSize(50);
    text("PRESS E TO EXIT", width/2, 950);
    text("PRESS R TO RESTART", width/2, height/4);
    musique.stop();
    if (keyPressed && key =='r') {
      displaySplash = true;

      bille = new ArrayList<Agent>();
      mechants = new ArrayList<Ennemies>();
      onus = new ArrayList<Bonus1>();
      bonus2 = new ArrayList<Bonus2>();
      bonus3 = new ArrayList<Bonus3>();
      vie = 5;
      score = 0;
      currentlevelID = 0;
      musique.play();
    }
  }
}

//fonction permettant d'afficher du texte tout au long du jeu
void texte() {
  fill(255);
  textAlign(CENTER, TOP);
  textSize(40);
  text("Score : " +score, width/2, 20);

  fill(255, 100, 100);
  textAlign(LEFT, TOP);
  textSize(25);
  text("Vie x" +vie, 0, 0);
}

//fonction indicant les objectifs de score à atteindre pour passer au niveau suivant
void indicScore() {
  fill(255);
  textAlign(TOP, RIGHT);
  textSize(25);
  String s = "Score à atteindre : ";
  nivSuivant = currentLevel.score ;
  if (currentlevelID == 0) {
   
    
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }

  if (currentlevelID == 1) {
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }

  if (currentlevelID == 2) {
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }

  if (currentlevelID == 3) {
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }

  if (currentlevelID == 4) {
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }

  if (currentlevelID == 5) {
    text("Score à atteindre : " +nivSuivant, width- textWidth(s + nivSuivant), 40);
  }
}

//fonction permettant de quitter le programme quand on appuie sur E
void leave() {
  if (keyPressed && key =='e') {
    exit();
  }
}
