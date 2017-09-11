/* Madness, A Bullet Hell Shooter Raj Baweja
 */

import lord_of_galaxy.timing_utils.*;
import ddf.minim.*;
//Time Stamps for Each Level
int[] level1 = {3900, 4300, 4800, 5000, 5200, 5300, 5600, 5800, 6000, 6200, 7000, 7200, 7500, 7700, 8000, 8200, 9000, 9200, 9400, 9500, 9700, 9900, 10100, 10300, 10500, 10700, 10900, 11100, 11300, 11500,11900,12400, 12600 ,12800,12900,13200,13400, 13600, 13800, 14600, 14800, 15100, 15300, 15600, 15800, 16600, 16800, 17000, 17100,17300,17500,18300,19000,21100,23000,23500,24000,24500,25000,27000,29000,31000,31500,32000,32500,33000,35000,36800,38800,39300,39800,40300,40800,42500,44600,46600,47100,47600,48100,48600};
//Level Jsons (Bullets)
JSONArray json1;
//Some Variables
Minim minim;
Person thePlayer;
gameOverMessages messages;
//Bullet Timer
bulletFunctions bf;
Stopwatch bT;
AudioPlayer player;
Stopwatch regularTimer;
//Booleans
boolean loadedMusic = false;
boolean introDone = false;
boolean gameOver=false;
boolean rolledMessage = false;
int lastGameState =1;
//Itteration Variables
int i =0;
int j =0;
int k = 0;

void setup() {
  size(500, 500);
  //Gotta Initiate those Clases
  bT = new Stopwatch(this);
  regularTimer = new Stopwatch(this);
  minim = new Minim(this);
  bf = new bulletFunctions();
  messages = new gameOverMessages();
  thePlayer = new Person(250, 250, 0, 10);
  //Saying What The Jsons are
  json1 = loadJSONArray("Level_Jsons/level1.json");
} 
int gameState = 1;
void draw() {
  if (gameState==1) {
    background(255);

    lastGameState = 1;
    fill(#9735FA);
    if (mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350) {
      fill(#CDA6F5);
    }
    rect(150, 150, 200, 200);
    fill(0);
    textSize(100);
    text("MADNESS", 20, 100);
    textSize(50);
    text("Start", 190, 260);
    textSize(13);
    text("Only one level. Don't go outside the window or you will get a GAME OVER.", 15, 450);
  }
  if (gameState==2) {
    lastGameState=2;
    background(255);
    if (!loadedMusic) {
        player = minim.loadFile("levelMusic/LoneDigger.mp3");
      player.play();
      bT.start();
      loadedMusic=true;
    }

    fill(0);
    textSize(50);
    if (bT.time()>00 && introDone==false) {
      text("Welcome", 100, 100);
      if (bT.time()>1200) {
        text("to", 350, 100);
        if (bT.time()>2200) {
          text("M", 100, 300);
          if (bT.time()>2400) {
            text("A", 150, 300);
            if (bT.time()>2600) {
              text("D", 200, 300);
              if (bT.time()>2800) {
                text("N", 250, 300);
                if (bT.time()>3000) {
                  text("E", 300, 300);
                  if (bT.time()>3200) {
                    text("S", 335, 300);
                    if (bT.time()>3400) {
                      text("S", 370, 300);
                      if (bT.time()>3600) {
                        background(0);
                        if (bT.time()>3900) {

                          introDone=true;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    textSize(10);
    if (bT.time()>3900 && gameOver==false) {
      //Goes through array of timestamps
      if (i<level1.length) {
        if (bT.time()>level1[i]) {   
          //Run Commands
          //float[] test = {250,250,1,0,1,1,0,0,10,10,25,25};
          //bf.spawnBullet(test);
          //Really Messy JSON Stuff ;-;
          
          JSONArray commands = json1.getJSONArray(i);
          JSONArray commandInfo = commands.getJSONArray(0);
          JSONObject commandInfoAgain = commandInfo.getJSONObject(0);
          int numberOfCommands = commandInfoAgain.getInt("#OfCommands");
          for(j=1;j<numberOfCommands+1;j++){
             String command = commandInfoAgain.getString("Command"+j);
   
             JSONArray parameters = commands.getJSONArray(j);
         
             float[] parametersAgain = {};
             for(k=0;k<parameters.size();k++){
                 float parameter = parameters.getFloat(k);
                 parametersAgain = append(parametersAgain,parameter);
             }
             if(command.equals("ellipseBurst4")){
                 bf.EllipseBurst4(parametersAgain);
                 
             }
             if(command.equals("changeSpeedEllipseBullets")){
               bf.changeSpeedEllipseBullets(parametersAgain);
                 
             }
             if(command.equals("ellipseBurst8")){
                 bf.EllipseBurst8(parametersAgain);
                 
             }
             if(command.equals("spawnBullet")){
                 bf.spawnBullet(parametersAgain);
                 
             }
          }
          
          i++;
        }
      }
     
      bf.draw();
      thePlayer.setXandY(mouseX, mouseY);
      thePlayer.draw();
      fill(0);
      rect(0,0,500,10);
      rect(0,490,500,10);
      rect(0,0,10,500);
      rect(490,0,10,500);
      if (mouseX>490 || mouseX<10 || mouseY>490 || mouseY<10) {
        gameOver=true;
      }
    }
  }
  if (gameState==11) {
    gameOver=false;

    background(255);
    fill(0);
    textSize(15);
    text("GAME OVER", 200, 250);
    textSize(10);
    if (!rolledMessage) {
      messages.rollRandomMessage();
      rolledMessage=true;
    }
    messages.displayMessage();
    fill(#9735FA);
    if (mouseX>100 && mouseX<200 && mouseY>400 && mouseY<450) {
      fill(#CDA6F5);
    }
    rect(100, 400, 100, 50);
    fill(#9735FA);
    if (mouseX>300 && mouseX<400 && mouseY>400 && mouseY<450) {
      fill(#CDA6F5);
    }
    rect(300, 400, 100, 50);
    fill(0);
    text("Retry", 135, 430);
    text("Main Menu", 325, 430);
  }
  if (gameOver==true) {
    //Delete the Bullets
    bf.deleteEllipseBullets();
    //Reset some Stuff.
    rolledMessage = false;
    i=0;
    player.pause();
    player.rewind();
    bT.reset();
    loadedMusic=false;
    introDone=false;
    gameState=11;
  }
};
void mouseClicked() {
  if (mouseX>100 && mouseX<200 && mouseY>400 && mouseY<450 && gameState==11) {
    gameState=lastGameState;
  }
  if (mouseX>300 && mouseX<400 && mouseY>400 && mouseY<450 && gameState==11) {
    gameState=1;
  }
  if (mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350 && gameState==1) {
    gameState=2;
  }
};