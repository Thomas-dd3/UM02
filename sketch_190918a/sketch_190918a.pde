class Ball {
  int ballSize = 50;
  float xpos, ypos, speed;
  boolean xplus = true;
  boolean yplus = true;
  
  Ball (float x, float y, float s) {  
    xpos = x;
    ypos = y; 
    speed = s; 
  }
  
  void update() {
    if ( xplus ) {
      xpos += speed;
    }
    else{
      xpos -= speed;
    }
    
    if ( yplus ){
      ypos += speed;
    }
    else{
      ypos -= speed;
    }
        
    if (xpos > width) { 
      xplus = false; 
    }
    if (xpos < 0){
      xplus = true;
    }
    if (ypos > height) { 
      yplus = false; 
    }
    if (ypos < 0){
      yplus = true;
    }
    
    circle(xpos, ypos, ballSize); 
  }
}

//int i = 0;
int nbBalls = 10;

Ball ball1 = new Ball(50,50,20);


ArrayList<Ball> balls = new ArrayList<Ball>();

for ( int j=0 ; j<nbBalls ; j++ ){
  Ball tempBall = new Ball(random(0,width), random(0,height), random(0,20));
  balls.add(tempBall);
}

void setup(){
  size(1000,800);
  background(255,200,100);

}

void draw(){
  //i+=1;
  background(255,200,100);
  
  ball1.update();


}
