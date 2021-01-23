boolean[][] cells;
int cellSize = 20;
int rowCount;
int columnCount;

void setup() {
  size(400, 400);
  rowCount = height / cellSize;
  columnCount = width / cellSize;

  cells = new boolean[columnCount][rowCount];
}

void draw() {
  for (int x = 0; x < columnCount; x++) {
    for (int y = 0; y < rowCount; y++) {
      if (cells[x][y]) {
        fill(255);
      } else {
        fill(50);
      }

      rect(x * cellSize, y * cellSize, cellSize, cellSize);
    }
  }
}

boolean getNextState(int x, int y) {
  boolean currentState = cells[x][y];
  
  PVector topLeft = new PVector(x - 1, y - 1), topCenter = new PVector(x, y - 1), topRight = new PVector(x + 1, y - 1);
  
  PVector left = new PVector(x - 1, y), right = new PVector(x + 1, y);
  
  PVector bottomLeft = new PVector(x - 1, y + 1), bottomCenter = new PVector(x, y + 1), bottomRight = new PVector(x + 1, y + 1);

  if (x == 0)
  }
