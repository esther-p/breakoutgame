void intro() {
  //audio  
  gameoverw.pause();
  gameoverl.pause();
  gameoverw.rewind();
  gameoverl.rewind();
  intro.play();

  background(lightblue);
  rectMode(CENTER);
  
  // start button
  stroke(blue);
  strokeWeight(4);
  recttactile(225, 445, 350, 110);
  rect(width/2, height/2 + 100, 350, 110, 60);
  stroke(0);

  //gifs
  imageMode(CENTER); 
  image(gif[f], 650, height-150, 250, 250);
  image(cloud, 400, 190, 600, 300);

  //font
  textFont(sweetfont);
  //text("BREAKOUT", width/2, 200);
  fill(blue);
  textSize(50);
  text("START", width/2, height/2 + 100);
  fill(255);

 // slowing down gifs
  if (frameCount % 15 == 0) {
    f = f + 1;
  }
  if (f == numberOfFrames) f = 0;

// cloud gif
  image(gif2[f2], 350, 190, 650, 600);
  if (frameCount % 10 == 0) {
    f2 = f2 + 1;
  }
  if (f2 == numberOfFrames2) f2 = 0;
 
 // title 
  textSize(75);
  text("BREAKOUT", width/2, 200);
}

void introClicks() {
  if (mouseX > 225 && mouseX < 575 && mouseY > 445 && mouseY < 555) {
    mode = GAME;
  }
}
