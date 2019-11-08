public float distanceCarre(Ball b1, Ball b2) {
  return pow(b2.xpos - b1.xpos, 2) + pow(b2.ypos - b1.ypos, 2);
}

public float distanceCarre(Ball b1, float x, float y) {
  return pow(x - b1.xpos, 2) + pow(y - b1.ypos, 2);
}

color getColorFamily(String family) {
  if (family.equals("Lannister")) {
    color lannister = #46aaaa;
    return lannister;
  }
  if (family.equals("Targaryen")) {
    color targaryen = #db6861;
    return targaryen;
  }
  if (family.equals("Stark")) {
    color stark = #7ba247;
    return stark;
  }
  if (family.equals("Baratheon")) {
    color baratheon = #d8c660;
    return baratheon;
  }
  if (family.equals("Tyrell")) {
    color tyrell = #505d89;
    return tyrell;
  }
  if (family.equals("Martell")) {
    color martell = #c159ad;
    return martell;
  }
  color others = #9a5e3a;
  return others;
}


int cL = 0;
void displayLegend(){
  if (cL > 250){
    return;
  }
  textSize(22);
  color c = color(cL);
  fill(c);
  textAlign(LEFT, TOP);
  text("Click on the buttons",20,20);
  text("to enable or disable houses!",20,50);
  cL+=1;
}
