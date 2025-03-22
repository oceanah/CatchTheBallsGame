//Name:Oceana Huynh
//Purpose: creates a game where balls are falling down the 
//         screen and the player must catch it with a bar

//object names
Bar bar;
Score score;
Button playButton;
Button gameOverButton;
//Utility util; 

//variables that tells what stage the game is at
boolean isCaught = false;
boolean isLost = false;
boolean isStartGame = false;

//for font
PFont font;

//arraylist for the balls
ArrayList<Ball> balls = new ArrayList<Ball>();
int numBalls = 5;

void setup() {
  size(800, 800);
  //loads the font to be used
  font = loadFont ("Hubballi-Regular-40.vlw");
  textFont(font);
  //creates instance of objects
  bar = new Bar(100, 10);
  score = new Score();
  playButton = new Button(width/2, height/2, 300, 60, "Click Here To Play");
  gameOverButton = new Button (width/2, height/2, 420, 60, "Game Over! Womp Womp");
  //creates multiple balls and stores it in an arraylist
  for (int i = 0; i < numBalls; i++) {
    Ball newBall = new Ball();
    balls.add(newBall);
  }
}

//ballLogic() -> void
//purpose: determines when the balls are displayed and handles the logic of the ball 
void ballLogic() { 
  int i = 0;
  //moves each ball from the arraylist down the screen
  while (i < balls.size()) {
    Ball curBall = balls.get(i);
    curBall.move();
    //balls are displayed as long as the ball is not caught by the bar
    if (!curBall.isCaught(bar)) {
      curBall.display();
      //if the ball is not caught, game will end by switching the boolean variables
      if (curBall.isGameEnd(bar)) {
        isLost = true;
        isStartGame = false;
        score.findFinalScore();
      }
    //if the ball has been caught, score will update and positions of ball reset to the top
    } else {
      score.countScore();
      curBall.initialBall();
    }
    i++;
  }
}

//startGame() -> void
//purpose: starts the game
void startGame(){
  //displays instructions on how to play
  displayInstructions("press the left and right arrow key to move the bar", 
    width/2, height/2 + 60);
  //checks if player pressed mouse on the play button to start the game
  if (mousePressed && mouseX >= playButton.getX()-playButton.getButtonWidth()/2 && 
      mouseX <= playButton.getX()+playButton.getButtonWidth()/2 && 
      mouseY >= playButton.getY() - playButton.getButtonHeight()/2 && 
      mouseY <= playButton.getY() + playButton.getButtonHeight()/2){
        isStartGame = true;
    }
}

//displayInstructions(String, int, int) -> void
//purpose: displays instructions for players
void displayInstructions(String instructions, int x, int y) {
  textAlign(CENTER);
  fill(0);
  textSize(20);
  text(instructions, x, y);
}

//restartGame() -> void
//purpose: restarts the game
void restartGame() {
  //resets variables to their initial values
  isLost = false;
  isStartGame = true;
  bar.setX(width/2);
  score.setCurrentScore(0);
  //clears the arrayList of balls and makes a new one
  balls.clear();
  for (int i = 0; i < numBalls; i++) {
    Ball newBall = new Ball();
    balls.add(newBall);
  }
}

//keyPressed() -> void
//purpose: the game will start over if the space bar is pressed
void keyPressed() {
  if (isLost && key == ' ') {
    restartGame();
  }
}
 
void draw() {
  background(210, 237, 247);
  //the game will play if the play button is clicked
  if(isStartGame){
    ballLogic();
    bar.move();
    bar.display();
    score.displayCurrentScore(score.getCurrentScore());
  //if a ball is not caught, the game ends and the gameover button and displays restart instructions  
  } else if (isLost){  
    gameOverButton.displayButton();
    score.displayFinalScore();
    displayInstructions("press the space bar to restart", width/2, height/2+45);
  //intro screen where the play button is displayed and option to start playing
  } else {
    playButton.displayButton();
    startGame();
  }
}
