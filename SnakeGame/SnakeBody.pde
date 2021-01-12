public class SnakeBody{
  float x, y;
  float prev_x, prev_y;
  
  int timer;
  
  SnakeBody other;
  
  public SnakeBody(SnakeBody other, float startX, float startY){
    timer = SnakeGame.timer;
    
    this.x = startX;
    this.y = startY;
    this.other = other;
  }
  
  void follow(){
    timer++;
    
    if(timer >= SnakeGame.moveTimer){    
      
      prev_x = x;
      prev_y = y;
      
      if(other != null){   
        this.x = other.prev_x;
        this.y = other.prev_y;
      }
      
      timer = 0;
    }
  }
  
  void drawSnake(){
    int g = 150;
    
    noStroke();
    fill(0, g, 0);
    rect(floor(x) * SnakeGame.gridSize + 1, floor(y) * SnakeGame.gridSize + 1, SnakeGame.gridSize -1, SnakeGame.gridSize -1);
  }
}
