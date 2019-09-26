// imortation des pistes sonores
import processing.sound.*;
SoundFile musiqueFond;
SoundFile epicVictory;
SoundFile victory;
SoundFile gameOver;
SoundFile eating;
SoundFile maleHurt;
SoundFile powerup;

//définiyion des noms des array lists
ArrayList<Cercle2> agents;

ArrayList<Vilain> vilains;

ArrayList<Regen> regens;

ArrayList<Level> levels;

//Défnition des variables

//Ces int permettent de définir les variables pour la classe Level
int curentLevelID = 0;
Level curentLevel;

int score = 0;

int vie = 5;

int agentsNumber;

int agentRatePop;

int vilainNumber;

int vilainRatePop;

int regenNumber;

int regenRatePop;

int agentEaten;

int nPoppedAgent = 0;

int nPoppedVilain = 0;

int nPoppedRegen = 0;

// booléens qui permettent évitement du lancemant à chaque frame des musiques

boolean lecture = false;

boolean gameIsWin = false;

boolean gameIsEpicWin = false;

boolean gameIsOver = false;

// définition de la classe
class Cercle {

  float posX;
  float posY;
  // constructeur de la classe
  Cercle() {
  }

  // définition variable dessin du cercle
  void dessin() {

    // taille du contour
    strokeWeight(10);

    stroke(0, 255, 255);

    // couleur de l'ellipse circulaire
    fill(0, 0, 255);
  }

  // définition locatisation du cercle
  void localisation() {

    // le dernier chiffre est toujours entre 0 et 1
    posX = lerp(posX, mouseX, 0.05);
    posY = lerp(posY, mouseY, 0.05);

    // taille et position de l'ellipse 
    ellipse(posX, posY, 50, 50);
  }
}

// définition de la classe
class Cercle2 {
  //randomisation des offsets
  float xoff = random(0, 1);
  float yoff = random(0, 900);

  float posX;
  float posY;

  // constructeur de la classe
  Cercle2(float _x, float _y) {
    posX = _x;
    posY = _y;
  }

  // définition variable dessin du cercle
  void dessin() {

    // taille du contour
    strokeWeight(10);

    stroke(175, 255, 175);

    // couleur de l'ellipse circulaire
    fill(0, 255, 175);

    // taille et position de l'ellipse 
    ellipse(posX, posY, 50, 50);
  }

  // définition locatisation du cercle
  void localisation() {

    xoff = xoff + 0.01;
    yoff = yoff + 0.05;

    posX += map(noise(xoff), 0, 1, -5, 5);
    posY += map(noise(yoff), 0, 1, -5, 5);
  }

  //définition de la réapparition du cercle hors-champ
  void tp() {

    //téléprtoation aux bords opposés
    if (posX > width)
      posX = 0;
    if (posX < 0)
      posX = width;
    if (posY > height)
      posY = 0;
    if (posY < 0)
      posY = height;
  }
}

// définition de la classe
class Vilain {
  //randomisation des offsets
  float xoff = random(0, 1);
  float yoff = random(0, 900);

  float posX;
  float posY;

  // constructeur de la classe
  Vilain(float _x, float _y) {
    posX = _x;
    posY = _y;
  }

  // définition variable dessin du cercle
  void dessin() {

    // taille du contour
    strokeWeight(10);

    stroke(255, 125, 125);

    // couleur de l'ellipse circulaire
    fill(255, 0, 0);

    // taille et position de l'ellipse 
    ellipse(posX, posY, 50, 50);
  }

  // définition locatisation du cercle
  void localisation() {

    xoff = xoff + 0.01;
    yoff = yoff + 0.05;

    posX += map(noise(xoff), 0, 1, -5, 5);
    posY += map(noise(yoff), 0, 1, -5, 5);
  }

  //définition de la réapparition du cercle hors-champ
  void tp() {

    //téléprtoation aux bords opposés
    if (posX > width)
      posX = 0;
    if (posX < 0)
      posX = width;
    if (posY > height)
      posY = 0;
    if (posY < 0)
      posY = height;
  }
}

// définition de la classe
class Regen {
  //randomisation des offsets
  float xoff = random(0, 1);
  float yoff = random(0, 900);

  float posX;
  float posY;

  // constructeur de la classe
  Regen(float _x, float _y) {
    posX = _x;
    posY = _y;
  }

  // définition variable dessin du cercle
  void dessin() {

    // taille du contour
    strokeWeight(10);

    stroke(125, 255, 255);

    // couleur de l'ellipse circulaire
    fill(0, 255, 255);

    // taille et position de l'ellipse 
    ellipse(posX, posY, 50, 50);
  }

  // définition locatisation du cercle
  void localisation() {

    xoff = xoff + 0.01;
    yoff = yoff + 0.05;

    posX += map(noise(xoff), 0, 1, -5, 5);
    posY += map(noise(yoff), 0, 1, -5, 5);
  }

