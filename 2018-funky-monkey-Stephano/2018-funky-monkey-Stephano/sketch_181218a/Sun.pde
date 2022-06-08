class Sun extends Rectangle{
PImage  sun;

Sun(PImage sun){
super(700,0, width/3, 200);
this.sun = sun;
}


Sun(float x,float y,float w,float h, PImage sun){
super(x, y, w, h);
this.sun = sun;
}


void show(){
image(sun, x, y,w,h);
}
}
