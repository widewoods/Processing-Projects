//Code from: https://lodev.org/cgtutor/raycasting.html
//Changed some code to fit with processing. Original code is in c++.

int mapWidth = 24;
int mapHeight = 24;
int displayWidth = 640;
int displayHeight = 480;

int[][] worldMap = 
  {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0, 3, 0, 3, 0, 3, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 3, 0, 3, 0, 3, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 0, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 0, 0, 0, 0, 5, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 0, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 0, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

float posX = 22, posY = 21;
float dirX = -1, dirY = 0;
float planeX = 0, planeY = 0.66;

float time = 0;
float oldTime = 0;

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100);
  frameRate(60);
}

void draw() {
  background(51);
  for (int x = 0; x < width; x++) {
    float cameraX = 2f * x / width - 1;
    float rayDirX = dirX + planeX * cameraX;
    float rayDirY = dirY + planeY * cameraX;

    int mapX = (int)posX;
    int mapY = (int)posY;

    float sideDistX;
    float sideDistY;

    float deltaDistX = abs(1 / rayDirX);
    float deltaDistY = abs(1 / rayDirY);
    float perpWallDist;

    int stepX;
    int stepY;

    int hit = 0;
    int side = 0; //x-side: 0, y-side: 1

    if (rayDirX < 0) {
      stepX = -1;
      sideDistX = (posX - mapX) * deltaDistX;
    } else
    {
      stepX = 1;
      sideDistX = (mapX + 1.0 - posX) * deltaDistX;
    }
    if (rayDirY < 0)
    {
      stepY = -1;
      sideDistY = (posY - mapY) * deltaDistY;
    } else
    {
      stepY = 1;
      sideDistY = (mapY + 1.0 - posY) * deltaDistY;
    }

    while (hit == 0) {
      if (sideDistX < sideDistY) {
        sideDistX += deltaDistX;
        mapX += stepX;
        side = 0;
      } else 
      {
        sideDistY += deltaDistY;
        mapY += stepY;
        side = 1;
      }

      if (worldMap[mapX][mapY] > 0) {
        hit = 1;
      }
    }

    if (side == 0) {
      perpWallDist = (mapX - posX + (1 - stepX) / 2) / rayDirX;
    } else {
      perpWallDist = (mapY - posY + (1 - stepY) / 2) / rayDirY;
    }


    int lineHeight = (int)(height / perpWallDist);

    int drawStart = -lineHeight / 2 + height / 2;
    if (drawStart < 0)drawStart = 0;
    int drawEnd = lineHeight / 2 + height / 2;
    if (drawEnd >= height)drawEnd = height - 1;


    //choose wall color
    color _color;
    int brightness = 100;
    switch(worldMap[mapX][mapY])
    {
    case 1:  
      _color = color(0, 100, 100);  
      break; //red
    case 2:  
      _color = color(117, 100, 100);  
      break; //green
    case 3:  
      _color = color(231, 100, 100);   
      break; //blue
    case 4:  
      _color = color(0, 0, 100);  
      break; //white
    default: 
      _color = color(60, 100, 100);
      break; //yellow
    }

    //give x and y sides different brightness
    if (side == 1) {
      brightness = brightness/2;
      _color = color(hue(_color), saturation(_color), brightness);
    }

    stroke(_color);
    //draw the pixels of the stripe as a vertical line
    line(x, drawStart, x, drawEnd);

    float moveSpeed = 0.0002; //the constant value is in squares/second
    float rotSpeed = 0.00005; //the constant value is in radians/second

    if (keyPressed) {
      //move forward if no wall in front of you
      if (key == 'w' || key == 'W')
      {
        if (worldMap[(int)(posX + dirX * moveSpeed)][(int)posY] == 0) {
          posX += dirX * moveSpeed;
        }
        if (worldMap[(int)posX][(int)(posY + dirY * moveSpeed)] == 0) {
          posY += dirY * moveSpeed;
        }
      }
      //move backwards if no wall behind you
      else if (key == 's' || key == 'S')
      {
        if (worldMap[(int)(posX - dirX * moveSpeed)][(int)posY] == 0) {
          posX -= dirX * moveSpeed;
        }
        if (worldMap[(int)posX][(int)(posY - dirY * moveSpeed)] == 0) {
          posY -= dirY * moveSpeed;
        }
      }
      //rotate to the right
      else if (key == 'd' || key == 'D')
      {
        //both camera direction and camera plane must be rotated
        float oldDirX = dirX;
        dirX = dirX * cos(-rotSpeed) - dirY * sin(-rotSpeed);
        dirY = oldDirX * sin(-rotSpeed) + dirY * cos(-rotSpeed);
        float oldPlaneX = planeX;
        planeX = planeX * cos(-rotSpeed) - planeY * sin(-rotSpeed);
        planeY = oldPlaneX * sin(-rotSpeed) + planeY * cos(-rotSpeed);
      }
      //rotate to the left
      else if (key == 'a' || key == 'A')
      {
        //both camera direction and camera plane must be rotated
        float oldDirX = dirX;
        dirX = dirX * cos(rotSpeed) - dirY * sin(rotSpeed);
        dirY = oldDirX * sin(rotSpeed) + dirY * cos(rotSpeed);
        float oldPlaneX = planeX;
        planeX = planeX * cos(rotSpeed) - planeY * sin(rotSpeed);
        planeY = oldPlaneX * sin(rotSpeed) + planeY * cos(rotSpeed);
      }
    }
  }
}
