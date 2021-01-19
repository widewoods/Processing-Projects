float x = 200, y = 0;
int size = 50;
float acceleration = 0.3;
float y_velocity = 0;

float  jumpHeight = 10;
float moveUnit = 10;

float x_velocity = 0;

boolean isGrounded = false;

boolean keys[] = new boolean[3];

ArrayList<Platform> platforms = new ArrayList();

int LEFT = 1;
int RIGHT = 2;

void setup() {
  size(500, 500);
  frameRate(60);
  noCursor();

  platforms.add(new Platform(300, 300, 100, 20));
}


void draw() {
  background(51);
  rect(x, y, size, size);

  processKeyPress();

  if (!isGrounded) {
    applyGravity();
  }

  if (x + size > width) {
    rect(0, y, x + size - width, size);
    if (x + size > width + size) {
      x = 0;
    }
  }
  if (x < 0) {
    rect(width + x, y, abs(x), size);
    if (x < -size) {
      x = width - size;
    }
  }

  applyFriction();

  for (Platform p : platforms) {
    p.show();
    checkCollision(p);
  }

  x += x_velocity;
}


void applyGravity() {
  y_velocity += acceleration;
  if (y < height - size) {
    y += y_velocity;
  }
  if (y >= height - size) {
    isGrounded = true;
    y = height - size;
    y_velocity = 0;
    return;
  }
}


void applyFriction() {
  if (x_velocity < 0) {
    x_velocity += 1.1;
    x_velocity = floor(x_velocity);
  }
  if (x_velocity > 0) {
    x_velocity -= 1.1;
    x_velocity = floor(x_velocity);
  }
}


void jump() {
  y_velocity = -jumpHeight;

  isGrounded = false;
}


void move(int dir) {
  if (dir == LEFT) {
    x_velocity = -10;
  }
  if (dir == RIGHT) {
    x_velocity = 10;
  }
}


void processKeyPress() {
  if (keys[0] && isGrounded) {
    jump();
    y--;
  }
  if (keys[1]) {
    move(LEFT);
  }
  if (keys[2]) {
    move(RIGHT);
  }
}


void checkCollision(Platform platform) {
  float leftX = platform.x;
  float rightX = platform.x + platform.x_size;
  float topY = platform.y;
  float bottomY = platform.y + platform.y_size;

  float testX = 0, testY = 0;

  float centerX = (2 * this.x + size)/2;
  float centerY = (2 * this.y + size)/2;

  if (x + size <= leftX) {
    testX = leftX;
  } else if (x >= rightX) {
    testX = rightX;
  } else {
    if (y >= bottomY) {
      testY = bottomY;
    } else if (y + size <= topY) {
      testY = topY;
    }
  }

  if (abs(testX - centerX) <= size/2 + 1 && y <= bottomY && y + size >= topY) {
    x_velocity = 0;
  }
  if (abs(testY - centerY) <= size/2 + 1 && x + size >= leftX && x <= rightX) {
    y_velocity = 0;
  }

  System.out.println(testX + " " + centerX);
}


void keyPressed() {
  if (key == ' ') {
    keys[0] = true;
  }
  if (key == 'a' || key == 'A') {
    keys[1] = true;
  }
  if (key == 'd' || key == 'D') {
    keys[2] = true;
  }
}


void keyReleased() {
  if (key == ' ') {
    keys[0] = false;
  }
  if (key == 'a' || key == 'A') {
    keys[1] = false;
  }
  if (key == 'd' || key == 'D') {
    keys[2] = false;
  }
}
