import ddf.minim.*;

Minim minim;
AudioPlayer mySound;

float angle = PI/4;
float angleOffset = PI/3;

float multiplier = 0.67f;

//Color
float c = 0;

float a = 0;

void setup() {
  size(1000, 900);
  colorMode(HSB);
  noSmooth();
  stroke(255);
  
  minim = new Minim(this);
  mySound = minim.loadFile("File");
}

int i = 0;
void draw() {
  background(51);
  translate(width/2, height - 300);
  float len = 200;
  angle = map(sin(3* (a + PI/2)/4), -1, 1, 0, 3* PI /4);
  angleOffset = 0;
  branch(len);

  a += 0.01f;
  
  i++;
  if(i == mySound.bufferSize()- 1){
    i = 0;
  }
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
