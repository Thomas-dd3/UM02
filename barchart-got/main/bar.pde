class Bar {
  float x;
  float y;
  float barWidth;
  float barHeight;
  String initial;
  String name;
  float score;
  
  Bar(float x, float y, float w, float h, String i, String n, float s){
    this.x = x;
    this.y = y;
    this.barWidth = w;
    this.barHeight = h;
    this.initial = i;
    this.name = n;
    this.score = s;    
  }
  
  void display(){
    //fill(blueL[0],blueL[1],blueL[2]);
    fill(greyL);
    noStroke();
    rect(x, y, barWidth, barHeight);
    stroke(0);
  }
  
  void displayName(){
    fill(0);
    textSize(18);
    translate(x, y);
    rotate(-0.2);
    textAlign(LEFT, BOTTOM);
    text(name, 0, 0);
    rotate(0.2);
    translate(-x, -y);
    //text(name, x, y);
  }
  
  void displayInitial(){
    fill(0);
    textSize(10);
    text(initial, x, y+barHeight+10);
  }

}
