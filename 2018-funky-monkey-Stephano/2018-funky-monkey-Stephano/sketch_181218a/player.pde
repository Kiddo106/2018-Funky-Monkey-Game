class player extends Rectangle{
//PImage img;
float accelY, accelX, speedLimit, vx, vy;

//Global variables
float friction, gravity, bounce;
boolean onGround;
float jumpForce;
float halfWidth, halfHeight;
String collisionSide;
int life;

//Variables for animation
int currentFrame;
boolean facingRight;
int frameSeq;
int frameOffSet;

player(float x,float y,float w,float h){
super(430, 100, 0, 0);
accelY = 0;
accelX = 0;
this.w = 0;
this.h = 20;
this.x = 430;
this.y = 100;
speedLimit = 5;
onGround = false;
jumpForce = -15;
vx = 0;
vy = 0;
//Global values
friction = 0.96;
gravity = 0.3;
bounce = -0.7;
collisionSide = "";
halfWidth = w/2;
halfHeight = h/2;
currentFrame = 0;
facingRight = true;
frameSeq = 3;
frameOffSet = 0;
}

void update(){
  //acceleration/movement speed
if (left && !right){
accelX = -0.2;
friction = 1;
facingRight = false;
}
if (right && !left){
accelX = 0.2;
friction = 1;
facingRight = true;
}
if (!right && !left){
accelX = 0;
}
if (up && !down && onGround){
vy = jumpForce;
onGround = false;
friction = 1;
}
if (down){
accelY = 0.3;

}

//reintroduces Friction
if(!up && !down && !left && !right){
friction = 0.9;

}

vx += accelX;
vy += accelY;

vx *= friction;


//Makes gravity happen
vy += gravity;

//Corrects the maximum speed for the player.
if (vx > speedLimit){
vx = speedLimit;
}
if(vx < -speedLimit){
 vx = -speedLimit;
}

if(vy > 3 * speedLimit){
vy = 3 *speedLimit;
}



//minimum
if (abs(vx) < 0.2){
vx = 0;
}
//Finally moves the player
x+= vx;
y+= vy;

checkBoundries();

}
void checkBoundries(){

  //left
if ( x < 0){
  vx *= bounce;
x = 0;

}
//right
if (x + w > width){
  vx *=bounce;
x = width - w;
}


//top
if (y< 0){
  vy *=bounce;
y = 0;
}

//bottom
if (y + h > height ){
  if (vy < 1){
  onGround = true;
  vy = 0;
  }
  else{
  vy *= bounce/5;
  }
 
y = height - h;

}


}

void display(){
  //  image(img,x,y,w,w);
   fill(0,255, 0, 128); // testing
   rect(x,y,w,h); //testing
   
   if (facingRight){
   if (abs(vx) > 0){
   image(spriteImages[currentFrame + 0 ], x- 27, y -27); //moving to the right
   }
   else{
   image(spriteImages[currentFrame = 0], x- 27, y -27);//standing still facing right
   }
   }
else{
  //moving or walking to the left
if (abs(vx) > 0){
image(spriteImages[currentFrame + 3], x-10,y-27); //moving  to the left
}
else{
image(spriteImages[currentFrame = 3 ], x-10,y-27); //standing still facing left
}
}
if (onGround){
currentFrame= (currentFrame+1)% frameSeq;

}
else{
currentFrame = 0;
}
  }
  
}
