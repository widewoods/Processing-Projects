int barSize = 10;
int[] numbers = new int[500/barSize];

void setup() {
  size(500, 500);

  frameRate(60);

  //Initialize array
  for (int i = 1; i <= numbers.length; i++) {
    numbers[i- 1] = i;
  }

  //Shuffle array
  for (int i = numbers.length - 1; i >= 0; i--) {
    int j = int(random(0, i));
    swap(i, j);
  }

  drawBars();
}

int i = 0;
int target = numbers.length - 1;

boolean found = false;

void draw() {
  drawBars();

  if (!found) {
    bubbleSort();
  }
}

void bubbleSort() {
  if (numbers[i] > numbers[i + 1]) {
    swap(i, i+1);
  }

  if (target == 0) {
    found = true;
  }

  i++;
  if (i == target) {
    i = 0;
    target--;
  }
}

//Draw bars corresponding to element of array
void drawBars() {
  background(0);

  for (int i = 0; i < numbers.length; i++) {
    int x = i * barSize;
    int h = height/ numbers.length * numbers[i];

    fill(255);    
    rect(x, height -  h, barSize, h);
  }
}

//Swap two numbers in array
void swap(int i, int j) {
  int temp = numbers[i];
  numbers[i] = numbers[j];
  numbers[j] = temp;
}
