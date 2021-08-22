void setup() {
  size(700, 700);
  colorMode(HSB);
  //noLoop();
  //noSmooth();
  
  drawSet(0, 0);
}

float zoom = 2f;
float k = 0;
boolean paused = false;
void draw() { }

void drawSet(float cx, float cy) {
  background(255);
  
  float size = 1f;
  
  for (float x = 0; x < width; x += size) {
    for (float y = 0; y < height; y += size) {
      float a = map(x, 0, width, -zoom, zoom);
      float b = map(y, 0, height, -zoom, zoom);
      
      float ca, cb;
      
      if (cx == 0 && cy == 0) {
        ca = a;
        cb = b;
      }
      else{
        ca = cx;
        cb = cy;
      }

      int n = 0;
      int iterations = 100;
      while (n < iterations) {
        float aa = a * a - b * b + ca;
        float bb = 2 * a * b + cb;

        a = aa;
        b = bb;

        if (a*a + b*b > 16) {
          break;
        }

        n++;
      }

      int c = 0;

      if (n == iterations) {
        fill(0);
      } else {
        c = (int)map(n, 0, 50, 0, 255);
        fill(c, 255, 255);
      }

      noStroke();

      rect(x, y, size, size);
    }
  }
}
