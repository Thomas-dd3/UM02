import java.util.Arrays;
import java.util.List;

//Initialisation de fonction global
//Size button
final int buttonWidth = 130;
final int buttonHeight = 50;

Balls balls;
ButtonsFamily buttonsFamily;
int colorBackground[] = {255,255,255};
color disable = #d0d0d0;
String nameAllFamily[] = {"Lannister","Targaryen","Stark","Baratheon","Tyrell","Martell"};
List<String> listAllFamily = Arrays.asList(nameAllFamily);


void setup() {
  Table table = loadTable("GOT.csv", "header");
  balls = new Balls(table);
  buttonsFamily = new ButtonsFamily();
  size(1000, 700);
  background(colorBackground[0],colorBackground[1],colorBackground[2]);

  balls.createBalls();

}

void draw(){
  background(colorBackground[0],colorBackground[1],colorBackground[2]);
  balls.updateBalls();
  //balls.link();
  buttonsFamily.display();
  if ( buttonsFamily.checkHoverButton() ){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
  
  //displayLegend();
}

void mouseClicked(){
  buttonsFamily.checkClickButton();
}

void mousePressed(){
  balls.checkClickBall();
}

void mouseReleased(){
  balls.releaseBalls();
}
