final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

final int GO_RIGHT = 0,GO_DOWN = 1,GO_LEFT = 2,NO_GO = 3,NULL = 4;

int soilX,soilY = 160,soilW = 80,soilH = 80,heartX = 10,heartY = 10,heartW = 50,heartCol = 20,maxHeart = 5,minHeart = 0;
int moveW = 0,move = NULL;

float soils = 80,groundhogX = soils*4,groundhogY = soils,groundhogW = groundhogX+80,groundhogH = groundhogY+80,groundhogSpeed = 80/16;
boolean downPressed = false,leftPressed = false,rightPressed = false;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24,soil0,soil1,soil2,soil3,soil4,soil5,life,stone1,stone2,groundhogDown,groundhogLeft,groundhogRight,groundhogIdle;

// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  life = loadImage("img/life.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */
  
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
        move = NO_GO;
				mousePressed = false;
			}
		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game
    int allX;
    int allY;    
		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
     for (int y = 0 ; y < 24 ; y += 1){
       for(int x = 0 ; x < 9 ; x += 1){
         allX = soilX+(soilH*x); 
         allY = soilY+(soilH*y);
          if(y >=20 ){                                               //21-24
             image(soil5,allX, soilY+(soilH*y));
             if(y%3==1 && x%3 ==1 || y%3==1 && x%3 ==2){             //stone1
               image(stone1,allX,allY);}
             if(y%3==2 && x%3 ==0 || y%3==2 && x%3 ==1){
               image(stone1,allX,allY);}
             if(y%3==0 && x%3 ==0 || y%3==0 && x%3 ==2){
               image(stone1,allX,allY);}
                 if(y%3==1 && x%3==2){                               //stone2
                   image(stone2,allX,allY);}
                 if(y%3==2 && x%3==1){
                   image(stone2,allX,allY);}
                 if(y%3==0 && x%3==0){
                   image(stone2,allX,allY);}
           }else if(y >=16){                                         //17-20
             image(soil4,allX,allY);
             if(y%3==1 && x%3 ==1 || y%3==1 && x%3 ==2){             //stone1
               image(stone1,allX,allY);}
             if(y%3==2 && x%3 ==0 || y%3==2 && x%3 ==1){
               image(stone1,allX,allY);}
             if(y%3==0 && x%3 ==0 || y%3==0 && x%3 ==2){
               image(stone1,allX,allY);}
                 if(y%3==1 && x%3==2){                               //stone2
                   image(stone2,allX,allY);}
                 if(y%3==2 && x%3==1){
                   image(stone2,allX,allY);}
                 if(y%3==0 && x%3==0){
                   image(stone2,allX,allY);}
           }else if(y >=12){                                         //13-16
             image(soil3,allX,allY);
              if(y%4 ==0 || y%4 ==3){                                //stone1
               if(x%4 ==1 ||x%4 ==2){
                 image(stone1,allX,allY);
                 }
               }
              if(y%4 ==2 || y%4 ==1){
               if(x%4 ==0 ||x%4 ==3){
                 image(stone1,allX,allY);
                 }
                }
           }else if(y >=8){                                         //9-12
             image(soil2,allX,allY);
             if(y%4 ==0 || y%4 ==3){                                //stone1
               if(x%4 ==1 ||x%4 ==2){
                 image(stone1,allX,allY);
                 }
               }
              if(y%4 ==2 || y%4 ==1){
               if(x%4 ==0 ||x%4 ==3){
                 image(stone1,allX,allY);
                 }
                } 
           }else if(y >=4){                                         //5-8
             image(soil1,allX,allY);
             if(y == x){                                            //stone1
               image(stone1,allX,allY);
               }
           }else{                                                   //1-4
             image(soil0,allX,allY);
             if(y == x){                                            //stone1 
               image(stone1,allX,allY);
               }
             }
           }
         }
  
		// Player
switch(move){  //all groundhog to move
    case NULL: 
      break;
    case NO_GO: //STOP
    if (downPressed) {
      move = GO_DOWN;
    }
    if (leftPressed) {
      move = GO_LEFT;
    }
    if (rightPressed) {
      move = GO_RIGHT; 
    }
      image(groundhogIdle,groundhogX,groundhogY);    //hog
      moveW = 0;
      downPressed = false;
      leftPressed = false;
      rightPressed = false;
      break;
    case GO_DOWN:                                         //DOWN   
      if(moveW < 80){
        groundhogY += groundhogSpeed ;
        moveW += groundhogSpeed;
        image(groundhogDown,groundhogX,groundhogY);
        if(moveW ==80){
        image(groundhogIdle,groundhogX,groundhogY);
        move = NO_GO;
          }
        }
      if(groundhogY>480-soils) groundhogY = 480-soils;
      break;
    case GO_LEFT:                                        //LEFT
       if(moveW <= 80){
         groundhogX -= groundhogSpeed ;
         moveW += groundhogSpeed;
         image(groundhogLeft,groundhogX,groundhogY); 
         if(moveW == 80){
         move = NO_GO;
           }
        }
      if(groundhogX<0) groundhogX = 0;
      break;
      
    case GO_RIGHT:                                        //RIGHT
      if(moveW < 80){
         image(groundhogRight,groundhogX,groundhogY);
         groundhogX += groundhogSpeed ;
         moveW += groundhogSpeed;
         if(moveW == 80){
         image(groundhogIdle,groundhogX,groundhogY);
         move = NO_GO;
         }         
        }
      if(groundhogX>640-soils) groundhogX = 640-soils;
      break;
     }
		// Health UI
    for(int i = 0; i < playerHealth; i += 1){
     if(playerHealth >= minHeart || playerHealth <= maxHeart){
       image(life,(heartX+((heartW+heartCol)*i)),heartY);
         }
      }
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
        move = NULL;
				mousePressed = false;
				// Remember to initialize the game here!
	    	}else{
  	  	image(restartNormal, START_BUTTON_X, START_BUTTON_Y);
  		    }
        }
		break;	
	}
    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
        }
   }
void keyPressed(){
	// Add your moving input code here
 if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case DOWN:
      if(move == NO_GO) downPressed = true;
        break;
      case LEFT:
        if(move == NO_GO) leftPressed = true;
        break;
      case RIGHT:
        if(move == NO_GO) rightPressed = true;
        break;
    }
  }
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
    if (key == CODED) {
    switch (keyCode) {
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
