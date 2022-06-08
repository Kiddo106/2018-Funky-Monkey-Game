/*
variable to set the pixel size of every step or variable to set velocity
declaring variables for images
declare the main character object and other object array such as projectiles.


setup method
set the size of the canvas
import images from folder here
call on the reset game method here


resetGame method
when the user dies in the game a game over screen will show up.
Later the scoreboard will appear. 
Then the menu will pop up
Then reset character when the game starts again.

Draw method 
sets the colour of the background 
determines the sizes of the images
Call to the instance method inside the main_Character class
main_Character.show();
draws other objects
allow them to update their location and show on the screen.
Also sets dying condition here by checking if the main character intersects the projectiles and enemies.
resetGame(); is called if they do intersect.

keyPressed method
if the upkey is pressed then jump
if the down key is pressed then fall faster
if the right and left keys are pressed then move right and left respectively.

boolean winorLose
if defeated = true then go to the game over screen
else
you win screen

scoreboard method
shows the scoreboard
sorted alphabetically with a sorting method(bubble, quick sort, cocktail shaker, etc.)
if the user has high enough points then the user can be placed on the scoreboard and chose a name

gameover method
show game over screen
game over screen designs

menu method
show menu screen
game menu designs

Win method
show Win screen
game Win screen designs
*/
