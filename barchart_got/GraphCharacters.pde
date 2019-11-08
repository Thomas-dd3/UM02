class GraphCharacters {
  final float graphHeight = 550;
  float graphWidth = 900; //Will be calculated after
  final float originGraphX = 120;
  final float originGraphY = 100;
  final float originBarY = originGraphY + 50;
  final float barHeightMax = graphHeight - (originBarY - originGraphY);
  float spaceBtwBars = 5;
  float barWidth;
  float scoreMax;
  
  ArrayList<String> familyEnable = new ArrayList<String>();

  ArrayList<Bar> bars = new ArrayList<Bar>();

  GraphCharacters() {
    this.scoreMax = table.getRow(0).getFloat("score");
  }

  void deleteBars() {
    bars.clear();
  }

  void createBars() {
    float barX = originGraphX;
    barWidth = (graphWidth - spaceBtwBars*nbPerso - 50) / nbPerso;

    for (int i=0; i<nbPerso; i++) {
      TableRow row = table.getRow(i);
      float score = row.getFloat("score");
      String name = row.getString("common_name");
      name = name.split(" \\(")[0];
      String[] nameA = name.split(" ");
      String nameFamily = nameA[nameA.length-1];
      String initial = String.valueOf(name.charAt(0)) + String.valueOf(nameFamily.charAt(0));
      if (!listAllFamily.contains(nameFamily)){
        nameFamily = "Others";
      }

      float barHeight = (score * barHeightMax) / scoreMax;
      float barY = originGraphY + graphHeight - barHeight;

      Bar bar = new Bar(barX, barY, barWidth, barHeight, initial, name, nameFamily, score);
      bars.add(bar);

      barX += (barWidth + spaceBtwBars);
    }
  }

  void display() {
    displayBars();
    displayAxes();
  }

  void displayAxes() {
    fill(colorBackground);
    line(originGraphX, originGraphY, originGraphX, originGraphY+graphHeight);
    triangle(originGraphX, originGraphY, originGraphX-10, originGraphY+20, originGraphX+10, originGraphY+20);
    line(originGraphX, originGraphY+graphHeight, originGraphX + graphWidth, originGraphY+graphHeight);
    triangle(originGraphX+graphWidth, originGraphY+graphHeight, (originGraphX+graphWidth)-20, (originGraphY+graphHeight)-10, (originGraphX+graphWidth)-20, (originGraphY+graphHeight)+10);
    
    fill(0);
    textAlign(RIGHT, TOP);
    textSize(18);
    text("Score", originGraphX-20, originGraphY);
    String legendY = "Characters GOT (" + nbPerso + ")";
    text(legendY, originGraphX+graphWidth, originGraphY+graphHeight+20);
  }

  void displayScale(float scoreHover) {
    //Echelle
    float lineWidth = 30;
    float spaceLineText = 4;
    fill(0);
    textAlign(RIGHT, BOTTOM);
    textSize(18);
    float barHeight;
    float barY;
    if ( scoreHover==-1 || abs(1.5-scoreHover) > 0.08 ) {
      barHeight = (1.5 * barHeightMax) / scoreMax;
      barY = originGraphY + graphHeight - barHeight;
      line(originGraphX-lineWidth, barY, originGraphX, barY);      
      text("1.5", originGraphX-spaceLineText, barY);
    }
    if ( scoreHover==-1 || abs(1.0-scoreHover) > 0.08 ) {
      barHeight = (1 * barHeightMax) / scoreMax;
      barY = originGraphY + graphHeight - barHeight;
      line(originGraphX-lineWidth, barY, originGraphX, barY);
      text("1.0", originGraphX-spaceLineText, barY);
    }
    if ( scoreHover==-1 || abs(0.5-scoreHover) > 0.08 ) {
      barHeight = (0.5 * barHeightMax) / scoreMax;
      barY = originGraphY + graphHeight - barHeight;
      line(originGraphX-lineWidth, barY, originGraphX, barY);
      text("0.5", originGraphX-spaceLineText, barY);
    }
    if ( scoreHover==-1 || abs(0-scoreHover) > 0.08 ) {
      barY = originGraphY + graphHeight - 0;
      //line(originGraphX-lineWidth, barY, originGraphX, barY);
      text("0", originGraphX-spaceLineText, barY);
    }
  }

  void displayBars() {
    float scoreHover = -1;
    for (int i=0; i<bars.size(); i++) {
      Bar bar = bars.get(i);
      bar.display();
      //bar.displayInitial();
      float s = displayNameHover(bar);
      if ( s != -1 ) {
        scoreHover = s;
      }
    }
    displayScale(scoreHover);
  }

  void displayNameHover() {
    for (int i=0; i<bars.size(); i++) {
      Bar bar = bars.get(i);
      if ( (mouseX > bar.x && mouseX < bar.x + bar.barWidth) && (mouseY > bar.y && mouseY < bar.y + bar.barHeight) ) {
        bar.displayName();
      }
    }
  }

  float displayNameHover(Bar bar) {
    if ( (mouseX > bar.x && mouseX < bar.x + bar.barWidth) && (mouseY > bar.y && mouseY < bar.y + bar.barHeight) ) {
      bar.displayName();
      return bar.score;
    }
    return -1;
  }
}
