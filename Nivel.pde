Button voltar3;

void niveldraw() {
  background(0);
  for (int i=0; i<t-1; i++) {
    p[i].display();
    p[i].anim();
  }
  pa.display();
  pa.anim();


  if (ganhou) {
    vitoria.play();
    if (pa.posX==(n-1)*pa.getW() && pa.posY==(m-1)*pa.getH()) screen=350;
  }

  if (jog==max) perdeu=true;
  if (perdeu==true) {
    derrota.play();
    screen=360;
  }
  fill(255);
  textSize(32);
  text(jog+"/"+max, 20, 685);
  voltar3.desenha();
}

void nivelmp() {
  v=0;
  //Troca das peças
  if (estado) {
    if (mouseX/p[0].getW()==pa.getX() && mouseY/p[0].getH()==pa.getY()) {
      if (p[tempi].getX()==pa.getX()) {
        if (dist(pa.getX()*pa.getW(), pa.getY()*pa.getH(), tempx*p[tempx].getW(), tempy*p[tempy].getH())==pa.getH()) {
          p[tempi].setX(mouseX/p[0].getW()); 
          p[tempi].setY(mouseY/p[0].getH());
          movxg.add(mouseX/p[0].getW());
          movyg.add(mouseY/p[0].getH());
          tempig.add(tempi);
          pa.setX(tempx); 
          pa.setY(tempy);
          jog++;
        } else errado.play();
      } else if (p[tempi].getY()==pa.getY()) { 
        if (dist(pa.getX()*pa.getW(), pa.getY()*pa.getH(), tempx*p[tempx].getW(), tempy*p[tempy].getH())==pa.getW()) {
          p[tempi].setX(mouseX/p[0].getW()); 
          p[tempi].setY(mouseY/p[0].getH());
          movxg.add(mouseX/p[0].getW());
          movyg.add(mouseY/p[0].getH());
          tempig.add(tempi);
          pa.setX(tempx); 
          pa.setY(tempy);
          jog++;
        } else errado.play();
      } else errado.play();
    } else errado.play();
    estado=false;
    p[tempi].select=false;
  } else {
    for (int i=0; i<t-1; i++) {
      if (p[i].hit()) {
        p[i].select=true;
        tempx=p[i].getX(); 
        tempy=p[i].getY(); 
        tempi=i;
        estado=true;
      }
    }
  }

  for (int i=0; i<t-1; i++) {
    if (p[i].posicaoOriginal()) v++;
  }

  if (v==t-1) {
    ganhou=true;
  }

  if (perdeu) derrota.play();

  if (voltar3.hit(mouseX, mouseY)) screen=220;
}
