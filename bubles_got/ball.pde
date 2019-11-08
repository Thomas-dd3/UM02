class Ball {
  float colorBall[] = new float[3];
  public float xpos, ypos, speed;
  float ballSize;
  boolean xplus = true;
  boolean yplus = true;  
  String label;
  String family;
  
  Ball () {  
    xpos = random(0,width);
    ypos = random(0,height); 
    speed = random(0,3);
    colorBall[0] = random(0,255);
    colorBall[1] = random(0,255);
    colorBall[2] = random(0,255);    
  }
  
  Ball (float size, String label, String family) {
    this.ballSize = size;
    this.label = label;
    this.family = family;
    xpos = random(0,width);
    ypos = random(0,height); 
    speed = random(0,3);
    colorBall[0] = random(0,255);
    colorBall[1] = random(0,255);
    colorBall[2] = random(0,255);    
  }
  
  Ball (float x, float y, float s) {  
    xpos = x;
    ypos = y; 
    speed = s; 
  }
  
  void update() {
    if ( xplus ) {
      xpos = min(xpos + speed, width - ballSize / 2);
    }
    else{
      xpos = max(xpos - speed, 0 + ballSize / 2);
    }
    
    if ( yplus ){
      ypos = min(ypos + speed, height - buttonHeight - 10 - ballSize / 2);
    }
    else{
      ypos = max(ypos - speed, 0 + ballSize / 2);
    }
        
    if (xpos >= width - ballSize / 2) { 
      xplus = false; 
    }
    if (xpos <= 0 + ballSize / 2){
      xplus = true;
    }
    if (ypos >= height - buttonHeight - 10 - ballSize / 2) { 
      yplus = false; 
    }
    if (ypos <= 0 + ballSize / 2){
      yplus = true;
    }
    
  }
  
  void updateWithCursor(){
    xpos = mouseX;
    ypos = mouseY;
  }
  
  void display(ArrayList<String> familyEnable){
    String[] labels = label.split(" ");
    String label2 = labels[labels.length-1];
    labels[labels.length-1] = "";
    String label1 = String.join(" ",labels).trim();
    
    noStroke();
    //color c = color(colorBall[0],colorBall[1],colorBall[2]);
    color c;
    if (familyEnable.contains(family)){
      c = getColorFamily(family);
    }
    else{
      c = disable;
    }
    fill(c);
    circle(xpos, ypos, ballSize);
    c = color(0,0,0);
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(15);
    //text(label,xpos,ypos);
    text(label1,xpos,ypos-10);
    text(label2,xpos,ypos+10);
  }
  
  void displayConsole(){
    System.out.println(xpos + " " + ypos);
  }
}
