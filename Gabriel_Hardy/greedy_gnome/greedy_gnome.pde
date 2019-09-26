public int life = 6; //variable representant les vies
float Xe = mouseX;//Variables permettant d'utiliser les coordonnées de souris
float Ye = mouseY;
int Epoprate = 1;//Variables faisant augmenter la vitesse des ennemis
int Eporateg= 1;
public int scoremax = 10;//Variable definissant le score à atteindre pour passer au niveau superieur
int level= 1;//Variable correspondant au niveau
float X=width/2;//
float Y=height/2;
public boolean malus = false;//Boolean permettant de faire varier la taille des ennemis en cas de collision avec "gros_calibre"
public int score = 0;//Variable correspondant au score
public int re = 45;
ArrayList<Yolo> yolo = new ArrayList <Yolo>();//Listes contenant tout les objets utilisés


ArrayList<Enemi> foe = new ArrayList <Enemi>();

ArrayList<Heal> heal = new ArrayList <Heal>();

ArrayList<Gc> gc = new ArrayList <Gc>();

ArrayList<TC> tc = new ArrayList <TC>();

Boule ball;

import processing.sound.*;//Importation des sons
SoundFile cash;
SoundFile gros;
SoundFile Hit;
SoundFile Heal;
SoundFile Levelup;
SoundFile Warning;
SoundFile Background;

PImage sprite2;//importation des images
PImage cristal;
PImage boulerouge;
PImage grosseboule;
PImage cross;
PImage sainteboule;
PImage bk;

void setup() {
  
  fullScreen(P2D);

  ball = new Boule();

  cash = new SoundFile(this, "pickup.wav");
  Heal = new SoundFile(this, "hil.wav");
  Hit = new SoundFile(this, "Aie.wav");
  Levelup = new SoundFile(this, "Levelup.mp3");
  Warning = new SoundFile(this, "warning.wav");
  Background =new SoundFile(this, "ambiance2.mp3");
  Background.play();

  sprite2 = loadImage("Sprite 2.png");
  cristal = loadImage("cristal.png");
  boulerouge = loadImage("boulerouge.png");
  grosseboule = loadImage ("grosseboule.png");
  cross = loadImage("cross.png");
  sainteboule = loadImage("sainteboule.png");
  bk = loadImage("pq.png");


  imageMode(CENTER);//Les coordonnées des images correspondent à leur centre
}

