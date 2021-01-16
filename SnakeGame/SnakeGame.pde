ArrayList<SnakeBody> snakeBodies = new ArrayList<SnakeBody>();


String movementState = "LEFT";

static int gridSize = 16;

//1 unit every 20 frames;
float changeRate = 0.05;
float x_change = changeRate;
float y_change = 0;

SnakeBody head = new SnakeBody(width/ 2 /gridSize, height/ 2 /gridSize);
void setup() {
  size(400, 400);
  snakeBodies.add(head);
  grow();
  grow();
  frameRate(60);
}

void draw() {

  //Draw grid
  background(100);

  for (int i = 0; i <= width; i += gridSize) {
    stroke(70);
    line(i, 0, i, height);
    line(0, i, width, i);
  } 

  //Move head
  move();

  for (int i = 1; i < snakeBodies.size(); i++) {
    snakeBodies.get(i).prev_x = snakeBodies.get(i).x;
    snakeBodies.get(i).prev_y = snakeBodies.get(i).y;      
    if (i != 0) {
      snakeBodies.get(i).x = snakeBodies.get(i - 1).prev_x;
      snakeBodies.get(i).y = snakeBodies.get(i - 1).prev_y;
    }
    snakeBodies.get(i - 1).drawSnake();
  }
}

void move() {
  head.prev_x = head.x;
  head.prev_y = head.y;

  snakeBodies.get(0).y += y_change;
  snakeBodies.get(0).x += x_change;
}

void grow() {
  SnakeBody prevSnake = snakeBodies.get(snakeBodies.size() - 1);
  snakeBodies.add(new SnakeBody(prevSnake.prev_x, prevSnake.prev_y));
}

void keyPressed() {
  if (key == 'w') {
    y_change = -changeRate;
    x_change = 0;
  }

  if (key == 'a') {
    y_change = 0;
    x_change = -changeRate;
  }

  if (key == 's') {
    y_change = changeRate;
    x_change = 0;
  }

  if (key == 'd') {
    y_change = 0;
    x_change = changeRate;
  }
}
