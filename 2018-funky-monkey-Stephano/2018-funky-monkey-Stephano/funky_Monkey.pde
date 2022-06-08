/*
inherits the hp class
inherits rectangle class
image variable is declared
speed variable is declared



funky_Monkey constructor method taking 6 parameters
(int x,int y,int w,int h, int speed, PImage monkeyImg)
super(x, y, w, h);
    this.speed = speed;
    this.funky_Monkey Img = funky_MonkeyImg;
    
    update method
    determines how the funky monkey will move
    This is the first boss so it would move at random without AI predictions and stuffs
    if the character goes off screen then move left or right
    depending on which side of the screen.
    Same thing with up or down

    show method
    shows the character's image
        its sound affects are here
    its speech bubbles are here too

    ability method
    Each ability will be labled from 1-3
    the program picks a random number between 1-3 every 10 seconds or so
    if the program picks a number then use the picked ability
*/
