ArrayList<SnakeBody> snakeBodies = new ArrayList<SnakeBody>();

void setup(){
  size(390, 390);
  snakeBodies.add(new SnakeBody(null, 10, 10));
  grow();
  frameRate(60);
}

String movementState = "LEFT";

static int gridSize = 15;

float speed = 0.05f;

static int timer;
static int moveTimer = 12;

void draw(){
  
  timer++;
  if(timer >= moveTimer){
    timer = 0;
  }
  
  //Draw grid
  background(100);

  for(int i = 0; i <= width; i += gridSize){
    stroke(70);
    line(i, 0, i, height);
    line(0, i, width, i);
  } 
  
  
  //Draw snake
  for(SnakeBody snake : snakeBodies){

    snake.drawSnake(); 
    snake.follow();
  }
  
  //Move head
  move();
}

void move(){
  switch(movementState){
    case "UP" :
      snakeBodies.get(0).y -= speed;
      break;
      
    case "LEFT" :
      snakeBodies.get(0).x -= speed;
      break;
      
    case "DOWN" :
      snakeBodies.get(0).y += speed;
      break;
      
    case "RIGHT" :
      snakeBodies.get(0).x += speed;
      break;
  }
}

void grow(){
  SnakeBody prevSnake = snakeBodies.get(snakeBodies.size() - 1);
  snakeBodies.add(new SnakeBody(prevSnake, prevSnake.x, prevSnake.y));
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
  
  if(key == 'g'){
    grow();
  }
}

    
