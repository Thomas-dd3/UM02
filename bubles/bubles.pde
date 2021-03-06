
Balls balls = new Balls();
int colorBackground[] = {255,255,255};

public float distanceCarre(Ball b1, Ball b2){
  return pow(b2.xpos - b1.xpos, 2) + pow(b2.ypos - b1.ypos,2);
}

public float distanceCarre(Ball b1, float x, float y){
  return pow(x - b1.xpos, 2) + pow(y - b1.ypos,2);
}

void setup(){
  size(1000,700);
  background(colorBackground[0],colorBackground[1],colorBackground[2]);

  balls.createBalls();
}

void draw(){
  //i+=1;
  background(colorBackground[0],colorBackground[1],colorBackground[2]);
  balls.updateBalls();
  balls.displayLinks();
  balls.displayBalls();
  
  displayLegend();
}

void mousePressed(){
  //System.out.println(mouseX);
  //System.out.println(mouseY);
  balls.checkClickBall();  
}

void mouseReleased(){
  balls.releaseBalls();  
}

int cL = 0;
void displayLegend(){
  if (cL > 250){
    return;
  }
  textSize(22);
  color c = color(cL);
  fill(c);
  text("Drag a buble",20,20);
  text("to eat the others!",20,50);
  cL+=1;
}
