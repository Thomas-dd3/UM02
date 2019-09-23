class Ball {
  int ballSize = 50;
  float colorBall[] = new float[3];
  public float xpos, ypos, speed;
  boolean xplus = true;
  boolean yplus = true;
  
  Ball () {  
    xpos = random(0,width);
    ypos = random(0,height); 
    speed = random(0,5);
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
    
    this.display();
  }
  
  void display(){
    int r=0, b=0, g=0;
    
    color c = color(r,b,g);
    fill(c);
    circle(xpos, ypos, ballSize);
  }
  
  void displayConsole(){
    System.out.println(xpos + " " + ypos);
  }
}
