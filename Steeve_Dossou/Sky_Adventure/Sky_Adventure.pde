  //Variables
Player ball;
int level = 1;
int score;
int nextWait = 60;
int fadeIn;
int lifePoints = 5;
int fuel = 100;
public boolean pause = false;

public boolean bonus = false;

boolean stopSound = false;
boolean skip = false;

//Array Lists
ArrayList<Popper> pointList = new ArrayList<Popper>();
ArrayList<Popper> enemyList = new ArrayList<Popper>();
ArrayList<Popper> bonusList = new ArrayList<Popper>();
ArrayList<ExplosionFx> expFxList = new ArrayList<ExplosionFx>();
ArrayList<TrailFx> trailFxList = new ArrayList<TrailFx>();
ArrayList<Level> levels = new ArrayList<Level>();
ArrayList<Gun> bullets = new ArrayList<Gun>();

Level thisLevel;
int currentLevel;



PImage parallax1;
PImage parallax2;
PImage parallax3;
PImage parallax4;
PImage parallax5;
PImage parallax6;
PImage parallax7;
PImage parallax8;
PImage parallax9;
PImage parallax10;
PImage parallax11;
PImage parallax12;
PImage parallax13;
PImage parallax14;
PImage parallax15;
PImage parallax16;
PImage parallax17;
PImage parallax18;
PImage parallax19;
PImage parallax20;
PImage parallax21;
PImage parallax22;
PImage parallax23;
PImage parallax24;
PImage parallax25;
PImage parallax26;
PImage parallax27;
PImage parallax28;
PImage parallax29;
PImage parallax30;

int imageIndex;

int imageSpeed = 4;

//Create a sound file
Minim minim;
import ddf.minim.*;
import processing.sound.*;
AudioPlayer pickupSound;
AudioPlayer hurtSound;
AudioPlayer destroySound;
AudioPlayer bonusSound;
AudioPlayer gunSound;

AudioPlayer nextLevelSound;
AudioPlayer gameOverSound;

AudioPlayer musicSound;

//Create the sprites
PImage bomb;
PImage energy;
PImage bonuss;
PImage menu;

import processing.video.*;
Movie parallaxBack;

//Create Event
void setup(){
  //Set the screen's size and background
  fullScreen(P2D);
  
  background(0);
  //Create a ball instance
  ball = new Player();
 
  //Create the levels
  levels.add(new Level(10, 10, 280, 10));
  thisLevel = levels.get(currentLevel);
  levels.add(new Level(30, 100, 300, 10));
  levels.add(new Level(40, 90, 420, 20));
  levels.add(new Level(50, 80, 540, 40));
  levels.add(new Level(60, 70, 600, 80));
  levels.add(new Level(70, 60, 720, 120));
  levels.add(new Level(80, 50, 840, 180));
  levels.add(new Level(90, 40, 960, 240));
  levels.add(new Level(100, 30, 1080, 300));
  levels.add(new Level(110, 20, 1200, 340));
  levels.add(new Level(120, 10, 1200, 400));
  levels.add(new Level(10, 10, 10, 10));
  
  //Create the sound files
  minim = new Minim(this);
  pickupSound = minim.loadFile("data/music/Pickup.wav");
  pickupSound.setGain(10);
  hurtSound = minim.loadFile("data/music/Hit.wav");
  hurtSound.setGain(10);
  destroySound = minim.loadFile("data/music/Explosion.wav");
  nextLevelSound = minim.loadFile("data/music/Blip_Select2.wav");
  gameOverSound = minim.loadFile("data/music/Blip_Select3.wav");
  bonusSound = minim.loadFile("data/music/Gun_shot_good.wav");
  gunSound = minim.loadFile("data/music/Gun_shot.wav");
  musicSound = minim.loadFile("data/music/Undying Bravery MONO.wav");
  musicSound.play();
  
  //Create the sprites
  imageMode(CENTER);
    bomb = loadImage("data/images/enemy.png");
    energy = loadImage("data/images/energy.png");
    bonuss = loadImage("data/images/bonus.png");
    menu = loadImage("data/images/mainMenu x2.png");
    
  parallax1 = loadImage("data/parallax/background1.png");
  parallax2 = loadImage("data/parallax/background2.png");
  parallax3 = loadImage("data/parallax/background3.png");
  parallax4 = loadImage("data/parallax/background4.png");
  parallax5 = loadImage("data/parallax/background5.png");
  parallax6 = loadImage("data/parallax/background6.png");
  parallax7 = loadImage("data/parallax/background7.png");
  parallax8 = loadImage("data/parallax/background8.png");
  parallax9 = loadImage("data/parallax/background9.png");
  parallax10 = loadImage("data/parallax/background10.png");
  parallax11 = loadImage("data/parallax/background11.png");
  parallax12 = loadImage("data/parallax/background12.png");
  parallax13 = loadImage("data/parallax/background13.png");
  parallax14 = loadImage("data/parallax/background14.png");
  parallax15 = loadImage("data/parallax/background15.png");
  parallax16 = loadImage("data/parallax/background16.png");
  parallax17 = loadImage("data/parallax/background17.png");
  parallax18 = loadImage("data/parallax/background18.png");
  parallax19 = loadImage("data/parallax/background19.png");
  parallax20 = loadImage("data/parallax/background20.png");
  parallax21 = loadImage("data/parallax/background21.png");
  parallax22 = loadImage("data/parallax/background22.png");
  parallax23 = loadImage("data/parallax/background23.png");
  parallax24 = loadImage("data/parallax/background24.png");
  parallax25 = loadImage("data/parallax/background25.png");
  parallax26 = loadImage("data/parallax/background26.png");
  parallax27 = loadImage("data/parallax/background27.png");
  parallax28 = loadImage("data/parallax/background28.png");
  parallax29 = loadImage("data/parallax/background29.png");
  parallax30 = loadImage("data/parallax/background30.png");
}

