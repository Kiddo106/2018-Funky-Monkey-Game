class Lebronto extends Rectangle{
  PImage lebronImg; 
  float speed;
  int LBLIFE;
  
  Lebronto(float x,float y,float w,float h, float speed, PImage lebronImg) {
    super(x, y, w, h);
    this.speed = speed;
    this.lebronImg = lebronImg;
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
    image(lebronImg, x, y, w, h);
  }


}
