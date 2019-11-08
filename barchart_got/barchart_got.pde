import java.util.List;
import java.util.Arrays;

int nbPerso = 35;
int colorBackground = 230;
int greyL = 191;
int blueL[] = {102,204,255};

//Size button
final int buttonWidth = 160;
final int buttonHeight = 50;
color disable = color(greyL); // #d0d0d0;
String nameAllFamily[] = {"Lannister","Targaryen","Stark","Baratheon","Tyrell","Martell"};
List<String> listAllFamily = Arrays.asList(nameAllFamily);

Table table;
GraphCharacters graphCharacters;
ManageNbPerso manageNbPerso;
ButtonsFamily buttonsFamily;

void setup() {
  size(1200, 800);
  //fullScreen();
  background(colorBackground);
  
  table = loadTable("GOT.csv", "header");
  table.sortReverse("score");
  
  graphCharacters = new GraphCharacters();
  graphCharacters.createBars();
  
  manageNbPerso = new ManageNbPerso();
  buttonsFamily = new ButtonsFamily();
}

void draw(){
  background(colorBackground);
  displayTitle();
  displayHeadline();
  graphCharacters.display();
  manageNbPerso.display();
  buttonsFamily.display();
  if ( buttonsFamily.checkHoverButton() || manageNbPerso.onHoverButton() ){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
}

void mouseClicked(){
  if (manageNbPerso.checkClickMinus()){
    nbPerso--;
    graphCharacters.deleteBars();
    graphCharacters.createBars();
  }
  if (manageNbPerso.checkClickPlus()){
    nbPerso++;
    graphCharacters.deleteBars();
    graphCharacters.createBars();
  }
  buttonsFamily.checkClickButton();
}

void mousePressed(){
  
}

void mouseReleased(){

}
