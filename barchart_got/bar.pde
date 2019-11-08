class Bar {
  float x;
  float y;
  float barWidth;
  float barHeight;
  String initial;
  String name;
  String family;
  float score;
  
  Bar(float x, float y, float w, float h, String i, String n, String family, float s){
    this.x = x;
    this.y = y;
    this.barWidth = w;
    this.barHeight = h;
    this.initial = i;
    this.name = n;
    this.family = family;
    this.score = s;    
  }
  
  void display(){
    //fill(blueL[0],blueL[1],blueL[2]);
    color c;
    if (graphCharacters.familyEnable.contains(family)){
      c = getColorFamily(family);
    }
    else{
      c = disable;
    }
    fill(c);
    //fill(greyL);
    noStroke();
    rect(x, y, barWidth, barHeight);
    stroke(0);
  }
  
  void displayName(){
    fill(0);
    textSize(18);
    textAlign(RIGHT, BOTTOM);
    text(name, graphCharacters.originGraphX + graphCharacters.graphWidth + 100, y);
    

    //stroke(1);
    fill(0);
    text(score, graphCharacters.originGraphX, y);

    //text(name, x, y);
    line(graphCharacters.originGraphX - 50, y, graphCharacters.originGraphX + graphCharacters.graphWidth + 100, y);
    
  }
  
  void displayInitial(){
    fill(0);
    textSize(10);
    text(initial, x, y+barHeight+10);
  }

}
