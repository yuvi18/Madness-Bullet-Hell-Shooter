
class bulletFunctions {

  bulletFunctions() {
    /*
  float x= 250;
     float y=250;
     float speedX= 1;
     float speedY= 1;
     float accelerationX = 1;
     float accelerationY = 1;
     float diameter1=10;
     float diameter2=10;
     float Width = 10;
     float Height = 10;
     float rotation= 0;
     float minSpeed=0;
     float maxSpeed=10;
     */
  }
  // Arrays of bullets
  ArrayList<ellipseBullets> ellipseBullets = new ArrayList<ellipseBullets>();

  //Sexy Bullet Functions
  void spawnBullet(float[] parameters){
    float x = parameters[0];
    float y = parameters[1];
    float speedX = parameters[2];
    float speedY = parameters[3];
    float accelerationX = parameters[4];
    float accelerationY = parameters[5];
    float minSpeedX = parameters[6];
    float minSpeedY = parameters[7];
    float maxSpeedX = parameters[8];
    float maxSpeedY = parameters[9];
    float diameter1 = parameters[10];
    float diameter2 = parameters[11];
    ellipseBullets.add(new ellipseBullets(x, y, speedX, speedY, accelerationX, accelerationY, minSpeedX, minSpeedY, maxSpeedX, maxSpeedY, diameter1, diameter2));
  }
  void EllipseBurst4(float[] parameters) {
    float x = parameters[0];
    float y = parameters[1];
    float speedX = parameters[2];
    float speedY = parameters[3];
    float accelerationX = parameters[4];
    float accelerationY = parameters[5];
    float minSpeedX = parameters[6];
    float minSpeedY = parameters[7];
    float maxSpeedX = parameters[8];
    float maxSpeedY = parameters[9];
    float diameter1 = parameters[10];
    float diameter2 = parameters[11];
    //Add The new bullets to the array
    ellipseBullets.add(new ellipseBullets(x+5, y-5, speedX, -speedY, accelerationX, accelerationY, minSpeedX, minSpeedY, maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x-5, y-5, -speedX, -speedY, accelerationX, accelerationY, -minSpeedX, minSpeedY, -maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x-5, y+5, -speedX, speedY, accelerationX, accelerationY, -minSpeedX, -minSpeedY, -maxSpeedX, -maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x+5, y+5, speedX, speedY, accelerationX, accelerationY, minSpeedX, -minSpeedY, maxSpeedX, -maxSpeedY, diameter1, diameter2));
  }
    void EllipseBurst8(float[] parameters) {
    float x = parameters[0];
    float y = parameters[1];
    float speedX = parameters[2];
    float speedY = parameters[3];
    float accelerationX = parameters[4];
    float accelerationY = parameters[5];
    float minSpeedX = parameters[6];
    float minSpeedY = parameters[7];
    float maxSpeedX = parameters[8];
    float maxSpeedY = parameters[9];
    float diameter1 = parameters[10];
    float diameter2 = parameters[11];
    //Add The new bullets to the array
    ellipseBullets.add(new ellipseBullets(x+5, y-5, speedX, -speedY, accelerationX, accelerationY, minSpeedX, minSpeedY, maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x-5, y-5, -speedX, -speedY, accelerationX, accelerationY, -minSpeedX, minSpeedY, -maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x-5, y+5, -speedX, speedY, accelerationX, accelerationY, -minSpeedX, -minSpeedY, -maxSpeedX, -maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x+5, y+5, speedX, speedY, accelerationX, accelerationY, minSpeedX, -minSpeedY, maxSpeedX, -maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x, y-5, 0, -speedY, accelerationX, accelerationY, minSpeedX, minSpeedY, maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x+5, y, speedX, 0, accelerationX, accelerationY, -minSpeedX, minSpeedY, -maxSpeedX, maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x, y+5, 0, speedY, accelerationX, accelerationY, -minSpeedX, -minSpeedY, -maxSpeedX, -maxSpeedY, diameter1, diameter2));
    ellipseBullets.add(new ellipseBullets(x-5, y, -speedX, 0, accelerationX, accelerationY, minSpeedX, -minSpeedY, maxSpeedX, -maxSpeedY, diameter1, diameter2));
  }
  void draw() {

    //Runs Through Each Bullet In the Array and Updates it.
    for (int i = 0; i < ellipseBullets.size(); i++) {
      ellipseBullets bullet = ellipseBullets.get(i);
      bullet.draw();
      if (ellipseBullets.get(i).x>550 || ellipseBullets.get(i).x<-50 || ellipseBullets.get(i).y>550 || ellipseBullets.get(i).y<-50) {
        ellipseBullets.get(i).deleteSelf();
        ellipseBullets.remove(i);
      }
      bullet.checkCollision();
    }
  }
  void deleteEllipseBullets(){
      for (int i = 0; i < ellipseBullets.size(); i++) {
      ellipseBullets.get(i).deleteSelf();
      }
  }
  void changeSpeedEllipseBullets(float[] parameters){
      float tempSpeedX = parameters[0];
      float tempSpeedY = parameters[1]; 
      for (int i = 0; i < ellipseBullets.size(); i++) {
      ellipseBullets bullet = ellipseBullets.get(i);
      //God help me who  knew changing the speed was so freaken complicated.
      boolean notChangedSpeed = true;
      //Bottom Right Moving Bullet
      if(bullet.speedX>0 && bullet.speedY>0 && notChangedSpeed){
            bullet.speedX = tempSpeedX;
            bullet.speedY = tempSpeedY;
            notChangedSpeed=false;
      }
      //Top Left Moving Bullet
      if(bullet.speedX<0 && bullet.speedY<0 && notChangedSpeed){
            bullet.speedX = -tempSpeedX;
            bullet.speedY = -tempSpeedY;
            notChangedSpeed=false;
      }
      //Bottom Left Moving Bullet
      if(bullet.speedX<0 && bullet.speedY>0 && notChangedSpeed){
            bullet.speedX = -tempSpeedX;
            bullet.speedY = tempSpeedY;
            notChangedSpeed=false;
      }
      //Top Right Moving Bullet
      if(bullet.speedX>0 && bullet.speedY<0 && notChangedSpeed){
            bullet.speedX = tempSpeedX;
            bullet.speedY = -tempSpeedY;
             notChangedSpeed=false;
      }
      }
  }
}