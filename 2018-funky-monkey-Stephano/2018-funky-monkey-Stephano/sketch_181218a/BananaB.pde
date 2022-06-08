class BananaB extends FunkyKong{
 PImage banana;
 
 

  BananaB(float x,float y,float w,float h, float speed, PImage banana) {
super(x, y, w, h, speed, banana);

}
void update(){
  x+=speed; //Moves car to the right
  if(speed > 0 && x>width){ //If banana goes off screen on right side
    x=-w;
  }else if(speed <0 && x < -w) {
    x = width;
  }
  
}

}
