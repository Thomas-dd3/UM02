class Ball {
  int ballSize = 50;
  public float xpos, ypos, speed;
  boolean xplus = true;
  boolean yplus = true;
  
  Ball () {  
    xpos = random(0,width);
    ypos = random(0,height); 
    speed = random(0,5);
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
    
    circle(xpos, ypos, ballSize);
  }
  
  void displayConsole(){
    System.out.println(xpos + " " + ypos);
  }
}
