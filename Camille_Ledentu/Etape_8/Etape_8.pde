//insérer le son

import processing.sound.*;
SoundFile carotSound;
SoundFile badSound;
SoundFile campagneSound;
SoundFile maisSound;

PImage photo;
PImage mouton;
PImage pomme;
PImage cigarette;
PImage maisbonus;
PImage victoire;

//Variables
ArrayList<Circle> multiple = new ArrayList <Circle>();  //On créait un tableau

ArrayList<Red>list = new ArrayList <Red> ();

ArrayList<Level>lvls = new ArrayList <Level> ();

ArrayList<Bonus>listmais = new ArrayList<Bonus> ();

int currentLevelID = 0;
int score = 0;
int vies = 5;

boolean perdu = false;
boolean gagne = false;

Boule b;
Level l;
Red r;
Bonus B;

void setup() {

  carotSound = new SoundFile(this, "soncarotte.wav");
  badSound = new SoundFile ( this, "Bad.wav");
  campagneSound = new SoundFile (this, "campagne.wav" );
  campagneSound.play();
  campagneSound.loop();
  maisSound = new SoundFile (this, "mais.wav");



  size(600,600);

  //insérer les images

  photo = loadImage("grass background.jpg" );
  mouton = loadImage ("mouton.png" );
  pomme = loadImage ("pomme.png" );
  cigarette = loadImage ("cigarette.png" );
  maisbonus = loadImage ("mais.png" );
  victoire= loadImage ("victoire.png");

  b = new Boule();

  lvls.add(new Level (50, 220, 300, 0));
  lvls.add(new Level( 70, 200, 330, 20));
  lvls.add(new Level ( 80, 170, 350, 60));
  lvls.add(new Level ( 90, 160, 370, 80));
  lvls.add(new Level ( 100, 150, 400, 100));
  lvls.add(new Level ( 100, 150, 400, 100));

  //Ecran de victoire
  l = lvls.get(currentLevelID);
  lvls.add(new Level ( 100, 150, 400, 100));
}

void draw() {

  //mettre un background

  image(photo, 0, 0);

  //écrire le score

  fill (255, 180, 180);
  textAlign (CENTER, TOP);
  textSize (50);
  text (" Score : " + score, 300, 20);

  //écrire les niveaux

  fill(255);
  textAlign (TOP, LEFT);
  textSize (20);
  text ("Niveau : "+ (currentLevelID +1), 15, 100);

  //Pop

  if (frameCount% l.circlePopRate == 0) {

    for ( int i=0; i<1; i++) {                                                //Quand i est entre 0 et 100, i augmente(boucle)
      multiple.add(new Circle(random(width), random(height)));                  //le but de la boucle for est de répéter un block de code autant de fois qu'on veut
    }
  }

  if (frameCount% l.redPopRate == 0) {

    for (int a=0; a<1; a++) {  
      list.add(new Red(random(width), random(height)));
    }
  }

  if (frameCount% l.BonusRatePop == 0) {

    for ( int i=0; i<1; i++) {                                              
      listmais.add(new Bonus(random(width), random(height)));
    }
  }

  //on invoque la class Boule

  b.forme();

  //on "invoque" la class circle

  for ( int i=0; i<multiple.size(); i++) {

    Circle c = multiple.get(i);
    c.update();                                    //on ajoute les différentes fonctionnalités 
    c.display();
    c.wrap();


    //calcul distance entre le mouton et les pommes

    if (abs(b.X - c.xpos) < c.r && abs(b.Y - c.ypos) < c.r) {     //pour invoquer une donné de ma classe, j'écris la premiere lettre donc c

      //dépop

      multiple.remove(i);
      score++;

      //insérer son manger carotte

      carotSound.play();
    }
  }

  //on invoque la classe Bonus

  for ( int i=0; i<listmais.size(); i++) {

    Bonus B = listmais.get(i);
    B.update();                                    //on ajoute les différentes fonctionnalités 
    B.display();
    B.wrap();


    //calcul distance entre le mouton et le mais

    if (abs(b.X - B.xpos) < B.r && abs(b.Y - B.ypos) < B.r) {     //pour invoquer une donné de ma classe, j'écris la premiere lettre donc c

      //dépop

      listmais.remove(i);
      score = score + 3;

      //son mais

      maisSound.play();
    }
  }


  //on invoque la class Red

  for (int a=0; a<list.size(); a++) {

    Red r = list.get(a);
    r.position();
    r.dessin();
    r.condition();

    //calcul distance entre méchantes bulles et la boule 

    if (abs(b.X- r.xposi) < r.ray && abs (b.Y - r.yposi) < r.ray) {

      //-1 si on touche une bulle rouge

      list.remove(a);
      vies=vies-1;

      //insérer son manger cigarette

      badSound.play();
    }
  }


  fill(255, 180, 180);
  textSize(20);
  text("Vies :" + vies, width-125, 100);

  if (vies <= 0) {
    multiple.clear();
    list.clear();
    listmais.clear();
    vies = 0;
    perdu = true;


    background(0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("TU VIENS DE TUER UN MOUTON.", width * 0.5, height*0.5);
    text("clique pour te rattraper.", width * 0.5, height*0.5+60);


    if (perdu) {
      if (mousePressed) {
        vies = 5;
        score = 0;
        currentLevelID = 0;
        lvls.add(new Level (50, 220, 350, 40));
        perdu = false;
      }
    }
  }

  if (currentLevelID >= 4) {
    multiple.clear();
    list.clear();
    listmais.clear();
    gagne = true;

    image(photo, 0, 0);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("Bravo !", width * 0.5, height*0.5);
    textSize(35);
    text("tu peux avoir bonne conscience.", width * 0.5, height*0.5+60);
    textSize(25);
    text("clique pour sauver d'autres moutons.", width * 0.5, height*0.5+120);

    if (gagne) {
      if (mousePressed) {
        vies = 5;
        score = 0;
        currentLevelID = 0;
        lvls.add(new Level (50, 220, 350, 20));
        gagne = false;
      }
    }
  }
  // augmenter les niveaux

  if (score > 0 && score < 20) {
    currentLevelID = 0;
    l = lvls.get(currentLevelID);
  } else if (score > 20 && score < 60) {
    currentLevelID = 1;
    l = lvls.get(currentLevelID);
  } else if (score > 60 && score < 80) {
    currentLevelID = 2;
    l = lvls.get(currentLevelID);
  } else if (score > 80 && score < 100) {
    currentLevelID = 3;
    l = lvls.get(currentLevelID);
  } else if (score > 100 && score <102) {
    currentLevelID = 4;
  } else if (score > 102 && score <105) {
    currentLevelID = 5;
  }
}
