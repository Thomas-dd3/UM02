import java.util.Optional;

class Balls {
  final int nbBalls = 30;
  final float dmin = pow(100, 2); //Distante au carré
  ArrayList<Ball> balls = new ArrayList<Ball>();
  ArrayList<Ball> ballsCollected = new ArrayList<Ball>();
  //Optional<Ball> clickedBall = Optional.empty();

  Balls() {
  }

  void createBalls() {
    for ( int j=0; j<nbBalls; j++ ) {
      Ball tempBall = new Ball();
      balls.add(tempBall);
    }
  }

  void updateBalls() {
    ArrayList<Ball> tempBalls = new ArrayList<Ball>();
    for ( int j=0; j<balls.size(); j++ ) {
      balls.get(j).update();
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
    }
    ballsCollected.addAll(tempBalls);
    balls.removeAll(tempBalls);
  }
  
  void displayBalls() {
    for ( int j=0; j<balls.size(); j++ ) {
      balls.get(j).display();
    }
    
    if (ballsCollected.size() > 0){
      ballsCollected.get(0).display();
    }
  }

  void displayLinks() {
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
