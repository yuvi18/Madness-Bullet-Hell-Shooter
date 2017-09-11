class gameOverMessages{
  int message = 1;
  gameOverMessages(){
      
  }
  void rollRandomMessage(){
      message = int(random(7));
      if(message==7){
          message=6;
      }
  }
  void displayMessage(){
     if(message==0){
        text("Nothing like a cliche game over screen to get you down.",115,350); 
     }
     if(message==1){
        text("Aw... did someone burst your bubble?",115,350); 
     }
     if(message==2){
        text("Try Harder.",115,350); 
     }
     if(message==3){
        text("Couldn't handle the madness?",115,350); 
     }
     if(message==4){
        text("GEEEEEET DUNNNNKEEEED ONNNNNNN.",115,350); 
     }
     if(message==5){
        text("It's not that hard.",115,350); 
     }
     if(message==6){
        text("What are you going to do, cry?",115,350); 
     }
  }
}