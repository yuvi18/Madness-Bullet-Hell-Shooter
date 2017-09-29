//Stand Alone Script that times the bullets and creates an array due to human input
int[] levelArray = {};
import lord_of_galaxy.timing_utils.*;
import ddf.minim.*;
Stopwatch bT;
  Minim minim;
  AudioPlayer player;
  JSONArray tempJson;
void setup(){
  background(255);
  size(500, 500);
  tempJson = new JSONArray();
  bT = new Stopwatch(this);
  minim = new Minim(this);
  //Change Song here
  player = minim.loadFile("../../levelMusic/Angel.mp3");
  player.play();
  bT.start();
};
void draw(){
  
}


void keyPressed() {
  fill(0);
  ellipse(random(500), random(500), 10, 10);
  levelArray = append(levelArray, bT.time());
  println(levelArray);
};
void mouseClicked() {
  for(int i= 0; i<levelArray.length; i++){
  int arrayItem = levelArray[i];
  tempJson.setInt(i,arrayItem);
  }
  saveJSONArray(tempJson, "tempJSON.json");
};