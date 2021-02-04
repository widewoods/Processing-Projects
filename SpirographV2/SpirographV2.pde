Circle fixed = new Circle(100, 0, true, null);
Circle outside = new Circle(25, 3, false, fixed);

ArrayList<PVector> points = new ArrayList();

void setup() {
  size(400, 400);
  noFill();
  stroke(255);
}

void draw() {

  background(0);

  translate(width/2, height/2);
  fixed.show();

  outside.roll();
  outside.show();
  
  points.add(outside.drawPoint);
  
  for(int i = 0; i < points.size() - 1; i++){
    line(points.get(i).x , points.get(i).y, points.get(i+1).x, points.get(i+1).y);
  }
}
