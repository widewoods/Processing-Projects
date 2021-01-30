class Circle {
  float rotationSpeed;
  float diameter;
  float theta;

  public PVector center;

  Circle parent;

  public Circle(float rotationSpeed, float radius, Circle parent) {
    this.rotationSpeed = rotationSpeed;
    this.diameter = radius;
    this.parent = parent;

    if (parent == null) {
      center = new PVector(0, 0);
    }
  }

  public void show() {
    ellipse(center.x, center.y, diameter, diameter);
  }

  public void roll() {
    parent.theta += rotationSpeed;

    float r = diameter/2;
    float R = parent.diameter/2;
    float t = parent.theta;

    float x = (r + R) * cos(t);
    float y = (r + R) * sin(t);

    center = new PVector(x, y);
  }

  public PVector getEndPoint() {
    float r = diameter/2;
    float R = parent.diameter/2;
    float t = parent.theta;

    float x = (r + R) * cos(t) - r * cos((R + r) / r * t);
    float y = (r + R) * sin(t) - r * sin((R + r) / r * t);
    
    return new PVector(x, y);
  }
}
