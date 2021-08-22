import ddf.minim.*;

Minim minim;
AudioPlayer mySound;

float rightAngle = PI/4;
float leftAngle = PI/4;

float leftSound;
float rightSound;

float len = 0;
float lengthMultiplier = 0.67f;

//Can be changed to fit music.
float volumeMultiplier = 350;
float volume;

float colorValue = 0;

void setup() {
  size(1000, 900);
  colorMode(HSB);
  noSmooth();
  stroke(255);
  noCursor();

  minim = new Minim(this);
  //Use song file name.
  //File has to be in data folder of sketch.
  mySound = minim.loadFile("LastGoodbye.mp3");
  mySound.play();
}

//Sample index i
int i = 0;

void draw() {
  background(51);

  leftSound = mySound.left.get(i) + 0.1f;
  rightSound = mySound.right.get(i) + 0.1f;

  rightAngle = lerp(rightAngle, 4 * rightSound, 0.007f);
  leftAngle = lerp(leftAngle, 4 * leftSound, 0.007f);

  volume = (mySound.right.level() + mySound.left.level())/2 + 0.1f;

  len = lerp(len, volumeMultiplier * volume, 0.06f);

  /*
  Adds two trees to the sides
   
   pushMatrix();
   translate(width/2 + 300, height - 200);
   branch(len * 0.7);
   popMatrix();
   
   pushMatrix();
   translate(width/2 - 300, height - 200);
   branch(len * 0.7);
   popMatrix(); 
   */

  //Start drawing tree at center of screen
  translate(width/2, height - 200);
  branch(len);

  setColor();

  i += 1;
  if (i == mySound.bufferSize()- 1) {
    i = 0;
  }
}

void branch(float len) {
  line(0, 0, 0, -len);

  if (len > 5) {
    //Recursive function to draw branches
    pushMatrix();
    translate(0, -len);
    rotate(leftAngle);
    branch(len * lengthMultiplier);
    popMatrix();

    pushMatrix();
    translate(0, -len);
    rotate(-rightAngle);
    branch(len * lengthMultiplier);
    popMatrix();
  }
}

void setColor() {
  //If the average of left and right sound goes over a certain threshold, add to colorValue
  float threshold = 0.4f;
  if ((leftSound + rightSound)/2 > threshold) {
    colorValue += 12;
  } else {
    //Slowly lower color value.

    colorValue = colorValue / 1.03f;
  }

  colorValue = constrain(colorValue, 0, 255);

  //White color to start out
  if (colorValue == 0) {
    stroke(255);
  } else {
    stroke(colorValue, 170, colorValue + 200);
  }
}

void keyPressed() {
  //Skip forward/backward by 1 sec.
  if (key == CODED) {
    if (keyCode == LEFT) {
      mySound.skip(-1000);
    }
    if (keyCode == RIGHT) {
      mySound.skip(1000);
    }
  }

  //Pause / Unpause
  if (key == ' ') {
    if (mySound.isPlaying()) {
      mySound.pause();
    } else {
      mySound.loop();
    }
  }
}
