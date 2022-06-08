/*
MonkeyFighterZ
Stephano Ghdaye
ICS4U
December 17, 2018
*/
//Imports
import ddf.minim.*;

//Variables/Arrays
PImage monkeyImg, FloorImg, player0, sun, menu, banana, gameOver, uavImg, lebronImg;
PFont title ;
Floor flr1;
Sun sun1;
Bullet b;
UAV uaV;
Lebronto LB;;
BananaB bB;
FunkyKong f;
boolean left, right, up, down, space;
player p;
PImage [] spriteImages;
int frames, stage, time, points;
rain[] Rain = new rain[50];
//variabels for audio
Minim minim;
AudioPlayer music; 
AudioPlayer musicGame;

void setup(){
  stage = 1;
  points = 0;
  time = millis();
size(1000,600);

menu = loadImage("Mmenu.png");
image(menu,0,0, width, height);
title = createFont("font",1000,true);



for (int i = 0; i < Rain.length; i++ ){
Rain[i] = new rain();
}
//Sounds
minim = new Minim(this);

//Audio player objects
music = minim.loadFile("Jojo.mp3");
music.play(0);

//do{

 //  music = minim.loadFile("Calm.mp3");
 //  music.play(0);


//}while (stage ==2);

//Just in case HAHA pun intended 
left = false;
right = false;
up = false;
down = false;
space = false;

lebronImg = loadImage("LebrontoT.png");
uavImg = loadImage("UaV.png");
banana = loadImage("Banana.png");
sun = loadImage("bbe.png");
monkeyImg = loadImage("17071.png");
FloorImg = loadImage("FloorImg.png");
LB = new Lebronto(width/2, 0, 400, 400,20, lebronImg);
flr1 = new Floor(FloorImg);
sun1 = new Sun(sun);
bB = new BananaB (0,550,50, 50,15, banana);
uaV = new UAV(0,550,50, 50,38, uavImg);
f = new FunkyKong(620,0,400, 400,10, monkeyImg);
b = new Bullet();
p = new player(430, 100, 0,20);
//animation
frames = 6;
spriteImages = new PImage[frames];
for (int i = 0; i < frames;i++){
spriteImages[i] = loadImage("PL" +nf(i+1,4)+ ".png");
}
}



void draw(){
  //main menu screen
  if(stage == 1){
      p.life = 4;
      f.flife = 4;
      LB.LBLIFE = 4;
      uaV.UAVLife = 4;
  textAlign(CENTER);
  text("M0NKEY FIGHTERZ, IT'S IN THE GAME",width/2,height*0.9);
  text("Press any key to start this game yo!",width/2,height*0.99);
  if (keyPressed == true){
  stage =2;
  }
  }
  if (stage == 2){
   
background(66, 155, 244);
flr1.show();
sun1.show();

f.show();
f.update();
bB.show();
bB.update();
//Rain
for (int i = 0; i < Rain.length; i++){
Rain[i].fall();
Rain[i].show();
}


if( millis() < time + 10000){
    text("PRESS SPACE TO SHOOT", 70, 20);
    text("USE ARROW KEYS TO MOVE", 78, 35);
    text("GAME LEVEL 1", width/2, height/2);
  }
 
  text("POINTS: "+ points, width/2, height/3);
  text("LIVES: "+ p.life, width/2, height/4);
p.update();
p.display();

if (space){
float spriteRotation;
if (p.facingRight){
spriteRotation = 0;
}
else{
spriteRotation = PI;
}
b.startLocation(p.x,p.y, spriteRotation);
}
  b.update();
  b.display();
  fill(0);
  
  }
if (b.intersects(f)){
f.flife= f.flife - 1;
points = points + 100;
}
if (b.intersects(uaV)){
uaV.UAVLife= uaV.UAVLife - 1;
points = points + 300;
}

if (b.intersects(LB)){
LB.LBLIFE= LB.LBLIFE - 1;
points = points + 500;
}

if (uaV.UAVLife == 0){
uaV.y = 60000;
uaV.x = 348975;
fill(0);
text("GAME LEVEL 3", width/2, height/2);

LB.show();
LB.update();
}
if ( LB.LBLIFE == 0){
 LB.y = 60000;
 LB.x = 348975;
fill(0);
text("YOU WIN. YOU STOPPED LEBTRONFROM SWEEPING THE RAPTORS, SAVED THE UAV, AND DEFEATED FUNKY MONKEY", width/2, height/0.5);
}

if (f.flife == 0){
f.y = 60000;
f.x = 348975;
bB.x = 60000;
bB.y = 348975;
text("GAME LEVEL 2", width/2, height/2);
uaV.show();
uaV.update();
}

if (p.intersects(bB) || p.intersects(f) || p.intersects(bB) || p.intersects(uaV) || p.intersects(LB)){
p.life --;
}


if (p.life == 0){
resetGame();
}

}

void resetGame() {
  
  p = new player(430, 100, 0,20);
  background(255,0,0);  
  b.reset();
  

  textAlign(CENTER);
  
    gameOver = loadImage("GameOver.jpg");
  
  if (p.life <= 0){
    image(menu,0,0, width, height);
    text("Press any key to continue!",width/2,height*0.99);
   if (keyPressed == true){
  p.life = 4;
  uaV.UAVLife = 4;
  LB.LBLIFE = 4;
  f.flife = 4;
  stage = 1;
  }
  }
}


void keyPressed(){
switch (keyCode){
case 37: //left
left = true;
break;

case 39: //right
right = true;
break;

case 38: //up
up = true;
break;

case 40: //down
p.vy = 60;
break;

case 32: //right
space  = true;
break;
}
}

void keyReleased(){
switch (keyCode){
case 37: //left
left = false;
break;

case 39: //right
right = false;
break;

case 38: //up
up = false;
break;

case 40: //down
down = false;
break;

case 32: //right
space = false;
break;
}
}