void draw() {
  background(255);
  image(bk, width/2, height/2, width,height);

  ball.display();//Déclaration des fonctions de la boule
  ball.mouv();



  if (malus==true) {//L'effet du malus dure 800 frame
    if (frameCount%800 == 0) {
      malus = false;
    }
  }



  if (frameCount%70 == 0) {//Yolo aparait toute les 70 frames à un point aléatoire
    for (int i=0; i<1; i++) {
      yolo.add(new Yolo(random(width), random(height)));
    }
  }

  for (int i=0; i<yolo.size(); i++) {
    Yolo y = yolo.get(i);
    y.disp();//Déclaration des fonctions de yolo
    y.rand();
    y.wrap();

    float d = dist ( ball.xpos, ball.ypos, y.x, y.y);//Si yolo est touché il disparait et le score augmente de 1
    if (d<70) {
      yolo.remove(i);
      cash.play();
      score = score + 1;
    }
  }

  if (frameCount%90 == 0) {//Les ennemis apparaissent toute les 90 frames à un point aléatoire
    for (int ie=0; ie<1; ie++) {
      foe.add(new Enemi(random(width), random(height)));
    }
  }

  for (int ie=0; ie<foe.size(); ie++) {
    Enemi ye = foe.get(ie);
    ye.dispe();//Déclaration des fonctions des ennemis
    ye.rande();
    ye.wrape();

    float de = dist ( ball.xpos, ball.ypos, ye.xe, ye.ye);
    //En cas de contact ennemi disparait et enlève une vie
    if (de<70) {
      foe.remove(ie);
      Hit.play();
      life = life -1 ;
    }
  }
  if (level>1) { //{À partir du niveau deux "Heal" apparait toute les 750 frame à un point aléatoire
    if (frameCount%750 == 0) {
      for (int ih=0; ih<1; ih++) {
        heal.add(new Heal(random(width), random(height)));
      }
    }

    for (int ih=0; ih<heal.size(); ih++) {
      Heal yh = heal.get(ih);
      yh.disph();//Déclaration des fonctions de heal
      yh.randh();
      yh.wraph();

      float dh= dist ( ball.xpos, ball.ypos, yh.xh, yh.yh);//En cas de contact avec le joueur, Heal disparait et la vie est restaurée 
      if (dh<70) {
        heal.remove(ih);
        Heal.play();
        life = 6;
      }
    }
  }
  if (level>2) {//À partir du niveau 3 les "gros calibre" apparaissent à un endroit aléatoire toute les 800 frames
    if (frameCount%800 == 0) {
      for (int ig=0; ig<1; ig++) {
        gc.add(new Gc(random(width), random(height)));
      }
    }

    for (int ig=0; ig<gc.size(); ig++) {
      Gc yg = gc.get(ig);
      yg.dispg();//Déclaration des fonctions de gros calibre
      yg.randg();
      yg.wrapg();

      float dg = dist ( ball.xpos, ball.ypos, yg.xg, yg.yg);//En cas de contact les "gros calibre" enlèvent une vie disparaissent et activent un malus qui augmente la taille des ennemis
      if (dg<70) {
        gc.remove(ig);
        Hit.play();
        Warning.play();
        life=life-1;
        malus = true;
      }
    }
  }

  if (level==5) {//Apparition de "Tête Chercheuse" au niveau 5
    tc.add(new TC(random(width), random(height)));
    TC Y = tc.get(0);
    Y.displayt();//Déclaration de la fonction de tête chercheuse
    float dt = dist ( ball.xpos, ball.ypos, Y.X, Y.Y);//Si "tête chercheuse" touche le joueur il enlève deux vies et ne disparait pas
    if (dt<170 && ball.hit == true) {//Activation du boolean hit si tête chercheuse touche la boule, la vie ne pourra plus descendre pendant soixante frames 
      life =life-2;
      Hit.play();
      ball.hit=false;
    }

    if (score==40) {//écran de victoire

      foe.clear();
      yolo.clear();
      heal.clear();
      gc.clear();
      textSize(100);
      fill(250, 5, 5);
      text("YOU WIN", 500, 300);
    }
  }
  if (life<1) {//écran de "Game over"

    textSize(100);
    fill(250, 5, 5);
    text("GAME OVER", width/5 + 130, height/3 );
    textSize(50);
    fill(250, 5, 5);
    text("Try again ?", width/2- 100, height/2 );
    foe.clear();//Tout les objets disparaissent
    yolo.clear();
    heal.clear();
    gc.clear();

    if (mousePressed) {//Aprés le Game Over le jeu recommence aprés un clic
      life = 6; 
      level = 1;
      score = 0;
      scoremax=10;
    }
  }

  if (score<40) {
    if (score==scoremax) {//Passage au niveau superieur, tout les objets dissparaissent sauf le joueur
      if (score!=50) {
        foe.clear();
        yolo.clear();
        heal.clear();
        gc.clear();
        level = level+1;
        Levelup.play();
      }
      score = 0;//Le score est remis à zero
      if (level<4) {//Le score maximum à atteindre augmente de 10 à chaque nouveau niveau jusqu'au troisième niveau
        scoremax = scoremax + 10;
      }
      if (level>3) {
        scoremax=scoremax+5;//À partir de la fin du niveau 3 le score maximum à atteindre pour gagner augmente de 5 par niveau
      }
      if (level<3) {//La vitesse des ennemis augmente au niveau 2
        Epoprate = Epoprate + 1;
      }
      if (level>2 && level<5) {//Les gros calibre Gagnent en vitesse du niveau 3 à 4
        Eporateg=Eporateg+1;
      }
    }
  }










  textSize(40);//Affichage du score
  fill (0, 0, 0);
  text("Score" +score+"/"+scoremax, 50, 100);
  textAlign(RIGHT, TOP);

  textSize(40);//Affichage des vies
  fill (0, 0, 0);
  text("Life" +life+"/6", 185, 30);
  textAlign(LEFT, TOP);

  textSize(60);//Affichage des niveaux
  fill (255, 8, 8);
  text("Level "+ level, 30, height-80);
}
