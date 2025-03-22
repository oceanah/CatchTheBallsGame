//Name:Oceana Huynh
//Purpose: defines what a basket is and it's movements

public class Bar {
  //attributes
  private int x;
  private int y;
  private color barColor;
  private int horizontalLength;
  private int verticalLength;

  //constructor
  public Bar(int horizontalLength, int verticalLength) {
    this.x = width/2;
    this.y = height - 50;
    this.barColor = color(232, 213, 194);
    this.horizontalLength = horizontalLength;
    this.verticalLength = verticalLength;
  }

  //getters
  public int getX() {
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public int getHorizontalLength(){
    return this.horizontalLength;
  }
  
  public int getVerticalLength(){
    return this.verticalLength;
  }
  
  public color getBarColor(){
   return this.barColor;
  }
  
  //setters
  public void setX(int newX){
    this.x = newX;
  }
  
  public void setY(int newY){
    this.y = newY;
  }
  
  public void setVerticalLength(int newVerticalLength){
    this.verticalLength = newVerticalLength;
  }
  
  public void setHorizontalLength(int newHorizontalLength){
    this.horizontalLength = newHorizontalLength;
  }
  
  public void setBarColor(color newBarColor){
    this.barColor = newBarColor;
  }
    
  //move() -> void
  //purpose: moves the basket left or right
  void move(){
    //moves basket left if left arrow key is pressed
    if (keyPressed && keyCode == LEFT && this.x - this.horizontalLength/2 > 0){
      this.x -= 8;
    }
    //moves basket right if right arrow key is pressed
    if (keyPressed && keyCode == RIGHT && this.x + this.horizontalLength/2 < width){
      this.x += 8;
    }
  }
  
  //display() -> void
  //purpose: displays the basket
  void display() {
    fill(this.barColor);
    rectMode(CENTER);
    rect(this.x, this.y, this.horizontalLength, this.verticalLength);
  }
}
  
