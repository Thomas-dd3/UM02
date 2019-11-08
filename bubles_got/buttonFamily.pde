class ButtonFamily {
  Boolean actif = true;
  String family;
  float x;
  float y;
  
  ButtonFamily(String family, float x, float y){
    this.family = family;
    this.x = x;
    this.y = y;
  }
  
  void display(){
    color c;
    if (actif){
      c = getColorFamily(family);
    }
    else{
      c = disable;
    }
    fill(c);
    rect(x, y, buttonWidth, buttonHeight);
    
    c = color(0);
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(18);
    text(family, x + buttonWidth/2, y + buttonHeight/2);
  } 
}

class ButtonsFamily {
  ArrayList<ButtonFamily> btnFamily = new ArrayList<ButtonFamily>();
  
  ButtonsFamily(){
    createButtons();
  }
  
  void createButtons(){
    float xpos = 10;
    for (int i=0 ; i<nameAllFamily.length ; i++){
      ButtonFamily btn = new ButtonFamily(nameAllFamily[i], xpos, height - 10 - buttonHeight);
      btnFamily.add(btn);
      xpos += buttonWidth + 10;
    }
    ButtonFamily btn = new ButtonFamily("Others", xpos, height - 10 - buttonHeight);
    btnFamily.add(btn);
  }
  
  void display(){
    for (int i=0 ; i<btnFamily.size() ; i++){
      btnFamily.get(i).display();
    }
  }
  
  void checkClickButton(){
    for (int i=0 ; i<btnFamily.size() ; i++){
      ButtonFamily btn = btnFamily.get(i);
      if ( mouseX > btn.x && mouseX < btn.x+buttonWidth && mouseY > btn.y && mouseY < btn.y+buttonHeight ){
         if (btn.actif){
           btn.actif = false;
           balls.familyEnable.remove(btn.family);
         }
         else{
           btn.actif = true;
           balls.familyEnable.add(btn.family);
         }
      }
    }
  }
  
  Boolean checkHoverButton(){
    for (int i=0 ; i<btnFamily.size() ; i++){
      ButtonFamily btn = btnFamily.get(i);
      if ( mouseX > btn.x && mouseX < btn.x+buttonWidth && mouseY > btn.y && mouseY < btn.y+buttonHeight ){
        return true;
      }
    }
    return false;
  }
  
}
