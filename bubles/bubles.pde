
Balls balls = new Balls();

public float distance(Ball b1, Ball b2){
  return sqrt(pow(b2.xpos - b1.xpos, 2) + pow(b2.ypos - b1.ypos,2));
}

void setup(){
  size(1000,700);
  background(255,200,100);
  balls.createBalls();
}

void draw(){
  //i+=1;
  background(255,200,100);
  balls.updateBalls();
  balls.link();
}
