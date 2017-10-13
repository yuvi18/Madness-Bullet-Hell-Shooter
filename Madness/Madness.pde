/* Madness, A Bullet Hell Shooter Raj Baweja
 */

import lord_of_galaxy.timing_utils.*;
import ddf.minim.*;
//Time Stamps for Each Level
int[] level1 = {};
int[] level2 = {};
//Level Jsons (Bullets)
JSONArray json1;
JSONArray json2;
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
boolean displayWin = false;
boolean winScreenDone = false;
int lastGameState =1;
//Itteration Variables
int i =0;
int j =0;
int k = 0;
//Level Unlocked
int levelsDone = 0;
String errorText = "";
//Other Stuff
float precentDone=0;
float bGR = 255;
float bGG = 255;
float bGB = 255;
float alpha = 0;
float winX = -200;
JSONObject highScores;
String levelOn;
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
  json2 = loadJSONArray("Level_Jsons/level2.json");
  highScores = loadJSONObject("highScores.json");
  //Json Time Stamps
  JSONArray tempJson = loadJSONArray("Level_Jsons/level1Time.json");
  for (int l=0; l<tempJson.size(); l++) {
    int item = tempJson.getInt(l);
    level1 = append(level1, item);
  }
  tempJson = loadJSONArray("Level_Jsons/level2Time.json");
  for (int l=0; l<tempJson.size(); l++) {
    int item = tempJson.getInt(l);
    level2 = append(level2, item);
  }
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
    text("Alpha", 235, 450);
  }
  if (gameState==2) {
    lastGameState=2;
    levelOn="level1";
    background(255);
    if (!loadedMusic) {
      player = minim.loadFile("levelMusic/LoneDigger.mp3");
      player.play();
      bT.start();
      precentDone=0;
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
          float[] test = {250,250,1,0,1,1,0,0,10,10,25,25};
          bf.spawnBullet(test);
          //Really Messy JSON Stuff ;-;

          //JSONArray commands = json1.getJSONArray(i);
          //JSONArray commandInfo = commands.getJSONArray(0);
          //JSONObject commandInfoAgain = commandInfo.getJSONObject(0);
          //int numberOfCommands = commandInfoAgain.getInt("#OfCommands");
          //for (j=1; j<numberOfCommands+1; j++) {
          //  String command = commandInfoAgain.getString("Command"+j);

          //  JSONArray parameters = commands.getJSONArray(j);

          //  float[] parametersAgain = {};
          //  for (k=0; k<parameters.size(); k++) {
          //    float parameter = parameters.getFloat(k);
          //    parametersAgain = append(parametersAgain, parameter);
          //  }
          //  if (command.equals("ellipseBurst4")) {
          //    bf.EllipseBurst4(parametersAgain);
          //  }
          //  if (command.equals("changeSpeedEllipseBullets")) {
          //    bf.changeSpeedEllipseBullets(parametersAgain);
          //  }
          //  if (command.equals("ellipseBurst8")) {
          //    bf.EllipseBurst8(parametersAgain);
          //  }
          //  if (command.equals("spawnBullet")) {
          //    bf.spawnBullet(parametersAgain);
          //  }
          //  if (command.equals("changeBackground")) {
          //    bf.changeBackground(parametersAgain);
          //  }
          //}

          i++;
        }
      }

      bf.draw();
      thePlayer.setXandY(mouseX, mouseY);
      thePlayer.draw();
      fill(0);
      rect(0, 0, 500, 10);
      rect(0, 490, 500, 10);
      rect(0, 0, 10, 500);
      rect(490, 0, 10, 500);
      if (mouseX>490 || mouseX<10 || mouseY>490 || mouseY<10) {
        gameOver=true;
      }
    }
  }
  if (gameState==3) {
    lastGameState=3;
    levelOn="level2";
    background(bGR,bGG,bGB);
    if (!loadedMusic) {
      player = minim.loadFile("levelMusic/Genie.mp3");
      player.play();
      bT.start();
      precentDone=0;
      loadedMusic=true;
    }                                                                                                                                                         
    textSize(10);
    if (gameOver==false) {
      //Goes through array of timestamps
      if (i<level2.length) {
        if (bT.time()>level2[i]) {   
          //Run Commands
          //Delete when done with timing
          if(bT.time()<17000){
          float[] test = {random(100,400),random(100,400),1,1,1.01,1.01,0,0,5,5,25,25};
          bf.EllipseBurst4(test);
          }
          if(bT.time()>168500){
          float[] test = {random(100,400),random(100,400),3,3,1,1,0,0,5,5,25,25};
          bf.EllipseBurst8(test);
          }
          
          //Really Messy JSON Stuff ;-;
          //Uncomment when done for timing
          if(bT.time()>17000 && bT.time()<168500){
          JSONArray commands = json2.getJSONArray(i-56);
          JSONArray commandInfo = commands.getJSONArray(0);
          JSONObject commandInfoAgain = commandInfo.getJSONObject(0);
          int numberOfCommands = commandInfoAgain.getInt("#OfCommands");
          for (j=1; j<numberOfCommands+1; j++) {
            String command = commandInfoAgain.getString("Command"+j);

            JSONArray parameters = commands.getJSONArray(j);

            float[] parametersAgain = {};
            for (k=0; k<parameters.size(); k++) {
              float parameter = parameters.getFloat(k);
              parametersAgain = append(parametersAgain, parameter);
            }
            if (command.equals("ellipseBurst4")) {
              bf.EllipseBurst4(parametersAgain);
            }
            if (command.equals("skip")) {
            }
            if (command.equals("changeSpeedEllipseBullets")) {
              bf.changeSpeedEllipseBullets(parametersAgain);
            }
            if (command.equals("ellipseBurst8")) {
              bf.EllipseBurst8(parametersAgain);
            }
            if (command.equals("spawnBullet")) {
              bf.spawnBullet(parametersAgain);
            }
            if (command.equals("changeBackground")) {
              bf.changeBackground(parametersAgain);
            }
          }
          }
          i++;
          
        }
      }

      bf.draw();
      thePlayer.setXandY(mouseX, mouseY);
      thePlayer.draw();
      fill(0);
      rect(0, 0, 500, 10);
      rect(0, 490, 500, 10);
      rect(0, 0, 10, 500);
      rect(490, 0, 10, 500);
      fill(0,0,255);
      rect(10,0,precentDone*4.8000000,10);
      if(bT.time()<183000){
      precentDone = bT.time()*100.000000/182957.000000;
      }
      if(bT.time()>183000){
          highScores.setInt("level2",100);
          saveJSONObject(highScores,"highScores.json");
          gameState=101;
      }
      println(int(precentDone));
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
  if (gameState==100) {
    gameOver=false;

    background(255);
    fill(0);
    textSize(15);
    text("Level Select", 195, 50);
    textSize(15);
    fill(#9735FA);
    if (mouseX>100 && mouseX<140 && mouseY>100 && mouseY<140) {
      fill(#CDA6F5);
    }
    rect(100, 100, 40, 40);
    fill(#9735FA);
    if (mouseX>150 && mouseX<190 && mouseY>100 && mouseY<140) {
      fill(#CDA6F5);
    }
    if(levelsDone<1){
      fill(#A5A2A2);
    }
    rect(150, 100, 40, 40);
    fill(#9735FA);
    if (mouseX>100 && mouseX<200 && mouseY>400 && mouseY<450) {
      fill(#CDA6F5);
    }
    rect(100, 400, 100, 50);
    fill(0);
    text("1", 115, 125);
    text("2", 165, 125);
    //Highscores
    text(highScores.getInt("level1") + "%",110,160);
    text(highScores.getInt("level2") + "%",160,160);
    //Other Stuff
    fill(255,0,0);
    text(errorText,300,50);
    fill(0);
    text("Back", 135, 430);
  }
  if(gameState==101){
      background(255);
      fill(0,alpha);
      rect(0,0,500,500);
     if(displayWin==false && winScreenDone==false){
      fill(0);
      rect(0, 0, 500, 10);
      rect(0, 490, 500, 10);
      rect(0, 0, 10, 500);
      rect(490, 0, 10, 500);
      }
      if(displayWin==false && winScreenDone ==false){
              alpha++;
      }
      if(winScreenDone == true){
           alpha--; 
      }
      if(winScreenDone == true && alpha<0){
        alpha = 0;
        winScreenDone=false;
        gameState=100;
      }
      if(alpha>255 && winScreenDone == false){
         displayWin = true;
         alpha = 256;
      }
      if(displayWin){
          textSize(25);
          fill(255);
          text("You",winX,200);
          text("Win!",-winX+500,300);
          winX+=5;
          if(winX>600){
             winX = -200;
              winScreenDone = true;
              displayWin=false;
          }
      }
  };
  if (gameOver==true) {
    //Delete the Bullet
    bf.deleteEllipseBullets();
    //Reset some Stuff.
    rolledMessage = false;
    i=0;
    player.pause();
    player.rewind();
    bT.reset();
    loadedMusic=false;
    introDone=false;
    //Highscore
    if(int(precentDone)>highScores.getInt(levelOn)){
       highScores.setInt(levelOn,int(precentDone));
       saveJSONObject(highScores,"highScores.json");
    }
    //Game Over Screen
    gameState=11;
  }
  //TUTORIAL
  if(bT.time()>4000 && bT.time()<6000 && gameState==2){
             textSize(20);
             fill(0);
             text("Hey there, how are ya?",100,230);
  }
  if(bT.time()>6000 && bT.time()<8000 && gameState==2){
             textSize(20);
             fill(0);
             text("It looks like you are a little new here.",100,230);
  }
  if(bT.time()>8000 && bT.time()<10000 && gameState==2){
             textSize(20);
             fill(0);
             text("First just try dodging the bullets.",100,230);
  }
  if(bT.time()>25000 && bT.time()<28000 && gameState==2){
             textSize(20);
             fill(0);
             text("Oh you are still here...",100,230);
  }
  if(bT.time()>28000 && bT.time()<31000 && gameState==2){
             textSize(20);
             fill(0);
             text("Well I might as well tell",100,230);
             text("you the types of bullets.",100,280);
  }
   if(bT.time()>31000 && bT.time()<33000 && gameState==2){
             textSize(20);
             fill(0);
             text("Here we go!",100,230);
  }
  if(bT.time()>35000 && bT.time()<36500 && gameState==2){
             textSize(20);
             fill(0);
             text("4 Burst",100,230);
  }
  if(bT.time()>37000 && bT.time()<38500 && gameState==2){
             textSize(20);
             fill(0);
             text("8 Burst",100,230);
  }
  if(bT.time()>38800 && bT.time()<43000 && gameState==2){
             textSize(20);
             fill(0);
             text("We can also change the speed.",100,230);
  }
  if(bT.time()>43000 && bT.time()<44500 && gameState==2){
             textSize(20);
             fill(0);
             text("Background...",100,230);
  }
  if(bT.time()>44500 && bT.time()<46000 && gameState==2){
             textSize(20);
             fill(0);
             text("Acceleration...",100,230);
  }
  if(bT.time()>47000 && bT.time()<50000 && gameState==2){
             textSize(20);
             fill(0);
             text("Time to see if you can handle the Madness.",500,230);
  }
  //Other Stuff
  if(bT.time()>18500 && bT.time()<19500 && gameState==3){
             textSize(20);
             fill(0);
             text("EZ Right?",200,230);
  }
  if(gameState!=100){
      errorText="";
  }
};
void mouseClicked() {
  if (mouseX>100 && mouseX<200 && mouseY>400 && mouseY<450 && gameState==11) {
    gameState=lastGameState;
  }
  if (mouseX>300 && mouseX<400 && mouseY>400 && mouseY<450 && gameState==11){
    gameState=1;
  }
  if (mouseX>150 && mouseX<350 && mouseY>150 && mouseY<350 && gameState==1) {
    gameState=100;
  }
  if (mouseX>100 && mouseX<140 && mouseY>100 && mouseY<140 && gameState==100){
    gameState=2;
  }
  if (mouseX>150 && mouseX<190 && mouseY>100 && mouseY<140 && gameState==100 && levelsDone>0){
    gameState=3;
  }
  if (mouseX>150 && mouseX<190 && mouseY>100 && mouseY<140 && gameState==100 && levelsDone<1){
    errorText="Beat Level 1 First";
  }
  if (mouseX>100 && mouseX<200 && mouseY>400 && mouseY<450 && gameState==100){
    gameState=lastGameState;
  }
};