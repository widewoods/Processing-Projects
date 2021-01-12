ArrayList<SnakeBody> snakeBodies = new ArrayList<SnakeBody>();

void setup(){
  size(500, 500);
  snakeBodies.add(new SnakeBody(null, 25, 25));
  
  frameRate(3);
}

String movementState;

static int gridSize = 10;

void draw(){
  background(100);
  //Draw grid
  for(int i = 0; i <= width; i += gridSize){
    stroke(51);
    line(i, 0, i, height);
    line(0, i, width, i);
  } 
  
  //Draw snake
  for(SnakeBody snake : snakeBodies){
  snake.drawSnake();
  }
  
  move();
}

void keyPressed() {
  switch(key){
    case 'w' :
      movementState = "UP";
      break;
      
    case 'a' :
      movementState = "LEFT";
      break;
      
    case 's' :
      movementState = "DOWN";
      break;
      
    case 'd' :
      movementState = "RIGHT";
      break;
  }
}

void move(){
  switch(movementState){
    case "UP" :
      snakeBodies.get(0).y--;
      break;
    case "LEFT" :
      snakeBodies.get(0).x--;
      break;
    case "DOWN" :
      snakeBodies.get(0).y++;
      break;
    case "RIGHT" :
      snakeBodies.get(0).x++;
      break;
  }
}

    
