public float distanceCarre(float x1, float y1, float x2, float y2){
  return pow(x2 - x1, 2) + pow(y2 - y1,2);
}

color getColorFamily(String family) {
  if (family.equals("Lannister")) {
    color lannister = #db6861;
    return lannister;
  }
  if (family.equals("Targaryen")) {
    color targaryen = #d8c660;
    return targaryen;
  }
  if (family.equals("Stark")) {
    color stark = #7ba247;
    return stark;
  }
  if (family.equals("Baratheon")) {
    color baratheon = #46aaaa;
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

void displayTitle(){
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Barplot Game Of Thrones characters according to their score.", width/2, 30);
  text("(calculated with the conection in or out of each characters)", width/2,60);
}

void displayHeadline(){
  fill(getColorFamily("Lannister"));
  textAlign(RIGHT);
  textSize(25);
  text("Jaime Lannister, the most important character?", width-50, 110); 
}
