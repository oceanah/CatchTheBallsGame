//Name:Oceana Huynh
//Class: ICS4U
//Purpose: defines what a score is and keeps track of it

public class Score{
  //attributes
  private int currentScore;
  private int finalScore;
  private int x;
  private int y;
  private ArrayList<Integer> listOfScores;
  
  //constructor that takes in no parameters
  public Score(){
    this.currentScore = 0;
    this.finalScore = 0;
    this.x = width/2;
    this.y = height/2;
    this.listOfScores = new ArrayList<Integer>();
  }
  
  //setters
  public void setCurrentScore (int newCurrentScore){
    this.currentScore = newCurrentScore;
  }
  
  public void setFinalScore (int newFinalScore){
    this.finalScore = newFinalScore;
  }
  
  public void setX (int newX){
    this.x = newX;
  }
  
  public void setY (int newY){
    this.y = newY;
  }
  
  //getters
  public int getCurrentScore(){
    return this.currentScore;
  }
  
  public int getFinalScore(){
    return this.finalScore;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public ArrayList<Integer> getListOfScores(){
    return this.listOfScores;
  }
  
  //countScore() -> void
  //purpose: counts how many balls are caught
  public int countScore(){
    this.currentScore += 1;
    return currentScore;
  }
  
  //findFinalScore() -> void
  //purpose:sets the final score as the current score and adds it to an arraylist
  public void findFinalScore() {
    this.finalScore = this.currentScore;
    this.listOfScores.add(this.finalScore);
  }
  
 //displayCurrentScore() -> void
 //purpose: displays number of balls caught
  void displayCurrentScore(int countScore) {
    fill(0);
    textSize(20);
    text("Balls Caught: " + countScore, width/2, height/2);
  }
  
  //displayFinalScore() -> void
  //purpose: displays the player's final score
  void displayFinalScore() {
    fill(0);
    textSize(20);
    textAlign(CENTER);
    String scoreWord = "Your final score is "+ this.finalScore;
    text(scoreWord, this.x, this.y+200);
  }
}
