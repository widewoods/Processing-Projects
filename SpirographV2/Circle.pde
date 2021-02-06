class Circle {
  private boolean isFixed;

  private float rollSpeed;
  private float radius;

  private float dist;
  private float angleFormedWithParent;
  private PVector drawPoint;
  private PVector center;

  private Circle parent;

  public Circle(float r, float s, boolean isFixed, Circle parent) {
    radius = r;
    rollSpeed = s;
    this.isFixed = isFixed;
    this.parent = parent;

    if (isFixed) {
      center = new PVector(0, 0);
    }
  }

  public void roll() {
    if (!isFixed) {
      dist += rollSpeed;

      angleFormedWithParent = dist / parent.radius;
      float t = angleFormedWithParent;
      float a = dist / radius;

      center = new PVector(parent.center.x + (parent.radius + radius) * cos(t), parent.center.y + (parent.radius + radius) * sin(t));

      drawPoint = new PVector(center.x - radius * cos(a + t), center.y - radius * sin(a + t));
    }
  }

  public void show() {
    pushMatrix();
    translate(center.x, center.y);
    rotate(angleFormedWithParent);
    ellipse(0, 0, 2 * radius, 2 * radius);
    popMatrix();
    if (!isFixed) {
      pushStyle();
      strokeWeight(2);
      stroke(255, 0, 0);
      point(drawPoint.x, drawPoint.y);
      popStyle();
      stroke(255);
    }
  }
}
