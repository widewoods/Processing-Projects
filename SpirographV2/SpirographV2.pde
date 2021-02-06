int numberOfCircles = 6;
float radius = 90;
float radiusRatio = 1/2.5f;
float speed = 0.1f;
float speedRatio = -2f;

ArrayList<PVector> points = new ArrayList();
ArrayList<Circle> circles = new ArrayList();

void setup() {
  size(500, 500);
  noFill();
  stroke(150);
  frameRate(120);

  Circle fixed = new Circle(radius, 0, true, null);
  circles.add(fixed);

  for (int i = 1; i < numberOfCircles; i++) {
    boolean isFixed = false;
    Circle parent = circles.get(i - 1);

    float r = radius * pow(radiusRatio, i);
    float s = speed * pow(speedRatio, i);

    Circle c = new Circle(r, s, isFixed, parent);
    circles.add(c);
  }

  System.out.println(circles.size());
}

void draw() {

  background(0);

  strokeWeight(0.5f);
  translate(width/2, height/2);
  for (Circle c : circles) {
    c.roll();
    c.show();
    //System.out.println(c.center);
  }
  
  strokeWeight(1);

  points.add(circles.get(circles.size()-1).drawPoint);

  stroke(255, 0, 0);
  for (int i = 0; i < points.size() - 1; i++) {
    line(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);
  }
  stroke(150);
}
