float angle = PI/4;
float angleOffset = PI/3;

float multiplier = 0.67f;

//Color
float c = 0;

float a = 0;

void setup() {
  size(1000, 900);
  colorMode(HSB);
  //strokeWeight(2);
  noSmooth();
  stroke(255);
}

void draw() {
  background(51);
  translate(width/2, height - 300);
  float len = map(sin(a/2), -1, 1, 70, 190);
  angle = map(sin(3* (a + PI/2)/4), -1, 1, 0, 3* PI /4);
  angleOffset = map(cos(a/10), -1, 1, -PI, PI);
  branch(len);

  a += 0.01f;
}



void branch(float len) {
  line(0, 0, 0, -len);
  c += 1f;
  c = c % 255;
  stroke(c, 170, 255);
  if (len > 5) {
    pushMatrix();
    translate(0, -len);

    rotate(angle);
    branch(len * multiplier);
    popMatrix();

    pushMatrix();
    translate(0, -len);
    rotate(-angle + angleOffset);
    branch(len * multiplier);
    popMatrix();
  }
}
