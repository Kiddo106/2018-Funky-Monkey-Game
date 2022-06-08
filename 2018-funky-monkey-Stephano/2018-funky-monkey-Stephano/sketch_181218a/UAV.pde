class UAV extends Rectangle {
PImage uavImg; 
  float speed;
  int UAVLife;
  UAV(float x,float y,float w,float h, float speed, PImage uavImg) {
    super(x, y, w, h);
    this.speed = speed;
    this.uavImg = uavImg;
  }

void update(){
  y+=speed; //Moves car to the right
  if(speed > 0 && y>height){ //If car goes off screen on the bottom
    y=-h;
  }else if(speed <0 && y < -h) {
    x = width;
  }
  
}

  void show() {
    image(uavImg, x, y, w, h);
  }
 
}
