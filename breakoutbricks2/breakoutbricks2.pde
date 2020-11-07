//Esther Pang
//Blk: 1-2a
//Breakout

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//VARIABLES ==============================
// mode framework
int  mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

//colour palette
color purple =  #E9A9E7;
color darkpink = #F7B7D9;
color pink = #FBC8D4;
color yellow = #F7E8D2;
color orange = #FFBE98;
color salmon = #FFC9C9;
color lightblue = #f0fdfa;
color brightyellow = #ffe3eb;
color darkpurple = #BB77CE;
color darkestpink =#EA90BE;
color redpink = #EA90AD;
color darkyellow = #EDBE67;
color blue = #97CCE5;

//minim
Minim minim;
AudioPlayer paddle, wall, point, intro, gameoverw, gameoverl;

// fonts
PFont sweetfont;

// arrays
int[] x;
int[] y;
boolean [] alive;

// gif variables
PImage[] gif;
int f;
int numberOfFrames;
PImage[] gif2;
int numberOfFrames2;
int f2;

// brick variables
int brickd;
int n; // number of bricks

//planning variables
int tempx; 
int tempy;

// timer 
int timer;

// image variables
PImage seal;
PImage beachball;
PImage cloud;

// scoring and lives
int lives, score;

// paddle and ball variables
float paddlex, paddley, paddled;
float ballx, bally, balld; //ball
float vx, vy; //ball velocity 

// key variables
boolean leftkey, rightkey;

void setup() {
  size(800, 800);
  mode = INTRO;

  // load animated gif
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

  // load images
  seal =loadImage("seal.png");
  beachball=loadImage("beachball.png");
  cloud = loadImage("bluecloud.png");

  //minim
  minim = new Minim(this);
  paddle = minim.loadFile("leftpaddle.wav");
  wall = minim.loadFile("wall.wav");
  point = minim.loadFile("score.wav");
  intro = minim.loadFile("animalcrossingintro.mp3");
  gameoverw = minim.loadFile("gameoverwinner.mp3");
  gameoverl =minim.loadFile("gameover.wav");
  point =minim.loadFile("break.wav");

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

// intialize breaking bricks
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


  // load fonts
  sweetfont = createFont("Mikan DEMO copy.otf", 100);
  textAlign(CENTER, CENTER);
}

void draw () {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error:Mode = " + mode);
  }
}
