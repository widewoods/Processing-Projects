Arm arm1 = new Arm(PI/200, 100, null);
Arm arm2 = new Arm(PI/45, 50, arm1);
//Arm arm3 = new Arm(PI/22.5, 25, arm2);
//Arm arm4 = new Arm(PI/30, 50, arm3);

Arm[] arms = {arm1, arm2};

ArrayList<PVector> points = new ArrayList();

void setup() {
  size(600, 600);
  fill(0);
  stroke(255);
  background(0);
  colorMode(HSB);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);

  for(int i = 0; i < arms.length; i++){
    arms[i].updatePosition();
    arms[i].show();
    
    if(i == arms.length - 1){
      points.add(arms[i].endPoint);
    }
  }


  int n = 0;
  for (int i = 0; i < points.size() - 1; i++, n++) {
    line(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);
    stroke(n, 255, 255);
    n %= 255;
  }
}
