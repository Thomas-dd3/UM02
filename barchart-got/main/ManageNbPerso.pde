class ManageNbPerso {
  final float diameter = 30;
  final float minusX = 900;
  final float minusY = 600;
  final float plusX = 950;
  final float plusY = 600;
  
  void display(){
    displayButtonMinus();
    displayButtonPlus();
  }
  
  void displayButtonMinus(){
    fill(greyL);
    circle(minusX, minusY, diameter);    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(18);
    text("-", minusX, minusY);
  }
  
  void displayButtonPlus(){
    fill(greyL);
    circle(plusX, plusY, diameter);    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(18);
    text("+", plusX, plusY);
  }
  
  Boolean checkClickMinus(){
    if ( distanceCarre(mouseX, mouseY, minusX, minusY) < pow(diameter/2, 2) ){
      return true;
    }
    return false;
  }
  
  Boolean checkClickPlus(){
    if ( distanceCarre(mouseX, mouseY, plusX, plusY) < pow(diameter/2, 2) ){
      return true;
    }
    return false;
  }
  
  void onHoverButton(){
    if ( distanceCarre(mouseX, mouseY, minusX, minusY) < pow(diameter/2, 2) ){
      cursor(HAND);
      return;
    }
    if ( distanceCarre(mouseX, mouseY, plusX, plusY) < pow(diameter/2, 2) ){
      cursor(HAND);
      return;
    }
    cursor(ARROW);
    return;
  }
}
