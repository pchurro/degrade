PImage ecrasobre;
Button voltar2;

void sobresetup() {
  ecrasobre=loadImage("sobre.jpg");
  voltar2=new Button(width/2, height-25, 200, 100, voltarimg, 255);
}
void sobredraw() {
  background(0);
  imageMode(CORNER);
  image(ecrasobre, 0, 0);
  voltar2.desenha();
}

void sobremp(){
  if (voltar2.hit(mouseX,mouseY)) screen=210;
}
