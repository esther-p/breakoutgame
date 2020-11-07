
// making rectangles tactile
void recttactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    strokeWeight(6);
  } else {
    strokeWeight(4);
  }
}

//reset code
void reset () {
  numberOfFrames = 6;
  gif = new PImage [numberOfFrames]; 
  int g = 0;
  while (g < numberOfFrames) { 
    gif[g] = loadImage("frame_"+g+"_delay-0.45s.gif");
    g = g + 1;
  }

  //load 2nd gif
  numberOfFrames2 = 2;
  gif2 = new PImage [numberOfFrames2];

  int c = 0;
  while (c < numberOfFrames2) {
    gif2[c] = loadImage("frame_"+c+"_delay-0.25s.gif");
    c = c + 1;
  }

  //number of pages
  n = 45;
  x = new int [n]; 
  y = new int [n];
  brickd = 60;
  alive = new boolean [n];
  tempx = 115;
  tempy = 100;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;

    alive[i] = true;
    tempx = tempx + 70;
    if (tempx >= 690) {
      tempy = tempy + 70;
      tempx = 115;
    }
    i = i + 1;
  }

  // intialize key vars
  leftkey = rightkey = false;

  //intialize paddle
  paddlex = width/2;
  paddley = height;
  paddled = 200;

  // intialize ball
  ballx = width/2;
  bally = height/2 + 60;
  balld = 50;

  //intialize ball velocity
  vx = random(-10, 10);
  vy = random(-10, 10);

  // intialize lives and scoring
  lives = 3;
  score = 0;

  // intialize timer
  timer = 100;
}
