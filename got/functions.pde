public float distanceCarre(Ball b1, Ball b2){
  return pow(b2.xpos - b1.xpos, 2) + pow(b2.ypos - b1.ypos,2);
}

public float distanceCarre(Ball b1, float x, float y){
  return pow(x - b1.xpos, 2) + pow(y - b1.ypos,2);
}


void displayButtons(){
  rect(0 + 10, windowY - 10, buttonWidth, buttonHeight);
}
