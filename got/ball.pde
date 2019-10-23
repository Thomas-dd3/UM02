class Ball {
  float colorBall[] = new float[3];
  public float xpos, ypos, speed;
  float ballSize;
  boolean xplus = true;
  boolean yplus = true;
  String label;
  
  Ball () {  
    xpos = random(0,width);
    ypos = random(0,height); 
    speed = random(0,3);
    colorBall[0] = random(0,255);
    colorBall[1] = random(0,255);
    colorBall[2] = random(0,255);    
  }
  
  Ball (float size, String label) {
    this.ballSize = size;
    this.label = label;
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
      ypos = min(ypos + speed, height - ballSize / 2);
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
    if (ypos >= height - ballSize / 2) { 
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
  
  void display(){
    color c = color(colorBall[0],colorBall[1],colorBall[2]);
    fill(c);
    circle(xpos, ypos, ballSize);
    c = color(0,0,0);
    fill(c);
    textAlign(CENTER);
    text(label,xpos,ypos);
  }
  
  void displayConsole(){
    System.out.println(xpos + " " + ypos);
  }
}
