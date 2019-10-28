int nbPerso = 25;
int colorBackground = 230;
int greyL = 191;
int blueL[] = {102,204,255};

Table table;
GraphCharacters graphCharacters;
ManageNbPerso manageNbPerso;

void setup() {
  size(1100, 700);
  background(colorBackground);
  
  table = loadTable("GOT.csv", "header");
  table.sortReverse("score");
  
  graphCharacters = new GraphCharacters();
  graphCharacters.createBars();
  
  manageNbPerso = new ManageNbPerso();
}

void draw(){
  background(colorBackground);
  graphCharacters.display();
  manageNbPerso.display();
  manageNbPerso.onHoverButton();
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
}

void mousePressed(){
  
}

void mouseReleased(){

}
