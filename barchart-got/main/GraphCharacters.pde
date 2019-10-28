class GraphCharacters {
  final float graphHeight = 550;
  float graphWidth = 700; //Will be calculated after
  final float originGraphX = 100;
  final float originGraphY = 50;
  final float originBarY = originGraphY + 50;
  final float barHeightMax = graphHeight - (originBarY - originGraphY);
  float spaceBtwBars = 5;
  float barWidth;
  float scoreMax;
  
  ArrayList<Bar> bars = new ArrayList<Bar>();
  
  GraphCharacters(){
    this.scoreMax = table.getRow(0).getFloat("score");    
  }
  
  void deleteBars(){
    bars.clear();
  }
  
  void createBars(){
    float barX = originGraphX;
    barWidth = (graphWidth - spaceBtwBars*nbPerso - 50) / nbPerso;

    for (int i=0 ; i<nbPerso ; i++){
        TableRow row = table.getRow(i);
        float score = row.getFloat("score");
        String name = row.getString("common_name");
        name = name.split(" \\(")[0];
        String[] nameA = name.split(" ");
        String nameB = nameA[nameA.length-1];
        String initial = String.valueOf(name.charAt(0)) + String.valueOf(nameB.charAt(0));
        
        float barHeight = (score * barHeightMax) / scoreMax;
        float barY = originGraphY + graphHeight - barHeight;
        
        Bar bar = new Bar(barX, barY, barWidth, barHeight, initial, name, score);
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
  }
  
  void displayBars() {
    for (int i=0 ; i<bars.size() ; i++){
      Bar bar = bars.get(i);
      bar.display();
      //bar.displayInitial();
      displayNameHover(bar);
    }
  }
  
  void displayNameHover() {
    for (int i=0 ; i<bars.size() ; i++){
      Bar bar = bars.get(i);
      if ( (mouseX > bar.x && mouseX < bar.x + bar.barWidth) && (mouseY > bar.y && mouseY < bar.y + bar.barHeight) ){
        bar.displayName();
      }
    }
  }
  
  void displayNameHover(Bar bar) {
    if ( (mouseX > bar.x && mouseX < bar.x + bar.barWidth) && (mouseY > bar.y && mouseY < bar.y + bar.barHeight) ){
      bar.displayName();
    }
  }
  
}