  //définition de la réapparition du cercle hors-champ
  void tp() {

    //téléprtoation aux bords opposés
    if (posX > width)
      posX = 0;
    if (posX < 0)
      posX = width;
    if (posY > height)
      posY = 0;
    if (posY < 0)
      posY = height;
  }
}

// définition de la classe Level qui permet de contrôler le nombre d'agents et ennemis et régénérateurs qui apparaissent
// ainsi que du nombre d'agents à manger pour passer au niveau suivant
class Level {

  public int agentNumber;
  public int agentRatePop;
  public int vilainNumber;
  public int vilainRatePop;
  public int regenNumber;
  public int regenRatePop;
  public int agentEaten;

  public Level(int agentNumber, int agentRatePop, int vilainNumber, int vilainRatePop, int regenNumber, int regenRatePop, int agentEaten) {

    this.agentNumber = agentNumber;
    this.agentRatePop = agentRatePop;
    this.vilainNumber = vilainNumber;
    this.vilainRatePop = vilainRatePop;
    this.regenNumber = regenNumber;
    this.regenRatePop = regenRatePop;
    this.agentEaten = agentEaten;
  }
}

Cercle c;

// exécuté 1 fois au démarrage
void setup() {

  // implémentation des pistes sonores
  musiqueFond = new SoundFile(this, "musiqueFond.wav");
  eating = new SoundFile(this, "eating.wav");
  maleHurt = new SoundFile(this, "maleHurt.wav");
  powerup = new SoundFile(this, "powerup.wav");
  victory = new SoundFile(this, "victory.wav");
  epicVictory =  new SoundFile(this, "epicVictory.wav");
  gameOver = new  SoundFile(this, "gameOver.wav");

  // permet d'afficher le jeu en plein écran
  fullScreen();
  
  // appelle les différents éléments stockés dans les arrayLists dans l'espace de jeu 
  agents = new ArrayList<Cercle2>();

  vilains = new ArrayList<Vilain>();

  regens = new ArrayList<Regen>();

  levels = new ArrayList<Level>();

  c = new Cercle();

  // permet de définir le patern de spawn par niveau
  // ainsi que le nombre de cercles agents à manger pour passer au niveau suivant
  // les variables renseignées sont nb agents //fréquence spawn agents //nb vilains //fréquence spawn vilains //nb régénérateurs //fréquence spawn régénérateurs //nb agents à manger 
  levels.add(new Level(10, 60, 3, 125, 1, 60, 10));
  curentLevel = levels.get(curentLevelID);
  levels.add(new Level(15, 60, 7, 125, 1, 60, 15));
  levels.add(new Level(20, 60, 13, 125, 2, 60, 20));
  levels.add(new Level(25, 60, 18, 125, 2, 60, 25));

  // permet de nettoyer l'espace de jeu
  agents.clear();

  vilains.clear();

  regens.clear();
}

