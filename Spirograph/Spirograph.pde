Circle c1 = new Circle(0, 200, null);
Circle c2 = new Circle(PI/180, 50, c1);

ArrayList<PVector> points = new ArrayList();

void setup() {
  size(600, 600);
  fill(0);
  stroke(255);
  background(0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  strokeWeight(0.5f);
  stroke(255);

  c1.show();
  c2.roll();
  c2.show();
  points.add(c2.getEndPoint());

  stroke(255, 0, 0);
  for (PVector p : points) {
    strokeWeight(1.5f);
    point(p.x, p.y);
  }
}
