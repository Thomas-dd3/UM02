class Balls {
  final int nbBalls = 20;
  final float dmin = pow(100, 2); //Distante au carré
  ArrayList<Ball> balls = new ArrayList<Ball>();
  ArrayList<Ball> ballsCollected = new ArrayList<Ball>();
  
  ArrayList<String> familyEnable = new ArrayList<String>();
  
  Table table;

  Balls(Table table) {
    this.table = table;
    table.sortReverse("score");
    createFamilyEnable();    
  }
  
  void createFamilyEnable(){
    for (int i=0 ; i<nameAllFamily.length ; i++){
      familyEnable.add(nameAllFamily[i]);
    }
    familyEnable.add("Others");
  }

  void createBalls() {
    for ( int i=0; i<nbBalls; i++ ) {
      TableRow row = table.getRow(i);
      float score = row.getFloat("score");
      float size = score * 100;
      String label = row.getString("short_name");
      
      String name = row.getString("common_name");
      name = name.split(" \\(")[0];
      String[] nameA = name.split(" ");
      String family = nameA[nameA.length-1];
      if (!listAllFamily.contains(family)){
        family = "Others";
      }
      
      Ball tempBall = new Ball(size, label, family);
      balls.add(tempBall);
    }
  }

  void updateBalls() {
    ArrayList<Ball> tempBalls = new ArrayList<Ball>();
    for ( int j=0; j<balls.size(); j++ ) {
      balls.get(j).update();
      balls.get(j).display(familyEnable);
      if (!ballsCollected.isEmpty()){
        Ball ballCursor = ballsCollected.get(0);
        float d = distanceCarre(balls.get(j), ballCursor);
        if (d < pow(ballCursor.ballSize/2, 2) ){
          tempBalls.add(balls.get(j));
        }
      }
    }
    for ( int k=0; k<ballsCollected.size(); k++ ) {
      ballsCollected.get(k).updateWithCursor();
      if (k==0){
        ballsCollected.get(k).display(familyEnable);
      }
    }    
    ballsCollected.addAll(tempBalls);
    balls.removeAll(tempBalls);
  }

  void link() {
    float d;
    for ( int i=0; i < balls.size()-1; i++ ) {
      Ball balli = balls.get(i);
      for ( int j=i+1; j < balls.size(); j++ ) {        
        Ball ballj = balls.get(j);
        d = distanceCarre(balli, ballj);
        if ( d < dmin ) {
          line(balli.xpos, balli.ypos, ballj.xpos, ballj.ypos);
        }
      }
    }
    if (!ballsCollected.isEmpty()){
      Ball balli = ballsCollected.get(0);
      for ( int k=0; k < balls.size(); k++ ) {        
        Ball ballj = balls.get(k);
        d = distanceCarre(balli, ballj);
        if ( d < dmin ) {
          line(balli.xpos, balli.ypos, ballj.xpos, ballj.ypos);
        }
      }
    }
  }

  void checkClickBall() {
    float d;
    for ( int i=0; i<balls.size(); i++ ) {
      Ball ball = balls.get(i);
      d = distanceCarre(ball, mouseX, mouseY);

      if (d < pow(ball.ballSize/2, 2) ) {
        ballsCollected.add(ball);
        balls.remove(ball);
      }
    }
  }

  void releaseBalls() {
    balls.addAll(ballsCollected);
    ballsCollected.clear();
  }
}
