class Floor extends Rectangle{
PImage  FloorImg;

Floor(PImage FloorImg){
super(-50, 500, width*2, 100);
this.FloorImg = FloorImg;
}


Floor(float x,float y,float w,float h, PImage FloorImg){
super(x, y, w, h);
this.FloorImg = FloorImg;
}


void show(){
image(FloorImg, x, y,w,h);
}
}
