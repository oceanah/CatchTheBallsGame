//Name:Oceana Huynh
//Purpose: creates buttons for the players to interact with and see

public class Button {
  //attributes
  private int x;
  private int y;
  private int buttonWidth;
  private int buttonHeight;
  private String instructions;
  
  //constructor
  public Button(int x, int y, int buttonWidth, int buttonHeight, String instructions){
    this.x = x;
    this.y = y;
    this.instructions = instructions;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }
  
  //setters
  public void setButtonWidth (int newButtonWidth){
    this.buttonWidth = newButtonWidth;
  }
  
  public void setButtonHeight (int newButtonHeight){
    this.buttonHeight = newButtonHeight;
  }
  
  public void setX (int newX){
    this.x = newX;
  }
  
  public void setY (int newY){
    this.y = newY;
  }
  
  public void setInstruction (String newInstructions) {
    this.instructions = newInstructions;
  }
  
  //getters
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public int getButtonWidth(){
    return this.buttonWidth;
  }
  
  public int getButtonHeight(){
    return this.buttonHeight;
  }
  
  public String getInstructions(){
    return this.instructions;
  }
  
  //button() -> void
  //purpose: displays button to be interacted with
  void displayButton(){
    //draws the shape of button
    fill(232, 213, 194);
    rectMode(CENTER);
    rect(this.x, this.y, buttonWidth, buttonHeight);
    //adds text on top of the button
    textSize(40);
    fill(0);
    text(instructions, this.x, this.y+15, this.buttonWidth, this.buttonHeight);
  }
}
