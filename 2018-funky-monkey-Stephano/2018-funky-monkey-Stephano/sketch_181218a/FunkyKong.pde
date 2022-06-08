class FunkyKong extends Rectangle {
  PImage monkeyImg; 
  float speed;
  int flife;
  
  FunkyKong(float x,float y,float w,float h, float speed, PImage monkeyImg) {
    super(x, y, w, h);
    this.speed = speed;
    this.monkeyImg = monkeyImg;
  }

void update(){
  y+=speed; //Moves car to the right
  if(speed > 0 && y>height){ //If car goes off screen on right side
    y=-h;
  }else if(speed <0 && y < -h) {
    x = width;
  }
  
}

  void show() {
    image(monkeyImg, x, y, w, h);
  }
}
