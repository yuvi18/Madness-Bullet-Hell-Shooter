//Simple Class that Makes the Collisons and the Physics for the Ellipse Bullets
class ellipseBullets {
  float x;
  float y;
  float speedX;
  float speedY;
  float accelerationX;
  float accelerationY;
  float minSpeedX;
  float maxSpeedX;
  float minSpeedY;
  float maxSpeedY;
  float diameter1;
  float diameter2;
  boolean notDead = true;
  ellipseBullets(float tempX, float tempY, float tempSpeedX, float tempSpeedY, float tempAccelerationX, float tempAccelerationY, float tempMinSpeedX, float tempMinSpeedY, float tempMaxSpeedX, float tempMaxSpeedY, float tempDiameter1, float tempDiameter2) {
    x= tempX;
    y = tempY;
    speedX= tempSpeedX;
    speedY = tempSpeedY;
    accelerationX = tempAccelerationX;
    accelerationY = tempAccelerationY;
    minSpeedX = tempMinSpeedX;
    maxSpeedX = tempMaxSpeedX;
    minSpeedY = tempMinSpeedY;
    maxSpeedY = tempMaxSpeedY;
    diameter1 = tempDiameter1;
    diameter2 = tempDiameter2;
  }
  void draw() {
    //Acceleration a little broken fix it
    noStroke();
    noFill();
    if(notDead==true){
    stroke(0);
    fill(255, 0, 0);
    }
    ellipse(x, y, diameter1, diameter2);
    x+=speedX;
    y+=speedY;
    speedX = speedX * accelerationX;
    speedY = speedY * accelerationY;
    //Fix Acceleration
    //if(speedX>maxSpeedX && speedX>0){
    //    speedX=maxSpeedX;
    //}
    //if(speedX<-maxSpeedX && speedX<=0){
    //    speedX=-maxSpeedX;
    //}
    //if(speedX<minSpeedX && speedX>0){
    //    speedX=minSpeedX;
    //}
    //if(speedX>-minSpeedX && speedX<=0){
    //    speedX=-minSpeedX;
    //}
    //if(speedY>maxSpeedY && speedY>0){
    //    speedY=maxSpeedY;
    //}
    //if(speedY<-maxSpeedY && speedY<=0){
    //    speedY=-maxSpeedY;
    //}
    //if(speedY<minSpeedX && speedY>0){
    //    speedY=minSpeedY;
    //}
    //if(speedY>-minSpeedY && speedY<=0){
    //    speedY=-minSpeedY;
    //}

  }
  void checkCollision() {
    if (thePlayer.x+5>x-diameter1/2 && thePlayer.x-5<x+diameter1/2 && thePlayer.y+5>y-diameter2/2 && thePlayer.y-5<y+diameter2/2 && notDead) {
      gameOver = true;
    }
  }
  void deleteSelf(){
    notDead=false;
  }
}