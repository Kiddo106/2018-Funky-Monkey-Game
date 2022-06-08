class Bullet extends Rectangle{

float speed, rotation, maxSpeed, minSpeed;
boolean firing;


Bullet(){
super(100,-100,20,10);

speed = 0;
rotation = 0;
maxSpeed = 15 ;
minSpeed = 5 ;
firing = false;
}


void startLocation(float startX, float startY, float startRotation){
 if (firing == false){
 x = startX;
 y = startY;
 rotation = startRotation;
 firing = true;
 speed = 20;
 }
  
}
void update(){
if(firing == true){
if (speed > minSpeed){
speed -= 0.3;
}
  x += cos(rotation)* speed ;
  y += sin(rotation) * speed;
  
  //check for moving out of bounds
  if (x > width||x < 0||y > height||y < 0){
  reset();
  }
}

}

void reset(){
speed = 0;
firing = false;
y = -100;
}

void display(){
pushMatrix();
translate(x, y);
rotate(rotation);
fill(0,255,0);
rect(-w/2,-h/2, w, h);
popMatrix();

}
}
