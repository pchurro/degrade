PImage nivel1;
PImage nivel2;
PImage nivel3;
PImage nivel4;

void selecaosetup() {
  nivel1=loadImage("nivel1.jpg");
  nivel2=loadImage("nivel2.jpg");
  nivel3=loadImage("nivel3.jpg");
  nivel4=loadImage("nivel4.jpg");
}

void selecaodraw() {
  imageMode(CORNER);
  if (mouseY<width/4) {
    image(nivel1, 0, 0);
  } else if (mouseY>width/4 && mouseY<width/2) {
    image(nivel2, 0, 0);
  } else if (mouseY>width/2 && mouseY<3*width/4) {
    image(nivel3, 0, 0);
  } else if (mouseY>3*width/4) {
    image(nivel4, 0, 0);
  }

  voltar2.desenha();
}

void selecaomp() {
  if (mouseY<width/4) {
    nivel1setup();
    screen=310;
  } else if (mouseY>width/4 && mouseY<width/2) {
    nivel2setup();
    screen=320;
  } else if (mouseY>width/2 && mouseY<3*width/4) {
    nivel3setup();
    screen=330;
  } else if (mouseY>3*width/4) {
    nivel4setup();
    screen=340;
  }
  if (voltar2.hit(mouseX, mouseY)) screen=210;
}
