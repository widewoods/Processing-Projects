import ddf.minim.*;

Minim minim;
AudioPlayer mySound;

float angle = PI/4;
float rightAngle = PI/4;
float leftAngle = PI/4;
float leftSound;
float rightSound;
float angleOffset = PI/3;
float len = 0;

float multiplier = 0.67f;

//Color
float c = 0;

void setup() {
  size(1000, 900);
  colorMode(HSB);
  noSmooth();
  stroke(255);
  noCursor();
  
  minim = new Minim(this);
  mySound = minim.loadFile("Sabaton - Long Live The King (Lyrics English & Deutsch).mp3");
  mySound.play();
}

int i = 0;

void draw() {
  background(51);
  translate(width/2, height - 300);
  //float len = map(mySound.right.get(i)* 5, -1, 1, 50, 200);
  leftSound = mySound.left.get(i) + 0.1f;
  rightSound = mySound.right.get(i) + 0.1f;
  float volume = mySound.right.level() + 0.1f;
  len = lerp(len, 350 * volume, 0.06f);
  rightAngle = lerp(rightAngle, 3 *rightSound, 0.01f);
  leftAngle = lerp(leftAngle, 3 * leftSound, 0.01f);
  branch(len);
  
  i += 1;
  if(i == mySound.bufferSize()- 1){
    i = 0;
  }
}

void branch(float len) {
  line(0, 0, 0, -len);
  //c += 1f;
  //c = c % 255;
  stroke(c, 170, 255);
  if (len > 5) {
    pushMatrix();
    translate(0, -len);
    rotate(leftAngle);
    branch(len * multiplier);
    popMatrix();

    pushMatrix();
    translate(0, -len);
    rotate(-rightAngle);
    branch(len * multiplier);
    popMatrix();
  }
}

void keyPressed(){
  //Skip forward/backward by 1sec.
  if(key == CODED){
    if(keyCode == LEFT){
      mySound.skip(-1000);
    }
    if(keyCode == RIGHT){
      mySound.skip(1000);
    }
  }
  
  //Pause/Unpause
  if(key == ' '){
    if(mySound.isPlaying()){
      mySound.pause();
    }
    else{
      mySound.loop();
    }
  }
}
