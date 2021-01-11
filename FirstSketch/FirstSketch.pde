void setup(){
  size(500, 400);
}

void draw(){
  background(0);
  
  fill(mouseX / 4, mouseY / 4, 0);
  ellipse(mouseX, mouseY, 50, 50);
}
