PImage degradeellipse;
PImage degrade;
PImage bg;
float ang;
float inc_ang=PI/50;
PImage jogarimg;
PImage sobreimg;
PImage sairimg;
Button jogar;
Button sobre;
Button sair;

void menusetup() {
  degradeellipse=loadImage("degradeellipse.png");
  bg=loadImage("menubg.jpg");
  sobreimg=loadImage("sobre.png");
  jogarimg=loadImage("jogar.png");
  sairimg=loadImage("sair.png");
  degrade=loadImage("degrade.png");
  jogar=new Button(width/2, height/2, 200, 100, jogarimg, 255);
  sobre=new Button(width-100, 75, 200, 100, sobreimg, 255);
  sair=new Button(width-100, height-75, 200, 100, sairimg, 255);
}

void menudraw() {
  imageMode(CORNER);
  image(bg, 0, 0);
  imageMode(CENTER);
  image(degrade, 125, 75);
  image(degradeellipse, width/2+25*cos(ang), height/2+25*sin(ang));
  jogar.desenha();
  sobre.desenha();
  sair.desenha();

  if (jogar.hit(mouseX, mouseY)) inc_ang=PI/25;
  else inc_ang=PI/75;
  if (ang>=TWO_PI) ang=0;
  else ang+=inc_ang;
}

void menump(){
  if (jogar.hit(mouseX,mouseY)) screen=220;
  if (sobre.hit(mouseX,mouseY)) screen=230;
  if (sair.hit(mouseX,mouseY)) exit();
}
