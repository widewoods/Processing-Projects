void setup(){
  size(640, 640);
  stroke(255);
  
  line(0, 320, 640, 320);
}

int n = 0;
void draw(){
  background(0);
  translate(width/2, height/2);
  for(int x = -width/2; x < width/2; x++){
    float s = sin((x + n) * PI /180);
    float c = cos((x + n) * PI/180);
    int sy = (int)map(s, -1f, 1f, -height/4, height/4);
    int cy = (int)map(c, -1f, 1f, -height/4, height/4);
    point(x, sy);
  }
  
  n++;
}

  
