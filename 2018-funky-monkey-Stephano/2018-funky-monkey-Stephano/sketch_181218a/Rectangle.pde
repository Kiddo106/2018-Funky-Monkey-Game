class Rectangle
{
  float x; // X cordinate
  float y; //Y cordinate
  float w; // Width of Rectangle
  float h; //Height of Rectangle

  Rectangle () //Defines Rectangle to zero if nothing has been defined
  {
    this.x = 0;
    this.y = 0;
    this.w = 0;
    this.h = 0;
  }

  //Object with 4 defined int's is made here and if an interger is lower then 0 then it will set int as 0
  Rectangle (float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  //Instance Method That Returns true if current calling rectangle
  // intersects another rectangle
  boolean intersects(Rectangle other) {
    float left = this.x;
    float right = this.x + this.w;
    float top = this.y;
    float bottom = this.y+this.h;

    float oleft = other.x;
    float oright = other.x + other.w;
    float otop = other.y;
    float obottom = other.y+other.h;

    return !(left >= oright ||
      right <= oleft ||
      top >= obottom ||
      bottom <= otop); // Returns true when they intersect
  }
}
