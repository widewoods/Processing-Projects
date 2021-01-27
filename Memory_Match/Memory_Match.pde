int ROW = 4;
int COL = 13;

int xSize = 54;
int ySize = 100;

HashMap<Integer, String> suitNumber = new HashMap<Integer, String>();

Card[] deck;
Card[] shuffled;

void setup() {
  size(702, 400);
  deck = new Card[COL * ROW];

  suitNumber.put(1, "Spade");
  suitNumber.put(2, "Heart");
  suitNumber.put(3, "Club");
  suitNumber.put(4, "Dia");

  int n = 0;
  for (int i = 1; i <= 13; i++) {
    for (int j = 1; j <= 4; j++) {
      deck[n] = new Card(i, suitNumber.get(j));
      n++;
    }
  }

  //for (int i = 0; i < deck.length; i++) {
  //  int j = floor(random(i, deck.length));
  //  Card temp = deck[i];
  //  deck[i] = deck[j];
  //  deck[j] = temp;
  //}
}

void draw() {
  int n = 0;
  for (int i = 0; i < COL; i++) {
    for (int j = 0; j < ROW; j++) {
      fill(255);
      rect(i * xSize, j * ySize, xSize + 5, ySize);
      textSize(15);
      fill(0);
      text(deck[n].suit, i * xSize, j * ySize + 20);
      n++;
    }
  }
}
