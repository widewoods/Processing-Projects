class Platform{
  public float x, y;
  public float x_size, y_size;
  
  public float centerX, centerY;
  
  public Platform(float x, float y, float x_size, float y_size){
    this.x = x;
    this.y = y;
    this.x_size = x_size;
    this.y_size = y_size;
    
    centerX = (2 * x + x_size) / 2;
    centerY = (2 * y + y_size) / 2;
  }
  
  public void show(){
    rect(x, y, x_size, y_size);
  }
}
