/*
ToDo :
 - Sort the caracters based on their score
 - The size of the buble depend on the score or on the nb of connection

For 

*/
//Initialisation de fonction global
//Size window
final int windowX = 1000;
final int windowY = 700;
//Size button
final int buttonWidth = 150;
final int buttonHeight = 40;

Balls balls;
int colorBackground[] = {255,255,255};


void setup() {
  Table table = loadTable("GOT.csv", "header");
  balls = new Balls(table);
  size(windowX, windowY);
  background(colorBackground[0],colorBackground[1],colorBackground[2]);
  displayButtons();

  balls.createBalls();

}

void draw(){
  background(colorBackground[0],colorBackground[1],colorBackground[2]);
  displayButtons();
  balls.updateBalls();
  balls.link();
}

void mousePressed(){
  balls.checkClickBall();
}

void mouseReleased(){
  balls.releaseBalls();
}
