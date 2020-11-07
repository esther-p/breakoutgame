void gameover () {
  background(0);
  rectMode(CORNER);
  intro.pause();
 
  // gameover winner screens
  // left winner screen
  if (score == 45) {
    gameoverw.play();
    background(blue);
    stroke(53, 172, 229);
    fill(255);
    rect(25, 25, 750, 750, 100);
    fill(blue);
    textSize(100);
    text("You Won!", 400, 200);
    image(gif[f], width/2, height/2+75, 400, 400);
    if (frameCount % 15 == 0) {
      f = f + 1;
    if (f == numberOfFrames) f = 0;
  }
} else {
    // right winner screen
    background(purple);
    gameoverl.play();
    stroke(178, 112, 232);
    fill(255);
    rect(25, 25, 750, 750, 100);
    fill(pink);
    textSize(100);
    text("You Lost!", 400, 200);
    image(gif[f], width/2, height/2+75, 400, 400);
    if (frameCount % 15 == 0) {
      f = f + 1;
    }
    if (f == numberOfFrames) f = 0;
  }
}

void gameoverClicks() {
   if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = INTRO;
  reset();
 }
}
