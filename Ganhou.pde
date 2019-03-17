Button proximonivel;
Button selecaoniveis;
Button voltar;

PImage proximonivelimg;
PImage selecaoniveisimg;
PImage voltarimg;
PImage ganhoubg;
PImage ellipse;

void ganhousetup() {
  proximonivelimg=loadImage("proximonivel.png");
  selecaoniveisimg=loadImage("selecaodeniveis.png");
  voltarimg=loadImage("voltar.png");
  proximonivel=new Button(width/2 + 150, height/2-50, 200, 100, proximonivelimg, 255);
  selecaoniveis=new Button(width/2 + 150, height/2, 200, 100, selecaoniveisimg, 255);
  voltar=new Button(width/2+150, height/2+50, 200, 100, voltarimg, 255);
}

void ganhoudraw() {
  background(0);
  imageMode(CORNER);
  image(ganhoubg, 0, 0);
  imageMode(CENTER);
  inc_ang=PI/75;
  image(ellipse, width/2+25*cos(ang), height/2+25*sin(ang));
  proximonivel.desenha();
  selecaoniveis.desenha();
  voltar.desenha();

  fill(255);
  textSize(32);
  text("movimentos:", 60, width/2 - tempig.size()*5);

  for (int i=0; i<tempig.size(); i++) {
    textSize(14);
    if (width/2 - tempig.size()*5<500) {
      text("peça "+((int) tempig.get(i)+1)+" foi para:("+(int) movxg.get(i)+","+(int) movyg.get(i)+")", 60, width/2 - tempig.size()*5 + (i+1)*20);
    } else {
      text("peça "+((int) tempig.get(i)+1)+" foi para:("+(int) movxg.get(i)+","+(int) movyg.get(i)+")", 60, width/2 - tempig.size()*5 + (tempig.size()-i)*20);
    }
  }
  
  fill(255);
  textSize(32);
  text(jog+"/"+max, 20, 685);
  
  if (ang>=TWO_PI) ang=0;
  else ang+=inc_ang;
}

void ganhoump() {
  if (proximonivel.hit(mouseX, mouseY)) {
    screen=proxnivel;
    if (proxnivel==320) nivel2setup();
    else if (proxnivel==330) nivel3setup();
    else if (proxnivel==340) nivel4setup();
  }
  if (selecaoniveis.hit(mouseX, mouseY)) screen=220;
  if (voltar.hit(mouseX, mouseY)) screen=210;
}
