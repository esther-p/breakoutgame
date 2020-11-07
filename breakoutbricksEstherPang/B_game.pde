void game () { //<>// //<>//
  background(brightyellow);
  textSize(25);
  fill(0);

  //display lives and score
  fill(darkestpink);
  text(score, width/4-30, 775);
  text("score:", width/4-75, 772); 
  text("Lives:", 675, 772);
  text(lives, 715, 775);
  fill(255); 
 
  // draw paddles
  imageMode(CENTER);
  stroke(255);
  circle(paddlex, paddley, paddled);
  seal.resize(325, 305);
  image(seal, paddlex, paddley+10);
  
  // moving paddles
  if (leftkey == true) paddlex = paddlex - 7;
  if (rightkey == true) paddlex = paddlex + 7;

  //draw ball
  strokeWeight(1);
  circle(ballx, bally, balld);
  beachball.resize(71, 70);
  strokeWeight(2);
  image(beachball, ballx, bally);

  // moving ball
  if (timer < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  //timer
  timer = timer -1;

  //circle collisions
  if (dist(paddlex, paddley, ballx, bally) < paddled/2 + balld/2) {
    vx = (ballx - paddlex)/15;
    vy = (bally- paddley)/15 ;
    paddle.rewind();
    paddle.play();
  }

  // limiting ball
  if (ballx < balld/2 || ballx > width-balld/2) {
    vx = vx*-1;
    wall.rewind();
    wall.play();
  }

  if (bally < balld/2) {
    vy = vy*-1;
  }

  // reseting ball after lives are lost
  if (bally > height + balld) {
    lives = lives - 1;
    ballx = width/2;
    bally = height/2+60;
    timer = 100;
  }

  // limiting paddles
  if (paddlex < paddled/2) paddlex = paddled/2;
  if (paddlex > width-paddled/2) paddlex = width-paddled/2;

  // gameover screen
  if (lives <= 0) 
    mode = GAMEOVER;

if (score >= 45)
mode = GAMEOVER;
  //bricks---------------------------
  fill(0);
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      managebrick(i);
    }
    i = i + 1;
  }
}

void managebrick(int i) {
  //colour bricks
  if (x[i] > 0 && x[i] < 800 && y[i] > 0 && y[i] < 160) { 
    fill(purple);
    stroke(darkpurple);
  }

  if (x[i] > 0 && x[i] < 800 && y[i] > 160 && y[i] < 220) { 
    fill(darkpink);
    stroke(darkestpink);
  }

  if (x[i] > 0 && x[i] < 800 && y[i] > 220  && y[i] < 280) { 
    fill(pink);
    stroke(redpink);
  }

  if (x[i] > 0 && x[i] < 800 && y[i] > 280 && y[i] < 360) { 
    fill(salmon);
 stroke(darkestpink);
}


  if (x[i] > 0 && x[i] < 800 && y[i] > 360 && y[i] < 400) { 
    fill(yellow);
    stroke(darkyellow);
  }

 //breaking bricks
  circle(x[i], y[i], brickd);
  if (dist(x[i], y[i], ballx, bally) < brickd/2 + balld/2) {
    vx = (ballx - x[i])/7;
    vy = (bally- y[i])/7;
    alive[i] = false;
    point.play();
    point.rewind();
    score = score + 1;
  }
} //-------------------------

void gameClicks() {
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = PAUSE;
  }
}
