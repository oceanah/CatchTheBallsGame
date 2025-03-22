//Name:Oceana Huynh
//Purpose: defines the ball and it's movements

public class Ball {
  // Attributes
  private int speedY;
  private int size;
  private int dirY;
  private int x;
  private int y;
  private color shapeColor;

  //constructor 
  public Ball() {
    this.x = (int) random(1, width);
    this.y = 0;
    this.speedY = (int) random(1,5);
    this.shapeColor = color(247, 80, 80);
    this.size = (int) random(20, 50);
    this.dirY = 1;
  }

  //getters
  public int getSize() {
    return this.size;
  }

  public int getX() {
    return this.x;
  }

  public int getY() {
    return this.y;
  }
  
  
  public int getDirY(){
    return this.dirY;
  }
  
  public int getSpeedY(){
    return this.speedY;
  }
  
  public color getShapeColor(){
    return this.shapeColor;
  }
  
  //setters
  public void setX (int newX){
    this.x = newX;
  }
  
  public void setY (int newY){
    this.y = newY;
  }
  
  public void setSize (int newSize){
    this.size = newSize;
  }
  
  public void setDirY (int newDirY){
    this.dirY = newDirY;
  }
  
  public void setSpeedY (int newSpeedY){
    this.speedY = newSpeedY;
  }
  
  public void setShapeColor(int newShapeColor){
    this.shapeColor = newShapeColor;
  }
  
  //rest() -> void
  //purpose: sets attributes to initial values
  public void initialBall() {
    this.x = (int) random(1, width);
    this.y = 0;
    this.speedY = (int) random(1,5);
    this.shapeColor = color(247, 80, 80);
    this.size = (int) random(20, 50);
    this.dirY = 1;
  }

  //move() -> void
  //purpose: moves the ball down the screen
  void move() {
    this.y += this.dirY * this.speedY;
    //resets posititon of ball
    if (this.y > height) {
      initialBall();
    }
  }
  
  //isGameEnd(Bar) -> boolean
  //purpose: checks if the game ended
  boolean isGameEnd (Bar bar) {
    //checks if the ball is lower than the bar and hasn't been caught by it
    if(this.y > bar.getY() && !isCaught(bar)){
       return true;
     }
     return false;
  }
  
  //isCaught(Bar) -> boolean
  //purpose: checks if the bar caught the ball
  boolean isCaught(Bar bar) {
    if (this.y + this.size/2 >= bar.getY() - bar.getVerticalLength()/2 &&
        this.x >= bar.getX() - bar.getHorizontalLength()/2 &&
        this.x <= bar.getX() + bar.getHorizontalLength()/2){
          return true;
        }
        return false;
      }

  //display() -> void
  //purpose: displays the balls
  void display() {
    fill(this.shapeColor);
    circle(this.x, this.y, this.size);
  }
}
