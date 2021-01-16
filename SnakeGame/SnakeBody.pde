public class SnakeBody{
  float x, y;
  float prev_x, prev_y;
  
  public SnakeBody(float startX, float startY){
    this.x = startX;
    this.y = startY;
  }
  
  void drawSnake(){
    int g = 150;
    
    noStroke();
    fill(0, g, 0);
    rect(floor(x) * SnakeGame.gridSize + 1, floor(y) * SnakeGame.gridSize + 1, SnakeGame.gridSize -1, SnakeGame.gridSize -1);
  }
}
