int numberOfCircles = 5;
float radius = 90;
float radiusRatio = 1/4f;
float speed = 0.2f;
float speedRatio = -2f;

boolean returned = false;

ArrayList<PVector> points = new ArrayList();
ArrayList<Circle> circles = new ArrayList();

void setup() {
  size(500, 500);
  noFill();
  stroke(150);
  frameRate(300);

  Circle fixed = new Circle(radius, 0, true, true, null);
  circles.add(fixed);

  for (int i = 1; i < numberOfCircles; i++) {
    boolean isFixed = false;
    boolean isOutside = true;
    Circle parent = circles.get(i - 1);

    float r = radius * pow(radiusRatio, i);
    float s = speed * pow(speedRatio, i);

    Circle c = new Circle(r, s, isFixed, isOutside, parent);
    circles.add(c);
  }
}

int end = ceil(radius * 2 * PI / speed / abs(speedRatio));
int timer = 0;
void draw() {
  translate(width/2, height/2);
  if (!returned) {

    timer += 1;
    if (timer > end) {
      returned = true;
    }

    background(0);

    strokeWeight(0.5f);

    for (Circle c : circles) {
      c.roll();
      c.show();
      //System.out.println(c.center);
    }

    strokeWeight(1);

    points.add(circles.get(circles.size()-1).drawPoint);
  } else {
    background(0);
    noLoop();
  }

  stroke(255, 0, 0);
  for (int i = 0; i < points.size() - 1; i++) {
    line(points.get(i).x, points.get(i).y, points.get(i+1).x, points.get(i+1).y);
  }
  stroke(150);
}