//Step Event
void draw(){
  if (frameCount % imageSpeed == 0) {imageIndex++;}
  if (imageIndex > 30) {imageIndex = 1;}
  
  tint(255,255,255);
  if (imageIndex == 1) {image(parallax1, width/2, height/2, width, height);}
  if (imageIndex == 2) {image(parallax2, width/2, height/2, width, height);}
  if (imageIndex == 3) {image(parallax3, width/2, height/2, width, height);}
  if (imageIndex == 4) {image(parallax4, width/2, height/2, width, height);}
  if (imageIndex == 5) {image(parallax5, width/2, height/2, width, height);}
  if (imageIndex == 6) {image(parallax6, width/2, height/2, width, height);}
  if (imageIndex == 7) {image(parallax7, width/2, height/2, width, height);}
  if (imageIndex == 8) {image(parallax8, width/2, height/2, width, height);}
  if (imageIndex == 9) {image(parallax9, width/2, height/2, width, height);}
  if (imageIndex == 10) {image(parallax10, width/2, height/2, width, height);}
  if (imageIndex == 11) {image(parallax11, width/2, height/2, width, height);}
  if (imageIndex == 12) {image(parallax12, width/2, height/2, width, height);}
  if (imageIndex == 13) {image(parallax13, width/2, height/2, width, height);}
  if (imageIndex == 14) {image(parallax14, width/2, height/2, width, height);}
  if (imageIndex == 15) {image(parallax15, width/2, height/2, width, height);}
  if (imageIndex == 16) {image(parallax16, width/2, height/2, width, height);}
  if (imageIndex == 17) {image(parallax17, width/2, height/2, width, height);}
  if (imageIndex == 18) {image(parallax18, width/2, height/2, width, height);}
  if (imageIndex == 19) {image(parallax19, width/2, height/2, width, height);}
  if (imageIndex == 20) {image(parallax20, width/2, height/2, width, height);}
  if (imageIndex == 21) {image(parallax21, width/2, height/2, width, height);}
  if (imageIndex == 22) {image(parallax22, width/2, height/2, width, height);}
  if (imageIndex == 23) {image(parallax23, width/2, height/2, width, height);}
  if (imageIndex == 24) {image(parallax24, width/2, height/2, width, height);}
  if (imageIndex == 25) {image(parallax25, width/2, height/2, width, height);}
  if (imageIndex == 26) {image(parallax26, width/2, height/2, width, height);}
  if (imageIndex == 27) {image(parallax27, width/2, height/2, width, height);}
  if (imageIndex == 28) {image(parallax28, width/2, height/2, width, height);}
  if (imageIndex == 29) {image(parallax29, width/2, height/2, width, height);}
  if (imageIndex == 30) {image(parallax30, width/2, height/2, width, height);}

  if (!musicSound.isPlaying()){musicSound.loop();}
  
  
  //Deplete the Fuel procedurally
    if (fuel >= 0 && frameCount% 25 == 0 && pause == false) {fuel--;}
  if (fuel >= 100) {fuel = 100;}
  
  //Create points procedurally
  if (frameCount % thisLevel.pointPopRate == 0 && pause == false){
    for (int i = 0; i == 0; i++){
      pointList.add(new Popper(
        width, 
        random(60, height - 60), 
        random((4 + currentLevel), 10 + currentLevel), 
        100,
        random(100, 250),
        energy
        
        ));
    }
  }
  
  //Create bonuses preocedurally
  if (currentLevel >= 2 && frameCount % thisLevel.bonusPopRate == 0 && pause == false){
    for (int i = 0; i == 0; i++){
      bonusList.add(new Popper(width, random(60, height - 60), random(4 + currentLevel, 10 + currentLevel), 90, random(150, 255), bonuss));
    }
  }
  
  //Create enemies procedurally
  if (frameCount % thisLevel.enemyPopRate == 0 && pause == false){
    for (int i = 0; i <= random(2); i++){
      enemyList.add(new Popper(
        width, 
        random(60, height - 60), 
        random(5 + currentLevel, 10 + currentLevel), 
        random(110 + (currentLevel * 2), 180 + (currentLevel * 2)),
        random(150, 255),
        bomb
        )); //<>//
    }
  }
  //Function of the trail effect
  for (int i = 0; i < trailFxList.size(); i++){
   TrailFx trail =  trailFxList.get(i);
   
   trail.display();
   if (trail.expFade <= 0) {trailFxList.remove(i);}
  }
  
  //Functions of points
  for (int i = 0; i < pointList.size(); i++){
    Popper points = pointList.get(i);      //Get the number of each enemy and initialize the class
    
    //Give the enemies their functions from the class
     points.display();
     points.move();
     
     if (frameCount % 2 == 0) {
      trailFxList.add(new TrailFx(points.aiX, points.aiY, 0, 100, 36, 62, 176));
    }
     
     //Delete the object when out of room
     if (points.aiX <= 0) {pointList.remove(i);}
     
     //Destroy the enemies when the player touches them
     float d = dist(ball.ballX, ball.ballY, points.aiX, points.aiY);
     if (d < 95 && lifePoints > 0) {
       pointList.remove(i); 
       score += currentLevel; 
       fuel += currentLevel/2; 
       pickupSound.play(); pickupSound.rewind();
       expFxList.add(new ExplosionFx(ball.ballX + 20, ball.ballY + 15, random(80, 130), 100, 100, random(155, 255)));
     }
  }
  
  //Functions of bonuses
  for (int i = 0; i < bonusList.size(); i++){
    Popper bonus = bonusList.get(i);      //Get the number of each enemy and initialize the class
    
    //Give the enemies their functions from the class
     bonus.display();
     bonus.move();
     
     if (frameCount % 1 == 0) {
      trailFxList.add(new TrailFx(bonus.aiX, bonus.aiY, 0, 90, 166, 38, 173));
    }
     
     //Delete the object when out of room
     if (bonus.aiX <= 0) {bonusList.remove(i);}
     
     //Destroy the enemies when the player touches them
     float d = dist(ball.ballX, ball.ballY, bonus.aiX, bonus.aiY);
     if (d < 85 && lifePoints > 0){
       bonusList.remove(i); 
       bonusSound.play(); bonusSound.rewind(); 
       expFxList.add(new ExplosionFx(ball.ballX + 20, ball.ballY + 15, random(60, 110),random(200, 255), 100, random(200, 255)));
       ball.bonus = true;
     }
  }
  
  //Functions of enemies
  for (int i = 0; i < enemyList.size(); i++){
    Popper enemies = enemyList.get(i);      //Get the number of each enemy and initialize the class
    
    //Give the enemies their functions from the class
     enemies.display();
     enemies.move();
     
     
      trailFxList.add(new TrailFx(enemies.aiX + (enemies.aiSize - (enemies.aiSize/1.4)), enemies.aiY, 5, enemies.aiSize / 5, 255, 61, 0));
    
     
     //Delete the object when out of room
     if (enemies.aiX <= 0) {enemyList.remove(i);}
     
     //Destroy the enemies when the player touches them
     float d = dist(ball.ballX, ball.ballY, enemies.aiX, enemies.aiY);
     if (d < (enemies.aiSize - (enemies.aiSize/2.5)) && ball.hurtAble == true && lifePoints > 0){
       enemyList.remove(i); 
       lifePoints--; 
       hurtSound.play(); hurtSound.rewind();
       ball.hurtAble = false; 
       
       //Create an effect
       expFxList.add(new ExplosionFx(random(ball.ballX - 30, ball.ballX + 30), random(ball.ballY - 10, ball.ballY + 10), random(80, 120),random(200, 255), random(200, 255), 50));
     }
  }
  //Move the player
  if (currentLevel > 0){
    ball.display();
    ball.move();
    if (frameCount % 2 == 0) {
      trailFxList.add(new TrailFx(ball.ballX - 80, ball.ballY - 20, -5, 30, 20, 80, random(155, 255)));
    }
  }
  if (ball.bonus) {
    if (frameCount % 20 == 0){
      gunSound.play(); gunSound.rewind();
      expFxList.add(new ExplosionFx(ball.ballX + 80, random(ball.ballY + 24, ball.ballY + 26), random(30, 50),random(200, 255), 100, random(200, 255)));
      bullets.add(new Gun(ball.ballX + 100, ball.ballY + 25, 15)); 
    }
  }
  
  if (lifePoints <= 0 || fuel <= 0){
    if (ball.ballY <= height + 40){
      if (frameCount % 15 == 0){
        destroySound.play(); destroySound.rewind();
        for (int i = 0; i < 10; i++){
          expFxList.add(new ExplosionFx(random(ball.ballX - 30, ball.ballX + 30), random(ball.ballY - 10, ball.ballY + 10), random(30, 100),random(200, 255), random(200, 255), 50)); 
        }
      }
    }
  }
  
  //Function of the explosion effect
  for (int i = 0; i < expFxList.size(); i++){
   ExplosionFx exp =  expFxList.get(i);
   
   exp.display();
   if (exp.expFade <= 0) {expFxList.remove(i);}
  }
  
  //Function of the bullets
  for (int i = 0; i < bullets.size(); i++){
   Gun bullet =  bullets.get(i);
   
   bullet.display();
   bullet.move();
   
   if (frameCount % 1 == 0) {
      trailFxList.add(new TrailFx(bullet.bulletX, bullet.bulletY, 0, 35, 173, 43, 255));
    }
   for (int j = 0; j < enemyList.size(); j++){
     Popper enemies = enemyList.get(j);
     
     float d = dist(bullet.bulletX, bullet.bulletY, enemies.aiX, enemies.aiY);
     if (d < enemies.aiSize - (enemies.aiSize/2)) {
       bullets.remove(i); enemyList.remove(j); 
       destroySound.play(); destroySound.rewind();
       expFxList.add(new ExplosionFx(random(enemies.aiX - 50, enemies.aiX + 50), random(enemies.aiY - 50, enemies.aiY + 50), random(80, 120),random(200, 255), random(200, 255), 50));
     }
   }
  }
  
  
  //Display the level and score on the screen
  if (currentLevel > 0){
  fill(255);
  textAlign(TOP, LEFT);
  textSize(32);
  text("Score :" + score + " / " + thisLevel.goal, 8, 32);
  text("Level :" + currentLevel, 8, 72);
  text("Life Points :" + lifePoints, width - 208, 32);
  text("Fuel :" + fuel + " %", width - 185, 72);
  if (ball.bonus == true){
    fill(255, 100, 255);
    text("GUN BONUS", 150, 72);
  }
  }
  //Go to the next level and change the goal
  if (score >= thisLevel.goal){
    
    
    //Stop the spawning of the balls
    pause = true;
    enemyList.clear();
    pointList.clear();
    bonusList.clear();
    ball.bonus = false;
    ball.bonusTime = 300;
    
    //Fade the screen
    if (nextWait == 60) {fadeIn += 5;}
    if (fadeIn >= 255) {nextWait--;}
    if (nextWait <= 0 && fadeIn > 0) {fadeIn -= 10;}
    
    fill(150, 150, 255, fadeIn);
    noStroke();
    rect(0, height/2 - 100, width, height/2 - 50);
    
    //Write Good job and Next level
    fill(255); textAlign(CENTER); textSize(60);
    text("GOOD JOB!", width/2, height/2);
    
    fill(20, 20, 240); textAlign(CENTER); textSize(30);
    text("NEXT LEVEL", width/2, (height/2) + 100);
    
    //Reset the Score, update the level and the goal
    if (fadeIn <= 0 && nextWait <= 0){
      score = 0;
      lifePoints = 5;
      fuel = 100;
      currentLevel ++;
      thisLevel = levels.get(currentLevel);
      pause = false;
      nextWait = 60;
    }
  }
  
  //Game Over Screen
  if ( currentLevel > 0 && ball.ballY > height + 50){
    pause = true;
    enemyList.clear();
    pointList.clear();
    bonusList.clear();
    
    if (stopSound == false) {gameOverSound.play(); gameOverSound.rewind();}
    if (gameOverSound.isPlaying()) {stopSound = true;}
    
    
   //Fade the screen
    if (nextWait == 60 && fadeIn < 180) {fadeIn += 10;}
    if (nextWait <= 0 && fadeIn > 0) {fadeIn -= 10;}
    
    if (fadeIn >= 180){
      if (mousePressed){
        nextWait = 60;
        fadeIn = 0;
        lifePoints = 5;
        fuel = 100;
        score = 0;
        currentLevel = 0;
        thisLevel = levels.get(currentLevel);
        pause = false;
        stopSound = false;
        ball.bonus = false;
        ball.bonusTime = 300;
      }
    }
    
    
    fill(255, 50, 50, fadeIn);
    noStroke();
    rect(0, height/2 - 100, width, height/2 - 50);
    
    //Write Good job and Next level
    fill(255); textAlign(CENTER); textSize(60);
    text("GAME OVER!", width/2, height/2);
    
    fill(240, 20, 20); textAlign(CENTER); textSize(30);
    text("CLICK TO GO TO THE MAIN MENU", width/2, (height/2) + 100);
  }
  
  //Victory Screen
  if (currentLevel >= levels.size() - 1){
    pause = true;
    enemyList.clear();
    pointList.clear();
    bonusList.clear();
    
    
   //Fade the screen
    if (nextWait == 60 && fadeIn < 180) {fadeIn += 10;}
    if (nextWait <= 0 && fadeIn > 0) {fadeIn -= 10;}
    
    if (fadeIn >= 180){
      if (mousePressed){
        nextWait = 60;
        fadeIn = 0;
        lifePoints = 5;
        fuel = 100;
        score = 0;
        currentLevel = 0;
        thisLevel = levels.get(currentLevel);
        pause = false;
        ball.bonus = false;
        ball.bonusTime = 300;
      }
    }
    
    
    fill(20, 50, 255, fadeIn);
    noStroke();
    rect(0, 0, width, height);
    
    //Write Good job and Next level
    fill(255); textAlign(CENTER); textSize(100);
    text("YOU WON!", width/2, height/2);
    
    fill(20, 20, 255); textAlign(CENTER); textSize(50);
    text("CLICK TO RESTART", width/2, (height/2) + 100);
  }
    
    //Main Menu Screen
    if (currentLevel <= 0){
      musicSound.setGain(5);
      pause = true;
      enemyList.clear();
      pointList.clear();
      bonusList.clear();
      
      if (frameCount % 60 == 0) {skip = true;}
      if (skip){
        if (mousePressed){
          musicSound.setGain(1);
          nextLevelSound.play(); nextLevelSound.rewind();
          nextWait = 60;
          fadeIn = 0;
          lifePoints = 5;
          fuel = 100;
          score = 0;
          currentLevel++;
          thisLevel = levels.get(currentLevel);
          pause = false;
          skip = false;
          ball.bonus = false;
          ball.bonusTime = 300;
        }
      }
    
      //Write Good job and Next level
      image(menu, width/2, height/2);
    
      fill(137, 87, 0); textAlign(CENTER); textSize(50);
      text("CLICK TO START", width/2, (height/2) + 200);
  }
}

//Create the trail
  void trail(int Val){
    fill(0, 0, 0, Val);
    noStroke();
    rect(0, 0, width, height);
  }