// s'éxécute à chaque frame
void draw() {
  if (lecture == false) {
    musiqueFond.loop();
    lecture = true;
  }

  // Permet de réinitialiser la valeur des agents mangés à chaque niveau
  if (agentEaten >= curentLevel.agentEaten && curentLevelID < 3) {

    agentEaten = 0;

    nPoppedAgent = 0;

    nPoppedVilain = 0;

    nPoppedRegen = 0; 

    curentLevelID++;

    curentLevel = levels.get(curentLevelID);

    agents.clear();

    vilains.clear();

    regens.clear();
    
  // Fin du jeu avec un score inférieur au score maximal mais supérieur à zéro
  } else if (curentLevelID == 3  && agentEaten > 24 && score > 0 && score < 70) {
    
    //permet de jouer une petite musique une fois quand la condition est validée
    if (gameIsWin == false) {
      musiqueFond.stop();
      victory.play();
      gameIsWin = true;
    }

    fill(155, 155, 255);

    textAlign(CENTER, TOP);

    textSize(100);

    text("YOU WIN BUT COULD DO BETTER", width/2, 300);
    
    // les clear pemettent de stopper la progression dans le jeu quand une condition de fin de jeu est validée
    agents.clear();

    vilains.clear();

    regens.clear();
    
  // Fin du jeu avec un score inférieur à zéro
  // c'est pour pouvoir déclencher cette fin rigolote que le nombre de vies supplépentaires est tel qu'il est pour chaque niveau
  // c'est également pour pouvoir déclencher cette fin que la diminution de score par les ennemis est aussi importante
  } else if (curentLevelID == 3 && agentEaten > 24 && score < 0) {

    //permet de jouer une petite musique une fois quand la condition est validée
    if (gameIsWin == false) {
      musiqueFond.stop();
      victory.play();
      gameIsWin = true;
    }

    fill(125, 255, 125);

    textAlign(CENTER, TOP);

    textSize(100);

    text("YOU WIMP (Look at your score)", width/2, 300);

    // les clear pemettent de stopper la progression dans le jeu quand une condition de fin de jeu est validée
    agents.clear();

    vilains.clear();

    regens.clear();
    
  // Fin du jeu sans avoir touché un seul ennemi donc avec le score maximal
  } else if (curentLevelID == 3 && agentEaten > 24 && score == 70) {

    
    //permet de jouer une petite musique une fois quand la condition est validée
    if (gameIsEpicWin == false) {
      musiqueFond.stop();
      epicVictory.play();
      gameIsEpicWin = true;
    }

    fill(255, 255, 255);

    textAlign(CENTER, TOP);

    textSize(100);

    text("YOU ARE OVER 9000", width/2, 300);

    // les clear pemettent de stopper la progression dans le jeu quand une condition de fin de jeu est validée
    agents.clear();

    vilains.clear();

    regens.clear();
  }
  
  // Fin du jeu sans victoire
  if (vie < 1) {

    //permet de jouer une petite musique une fois quand la condition est validée
    if (gameIsOver == false) {
      musiqueFond.stop();
      gameOver.play();
      gameIsOver = true;
    }

    fill(255, 0, 0);

    textAlign(CENTER, TOP);

    textSize(100);

    text("GAME OVER (Disease win)", width/2, 300);

    // les clear pemettent de stopper la progression dans le jeu quand une condition de fin de jeu est validée
    agents.clear();

    vilains.clear();

    regens.clear();
  }

  //exploîtation de l'ArrayList
  for (int i = 0; i < agents.size(); i++) {
    Cercle2 a = agents.get(i);
    a.localisation();
    a.dessin();
    a.tp();

    //calcul de la distance
    float d = dist(c.posX, c.posY, a.posX, a.posY);

    //Unpop et taille de la hitbox
    //Hitbox à la faveur du joueur qui permet de s'emparer d'un bonus
    //Ceci même quand le bonus est très proche d'un ennemi
    //Ainsi que jeu d'un son de circonstance
    if (d < 40) {
      agents.remove(i);
      score ++;
      agentEaten += 1;
      eating.play();
    }
  }

  //exploîtation de l'ArrayList
  for (int i = 0; i < vilains.size(); i++) {
    Vilain v = vilains.get(i);
    v.localisation();
    v.dessin();
    v.tp();

    float d = dist(c.posX, c.posY, v.posX, v.posY);

    //Unpop et taille de la hitbox
    //Hitbox à la faveur du joueur qui permet de s'emparer d'un bonus
    //Ceci même quand le bonus est très proche d'un ennemi
    //Ainsi que jeu d'un son de circonstance
    if (d < 25) {
      vilains.remove(i);
      score -= 10;
      vie -= 1;
      maleHurt.play();
    }
  }

  //exploîtation de l'ArrayList
  for (int i = 0; i < regens.size(); i++) {
    Regen r = regens.get(i);
    r.localisation();
    r.dessin();
    r.tp();

    float d = dist(c.posX, c.posY, r.posX, r.posY);
     
    //Unpop et taille de la hitbox
    //Hitbox à la faveur du joueur qui permet de s'emparer d'un bonus
    //Ceci même quand le bonus est très proche d'un ennemi
    //Ainsi que jeu d'un son de circonstance
    if (d < 40) {
      regens.remove(i);
      vie += 1;
      powerup.play();
    }
  }

  //fonction libre effet de déplacement
  comete();

  //foncion incluse dans une classe de dessin du cercle
  c.dessin();

  //fonction incluse dans une classe de localisation du cercle
  c.localisation();

  //Pop décalé Cerle2 et limiteur de spawn
  if (frameCount % curentLevel.agentRatePop == 0 && nPoppedAgent < curentLevel.agentNumber) {
    for (int i = 0; i < 1; i++) {
      agents.add(new Cercle2(random(width), random(height)));
      nPoppedAgent += 1;
    }
  }

  //Pop décalé Vilain et limiteur de spawn
  if (frameCount % curentLevel.vilainRatePop == 0 && nPoppedVilain < curentLevel.vilainNumber) {
    for (int i = 0; i < 1; i++) {
      vilains.add(new Vilain(random(width), random(height)));
      nPoppedVilain += 1;
    }
  }

  //Pop décalé Regen et limiteur de spawn
  if (frameCount % curentLevel.regenRatePop == 0 && nPoppedRegen < curentLevel.regenNumber) {
    for (int i = 0; i < 1; i++) {
      regens.add(new Regen(random(width), random(height)));
      nPoppedRegen += 1;
    }
  }

  //paramètres de texte
  fill(255);

  textAlign(CENTER, TOP);

  textSize(20);

  //+score pour lier texte et variable
  text("Score : "+score, width/2, 50);

  fill (255);

  textSize(20);

  text("Vie(s) : "+vie, width/2, 100);

  fill (255);

  textSize(20);

  text("Niveau : "+curentLevelID, width/2, 150);
}

// définition de la variable comete
void comete() {

  noStroke();

  fill(0, 0, 0, 25);

  rect(0, 0, width, height);
}
