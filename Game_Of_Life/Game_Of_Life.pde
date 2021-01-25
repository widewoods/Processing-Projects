boolean[][] cells;
boolean[][] nextGenCells;

int cellSize = 10;
int rowCount;
int columnCount;

boolean ALIVE = true;
boolean DEAD = false;

int interval = 3;

void setup() {
  fullScreen();
  frameRate(60);
  stroke(20);

  rowCount = height / cellSize;
  columnCount = width / cellSize;

  cells = new boolean[columnCount][rowCount];
  nextGenCells = new boolean[columnCount][rowCount];

  for (int x = 0; x < columnCount; x++) {
    for (int y = 0; y < rowCount; y++) {
      cells[x][y] = 0.5 > random(0f, 1f);
    }
  }
}

int timer = 0;
boolean paused;

void draw() {
  if (!paused) {
    timer += 1;
  }
  if (timer == interval) {
    for (int x = 0; x < columnCount; x++) {
      for (int y = 0; y < rowCount; y++) {
        nextGenCells[x][y] = getNextState(x, y);
      }
    }

    for (int x = 0; x < columnCount; x++) {
      for (int y = 0; y < rowCount; y++) {
        cells[x][y] = nextGenCells[x][y];
      }
    }

    timer = 0;
  }

  for (int x = 0; x < columnCount; x++) {
    for (int y = 0; y < rowCount; y++) {
      if(cells[x][y] == ALIVE){
         fill(255);
      } else{
        fill(0);
      }

      rect(x * cellSize, y * cellSize, cellSize, cellSize);
    }
  }

  if (paused && mousePressed) {
    int x = (int)map(mouseX, 0, width, 0, columnCount);
    int y = (int)map(mouseY, 0, height, 0, rowCount);
    x = constrain(x, 0, columnCount - 1);
    y= constrain(y, 0, rowCount - 1);

    if (nextGenCells[x][y] == ALIVE) {
      cells[x][y] = DEAD;
    } else {
      cells[x][y] = ALIVE;
    }
  } else if (paused && !mousePressed) {
    for (int x = 0; x < columnCount; x++) {
      for (int y = 0; y < rowCount; y++) {
        nextGenCells[x][y] = cells[x][y];
      }
    }
  }
}

boolean getNextState(int x, int y) {
  int left = x - 1, right = x + 1, top = y - 1, bottom = y + 1;

  if (x == 0) {
    left = columnCount - 1;
  }
  if (x == columnCount -1) {
    right = 0;
  }
  if (y == 0) {
    top = rowCount - 1;
  }
  if (y == rowCount - 1) {
    bottom = 0;
  }

  PVector topLeft = new PVector(left, top), topCenter = new PVector(x, top), topRight = new PVector(right, top);

  PVector midLeft = new PVector(left, y), midRight = new PVector(right, y);

  PVector bottomLeft = new PVector(left, bottom), bottomCenter = new PVector(x, bottom), bottomRight = new PVector(right, bottom);

  PVector[] neighborPos = {topLeft, topCenter, topRight, midLeft, midRight, bottomLeft, bottomCenter, bottomRight};

  int aliveNeighbors = 0;
  for (PVector v : neighborPos) {
    if (cells[(int)v.x][(int)v.y] == ALIVE) {
      aliveNeighbors++;
    }
  }

  if (cells[x][y] == ALIVE) {
    if (aliveNeighbors == 2 || aliveNeighbors == 3) {
      return ALIVE;
    }
  } else {
    if (aliveNeighbors == 3) {
      return ALIVE;
    }
  }
  return DEAD;
}

void keyPressed() {
  if (key == ' ') {
    paused = !paused;
  }
  if (key == 'r' || key == 'R') {
    for (int x = 0; x < columnCount; x++) {
      for (int y = 0; y < rowCount; y++) {
        cells[x][y] = DEAD;
      }
    }
  }
}
