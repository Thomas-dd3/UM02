class ManageNbPerso {
  final float diameter = 30;
  final float minusX = graphCharacters.originGraphX + graphCharacters.graphWidth + 50;
  final float minusY = graphCharacters.originGraphY + graphCharacters.graphHeight;
  final float plusX = minusX + 50;
  final float plusY = graphCharacters.originGraphY + graphCharacters.graphHeight;
  
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
  
  Boolean onHoverButton(){
    if ( distanceCarre(mouseX, mouseY, minusX, minusY) < pow(diameter/2, 2) ){
      return true;
    }
    if ( distanceCarre(mouseX, mouseY, plusX, plusY) < pow(diameter/2, 2) ){
      return true;
    }
    return false;
  }
}
