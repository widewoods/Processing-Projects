public class Arm {
  float rotationSpeed;
  float len;

  //Angle that is made from the arm and a horizontal line.
  float angle;

  PVector pivot;
  PVector endPoint;

  Arm parent;

  public Arm(float rotationSpeed, float len, Arm parent) {
    this.rotationSpeed = rotationSpeed;
    this.len = len;
    this.parent = parent;

    if (parent == null) {
      pivot = new PVector(0, 0);
    }
  }

  public void updatePosition() {
    float px = 0;
    float py = 0;
    
    if (parent != null) {
      px = parent.endPoint.x;
      py = parent.endPoint.y;
      pivot = new PVector(px, py);
    }
    angle += rotationSpeed;
    endPoint = new PVector(len * cos(angle) + px, len * sin(angle) + py);
  }

  public void show() {
    line(pivot.x, pivot.y, endPoint.x, endPoint.y);
  }
}
