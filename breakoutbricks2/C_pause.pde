void pause () {

  // pause window
  background(lightblue);
  textSize(100);
  fill(blue);

  //pause text
  text("PAUSED", width/2, 300);
  textSize(50);
  text("<click to resume>", width/2, 500);
}

void pauseClicks () { 
  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 800) {
    mode = GAME;
  }
}
