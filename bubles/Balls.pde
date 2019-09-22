class Balls {
  final int nbBalls = 30;
  final float dmin = 100;
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  Balls(){
    
  }
  
  void createBalls(){
    for ( int j=0 ; j<nbBalls ; j++ ){
      Ball tempBall = new Ball();
      balls.add(tempBall);
    }
  }
  
  void updateBalls(){
    for ( int j=0 ; j<balls.size() ; j++ ){
      balls.get(j).update();
    }
  }
  
  void link(){
    float d;
    for ( int i=0 ; i < balls.size()-1 ; i++ ){
      for ( int j=i+1 ; j < balls.size() ; j++ ){
        Ball balli = balls.get(i);
        Ball ballj = balls.get(j);
        d = distance(balli, ballj);
        if ( d < dmin ) {
          line(balli.xpos, balli.ypos, ballj.xpos, ballj.ypos);
        }
        
      }
    }
  }

}
