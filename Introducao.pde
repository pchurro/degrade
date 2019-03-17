Movie intro;
float videoDuration;

void intsetup() {
  intro=new Movie(this, "introducao.mp4");
  intro.play();
  videoDuration=intro.duration();
}

void intdraw() {
  background(255);

  if (intro.time()>=videoDuration - 0.38) {
    musica.play();
    screen=210;
  }

  imageMode(CENTER);
  image(intro, width/2, height/2);
}

void movieEvent(Movie m) {
  m.read();
}
