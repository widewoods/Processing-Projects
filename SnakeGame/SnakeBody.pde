public class SnakeBody{
  int x, y;
  int tempx, tempy;
  
  SnakeBody other;
  
  public SnakeBody(SnakeBody other, int startX, int startY){
    this.x = startX;
    this.y = startY;
    this.other = other;
  }
  
  void followSnake(){
    if(other != null){
    tempx = x;
    tempy = y;
    
    this.x = other.tempx;
    this.y = other.tempy;
    }
  }
  
  void drawSnake(){
    int g = 150;
    
    noStroke();
    fill(0, g, 0);
    rect(x * SnakeGame.gridSize + 1, y * SnakeGame.gridSize + 1, SnakeGame.gridSize -1, SnakeGame.gridSize -1);
  }
}
